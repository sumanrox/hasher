#!/usr/bin/env python
import argparse
import hashlib
import sys
from tqdm import tqdm
from concurrent.futures import ThreadPoolExecutor
from termcolor import colored

# Function to hash a password using a salt and hash type
def hash_password(password, salt, hash_type, salt_length=None):
    if salt_length is not None:
        salt = salt[:salt_length]
    hash_object = hashlib.new(hash_type)
    hash_object.update((salt + password).encode())
    return hash_object.hexdigest()

# Function to process a single line from the wordlist and write to the output file
def process_line(line, output_file, salt, hash_type, pbar):
    password = line.strip()
    hashed_password = hash_password(password, salt, hash_type)
    output_file.write(f"{password}:{hashed_password}\n")
    pbar.update(1)  # Update the progress bar
    
def banner():
    ascii_art="""
         /$$   /$$                     /$$                          
        | $$  | $$                    | $$                          
        | $$  | $$  /$$$$$$   /$$$$$$$| $$$$$$$   /$$$$$$   /$$$$$$ 
        | $$$$$$$$ |____  $$ /$$_____/| $$__  $$ /$$__  $$ /$$__  $$
        | $$__  $$  /$$$$$$$|  $$$$$$ | $$  \ $$| $$$$$$$$| $$  \__/
        | $$  | $$ /$$__  $$ \____  $$| $$  | $$| $$_____/| $$      
        | $$  | $$|  $$$$$$$ /$$$$$$$/| $$  | $$|  $$$$$$$| $$      
        |__/  |__/ \_______/|_______/ |__/  |__/ \_______/|__/ . ~ version -> 2023.1
    """
    colored_text = colored(ascii_art, 'magenta')
    print(colored_text)
    message ="\tMade with ❤️ via OpenAI by Suman Roy! 🚀🚀🚀"
    colored_text=colored(message, 'yellow')
    print(colored_text,"\n")
    
def main():
    try:
        banner()
        parser = argparse.ArgumentParser(description="Password Hasher, A Fast Rainbow Table Generator")
        parser.add_argument("-w", "--wordlist", required=True, help="Path to the wordlist file")
        parser.add_argument("-o", "--output", required=True, help="Path to the output file")
        parser.add_argument("-t", "--threads", type=int, default=1, help="Number of threads (default: 1)")
        parser.add_argument("-x", "--hash-type", 
                    choices=list(hashlib.algorithms_guaranteed), 
                    default='md5',
                    help="Hash type (default: md5)")
        parser.add_argument("--salt", default='', help="Salt string")
        args = parser.parse_args()
        custom_bar_format = '{desc}: {percentage:3.0f}%|{bar} {n_fmt}/{total_fmt} [{elapsed}<{remaining}, {rate_fmt}]'

        with open(args.wordlist, 'r', encoding='latin-1') as wordlist_file, open(args.output, 'w') as output_file:
            lines = wordlist_file.readlines()
            total_lines = len(lines)
            print(f"[###] Generating Rainbow Tables\n")
            with ThreadPoolExecutor(max_workers=args.threads) as executor:
                # Use tqdm for a progress bar
                with tqdm(total=total_lines, desc="[!] Hashing Passwords", bar_format=custom_bar_format, dynamic_ncols=True) as pbar:
                    # Submit tasks for hashing
                    futures = []
                    for line in lines:
                        futures.append(executor.submit(process_line, line, output_file, args.salt, args.hash_type, pbar))

                    # Wait for all futures to complete
                    for future in futures:
                        future.result()

        print("[✔️] Password hashing completed.")
    except KeyboardInterrupt:
        print("\n[❌] Keyboard interrupt received. Aborting...")
        sys.exit(1)
    except Exception as e:
        print("\nException Occured: %s" % e)
        sys.exit(1)

if __name__ == "__main__":
    main()
