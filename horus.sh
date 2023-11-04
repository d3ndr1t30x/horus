#!/bin/bash



# Banner Art

echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⣤⣴⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀"

echo "⠀⠀⠀⠀⠀⣀⣴⣾⠿⠛⠋⠉⠁⠀⠀⠀⠈⠙⠻⢷⣦⡀⠀⠀⠀⠀⠀⠀"

echo "⠀⠀⠀⣤⣾⡿⠋⠁⠀⣠⣶⣿⡿⢿⣷⣦⡀⠀⠀⠀⠙⠿⣦⣀⠀⠀⠀"

echo "⠀⢀⣴⣿⡿⠋⠀⠀⢀⣼⣿⣿⣿⣶⣿⣾⣽⣿⡆⠀⠀⠀⠀⢻⣿⣷⣶⣄⠀"

echo "⣴⣿⣿⠋⠀⠀⠀⠀⠸⣿⣿⣿⣿⣯⣿⣿⣿⣿⣿⠀⠀⠀⠐⡄⡌⢻⣿⣿⡷"

echo "⢸⣿⣿⠃⢂⡋⠄⠀⠀⠀⢿⣿⣿⣿⣿⣿⣯⣿⣿⠏⠀⠀⠀⠀⢦⣷⣿⠿⠛⠁"

echo "⠀⠙⠿⢾⣤⡈⠙⠂⢤⢀⠀⠙⠿⢿⣿⣿⡿⠟⠁⠀⣀⣀⣤⣶⠟⠋⠁⠀⠀⠀"

echo "⠀⠀⠀⠀⠈⠙⠿⣾⣠⣆⣅⣀⣠⣄⣤⣴⣶⣾⣽⢿⠿⠟⠋⠀⠀⠀⠀⠀⠀⠀"

echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠛⠙⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"

echo "         Horus : By D3ndr1t30x     "



# Help menu

if [ "$#" -ne 1 ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then

  echo -e "\nUsage: $0 <nmap_report_file>"

  echo -e "\nDescription: This script extracts open port numbers from an Nmap report file, prompts for a hostname or IP address, and initiates an Nmap scan with version enumeration on the specified ports."

  echo -e "\nOptions:"

  echo -e "  <nmap_report_file>  Path to the Nmap report file containing open port information."

  echo -e "  -h, --help          Display this help message."

  exit 1

fi



nmap_report_file="$1"



# Check if the file exists

if [ ! -f "$nmap_report_file" ]; then

  echo "File not found: $nmap_report_file"

  exit 1

fi



# Extract port numbers from the Nmap report using grep and awk

port_numbers=$(grep -E "^[0-9]+/tcp" "$nmap_report_file" | awk -F'/' '{print $1}')



# Display the extracted port numbers

echo -e "\nList of open port numbers:"

echo "$port_numbers"



# Append port numbers to numbers.txt

echo "$port_numbers" >> numbers.txt



# Prompt the user for a hostname or IP address

read -p "Enter the hostname or IP address for Nmap scan: " target



# Prompt the user for an output file name

read -p "Enter the output file name: " output_file



# Check if the numbers.txt file exists

if [ -f "numbers.txt" ]; then

  # Read the port numbers from numbers.txt and format them as a comma-separated list

  port_numbers=$(cat numbers.txt | tr '\n' ',' | sed 's/,$//')



  # Run Nmap scan on the specified ports and target, with output to the specified file

  nmap -p "$port_numbers" -sV -sC -oN "$output_file" "$target"



  # Delete the numbers.txt file after the Nmap scan is completed

  rm -f numbers.txt

else

  echo "numbers.txt file not found. Please run the script with a valid Nmap report file first."

fi

