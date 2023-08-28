#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 input_wordlist input_hashtype input_mthreads"
    exit 1
fi

# Path to the input wordlist
input_wordlist="$1"
input_hashtype="$2"
input_mthreads="$3"

echo -e "[!] Setting Wordlist \t\t\t: $input_wordlist"
echo -e "[!] Setting HashType \t\t\t: $input_hashtype"
echo -e "[!] Setting Threads \t\t\t: $input_mthreads"
echo -e "----------------------------------------------------------------"

# Maximum number of lines per subfile (2-3 million lines)
# Change the values as per your computer's capabilities
max_lines_per_subfile=$((3 * 1000000)) # 3 million lines

# Calculate the total number of lines in the input wordlist
total_lines=$(wc -l < "$input_wordlist")

# Calculate the number of subfiles needed to stay within the limit
num_subfiles=$(( (total_lines + max_lines_per_subfile - 1) / max_lines_per_subfile ))

echo -e "[!] Total lines in the wordlist:\t: $total_lines"
echo -e "[!] Max lines per subfile\t\t: $max_lines_per_subfile"
echo -e "[!] Number of subfiles needed:\t\t: $num_subfiles"
echo -e "----------------------------------------------------------------"

# Make a Temporary directory for splits
local wordlist_data_temp_dir="/tmp/data/wordlist"
mkdir -p /tmp/data/wordlist
echo -e "[!] Spliting the file now..."
# Split the wordlist into subfiles
split -n l/$num_subfiles $input_wordlist "wordlists_data_"

# Start the hasher program
echo "[!] Starting the hasher on the subfiles"
echo "----------------------------------------------------------------"

# For loop for hasing all the files
for file in "$wordlist_data_temp_dir"/wordlist_data_*; do
  filename_hashed="${file}_hashed"
  hasher -x $input_hashtype -t $input_mthreads -w "$file" -o "$filename_hashed"
  echo "Hashed $file and saved the result in $filename_hashed"
done

# Now Find and Sort Out the duplicate entries in the files
sort -Ru $wordlist_data_temp_dir/wordlist_data_*_hashed | tee $wordlist_data_temp_dir/final_data.txt
mv $wordlist_data_temp_dir/final_data.txt $(pwd)/hashedData.txt
# Clean up the temporary files
rm -rf $wordlist_data_temp_dir

echo "----------------------------------------------------------------"
echo "Saved As Hashed Data"
echo "[!] Done!"
echo "----------------------------------------------------------------"
