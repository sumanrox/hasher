

         /$$   /$$                     /$$                          
        | $$  | $$                    | $$                          
        | $$  | $$  /$$$$$$   /$$$$$$$| $$$$$$$   /$$$$$$   /$$$$$$ 
        | $$$$$$$$ |____  $$ /$$_____/| $$__  $$ /$$__  $$ /$$__  $$
        | $$__  $$  /$$$$$$$|  $$$$$$ | $$  \ $$| $$$$$$$$| $$  \__/
        | $$  | $$ /$$__  $$ \____  $$| $$  | $$| $$_____/| $$      
        | $$  | $$|  $$$$$$$ /$$$$$$$/| $$  | $$|  $$$$$$$| $$      
        |__/  |__/ \_______/|_______/ |__/  |__/ \_______/|__/ . ~ version -> 2023.1
        
        Made with ❤ via OpenAI by Suman Roy! 🚀🚀🚀

# Hasher | A Fast Rainbow Table Generator
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Python](https://img.shields.io/badge/Python-3.x-blue.svg)](https://www.python.org/)
[![Shell](https://img.shields.io/badge/Shell-Bash%20%26%20Zsh-green.svg)](https://en.wikipedia.org/wiki/Unix_shell)
 

A fast and efficient password hashing tool that generates rainbow tables using various cryptographic hash functions. This tool is designed to help security professionals and enthusiasts generate rainbow tables for password cracking or auditing purposes. Use precomputed hash for faster decryption, don't waste time on cracking!!!

## Features
![Product-Demo](./product-demo/product-video.gif)

- Supports a variety of hash functions, including MD5, SHA-256, SHA-512, and more.
- Multi-threaded for faster rainbow table generation.
- Customizable salt for password hashing.
- Progress bar using `tqdm` to monitor hashing progress.

## Getting Started

### Prerequisites

- Python 3.x
- `tqdm` library for the progress bar
- `termcolor` library for colorful text (optional)

You can install the required Python libraries using `pip`:

```bash
sudo pip install tqdm termcolor hashlib argparse
```
### Installation
No fuss installation method
```bash
git clone https://github.com/sumanrox/hasher.git && cd hasher
chmod +x install.sh && ./install.sh
```

### Usage
If you are using a salt for your passwords
```bash
python hasher.py -w wordlist.txt -o output.txt -t 100 -x sha256 --salt 'mysalt'
```

If you are not using salt for your passwords
```bash
python hasher.py -w wordlist.txt -o output.txt -t 100 -x sha256
```


#### If you have installed via the installation script
```bash
hasher w wordlist.txt -o output.txt -t 100 -x sha256 --salt 'mysalt'
# or
hasher -w wordlist.txt -o output.txt -t 100 -x sha256
```

### Problem with Bigger wordlists > 1 GB
When using the hasher program on bigger wordlists, it eats up the entire ram, so rather than processing a bigger file like over 1 GB, we rather split the files and then do process those subfiles and then merge them with sort while removing duplicates. All the user needs to do is chmod +x on this hashbigfiles.bash and run the script with appropriate arguments.
```bash
# Make it executable
chmod +x hashbigfiles.bash
# Execute it
./hashbigfiles.bash /path/to/wordlists HASH_TYPE NUMBER_OF_THREADS
```


### Arguments
```bash
-h or --help: Display help menu
-w or --wordlist: Path to the wordlist file containing passwords to hash.
-o or --output: Path to the output file where hashed passwords will be saved.
-t or --threads: Number of threads for multi-threading (default: 1).
-x or --hash-type: Hash type to use (e.g., md5, sha256).
--salt: Optional salt string to use for password hashing.
```

### Contributing
Contributions are welcome! If you have any improvements or suggestions, feel free to open an issue or create a pull request.

### License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## Acknowledgments

I would like to express my gratitude to the following open-source libraries and tools that made this project possible:

- [tqdm](https://github.com/tqdm/tqdm): A fast, extensible progress bar for Python and CLI, used to provide a progress bar during password hashing.

- [hashlib](https://docs.python.org/3/library/hashlib.html): A Python library for secure hash and message digest algorithms, used for password hashing.

- [argparse](https://docs.python.org/3/library/argparse.html): The argparse module makes it easy to write user-friendly command-line interfaces, used for parsing command-line arguments.

- [termcolor](https://pypi.org/project/termcolor/): A simple Python module for ANSI color formatting of output in the terminal, used for colorful console messages.

We greatly appreciate the contributions of the developers and maintainers of these projects to the open-source community.



### Made with ❤️ by Suman Roy
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/sumanrox/)
