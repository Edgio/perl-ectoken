#!/bin/bash

install_cpan_modules() {
	sudo cpanm Crypt::GCM
}


install_additional_apt_packages() {
	sudo apt-get install -y libbytes-random-secure-perl libcrypt-rijndael-perl libmime-base64-urlsafe-perl
}

install_cpan_modules
install_additional_apt_packages
