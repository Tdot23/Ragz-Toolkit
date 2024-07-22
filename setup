#!/bin/bash

# Function to check if the script is run as root
check_root() {
	if [ "$EUID" -ne 0 ]; then
		echo
		echo -e "\e[31m[!]\e[0m Please run as root"
		echo
		exit 1
	fi
}

# Function to set up the environment and install dependencies
setup() {
	echo
	echo -e "\e[34m[+]\e[0m Updating repositories"
	sleep 1
	echo
	sudo apt-get update
	sleep 1
	echo
	echo -e "\e[34m[+]\e[0m Installing dependencies"
	sleep 1
	echo
	sudo apt install -y hping3 hydra nmap wifiphisher iw john
	sleep 1
	echo
	echo -e "\e[32m[+]\e[0m Done!"
	exit 0
}

# Check if running as root
check_root

# Execute the setup
setup
