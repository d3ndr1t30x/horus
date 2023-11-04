# Nmap Enumeration Script

## Description
The Nmap Enumeration Script is a Bash script designed to simplify the process of extracting open port numbers from an Nmap report file, prompting for a hostname or IP address, and initiating an Nmap scan with version enumeration on the specified ports. It can be a handy tool for security professionals and network administrators.

## Features
- Extracts open port numbers from an Nmap report file.
- Prompts for a hostname or IP address to target.
- Prompts for an output file name for the Nmap scan results.
- Runs an Nmap scan with version enumeration on the specified ports.
- Deletes the temporary numbers.txt file after the Nmap scan is completed to keep your system clean.

## Usage
1. Download the script or clone the repository to your local machine.
2. Make sure you have Nmap installed on your system.
3. Run the script by providing the path to an Nmap report file as an argument:
