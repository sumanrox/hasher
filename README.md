# Hasher | A Fast Rainbow Table Generator
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Python](https://img.shields.io/badge/Python-3.x-blue.svg)](https://www.python.org/)
[![Shell](https://img.shields.io/badge/Shell-Bash%20%26%20Zsh-green.svg)](https://en.wikipedia.org/wiki/Unix_shell)
 

A fast and efficient password hashing tool that generates rainbow tables using various cryptographic hash functions. This tool is designed to help security professionals and enthusiasts generate rainbow tables for password cracking or auditing purposes.

![Product-Demo](./product-demo/product-video.gif)

## Features

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


### Acknowledgments
Special thanks to the tqdm and termcolor libraries for their contributions to this project.


### Made with ❤️ by Suman Roy
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/sumanrox/)
