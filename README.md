# polkish
a very very simple library for exec wrapper between policykit's and sudo like programs

## Installation
```sh
git clone https://github.com/lazypwny751/polkish.git
cd polkish
sudo make all
```

## Usage
```sh
# in bash script
source /usr/local/lib/bash/5.1/polkish.sh
polkish.exec whoami
# or directly on command line:
polkish "make" "install"
polkish make uninstall
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[GPL3](https://choosealicense.com/licenses/gpl-3.0/)
