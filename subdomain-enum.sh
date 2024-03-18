#!/bin/bash

# Function to check if a command is available
check_command() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install a tool using go get
install_tool() {
    echo "Installing $1..."
    go get -u "$1"
}

# Check and install Subfinder
if ! check_command "subfinder"; then
    install_tool "github.com/projectdiscovery/subfinder/v2/cmd/subfinder"
fi

# Check and install Assetfinder
if ! check_command "assetfinder"; then
    install_tool "github.com/tomnomnom/assetfinder"
fi

# Check and install amass
if ! check_command "amass"; then
    install_tool "github.com/OWASP/Amass/v3/..."
fi

# Check and install findomain
if ! check_command "findomain"; then
    install_tool "github.com/Edu4rdSHL/findomain"
fi

# Check and install dnsdumpster
if ! check_command "dnsdumpster"; then
    install_tool "github.com/zerodois/dnsdmpstr"
fi

# Check and install altdns
if ! check_command "altdns"; then
    install_tool "github.com/infosec-au/altdns"
fi

# Prompt user for target domain
read -p "Enter the target domain: " target_domain

# Output file names
subfinder_output="subfinder_output.txt"
assetfinder_output="assetfinder_output.txt"
amass_output="amass_output.txt"
findomain_output="findomain_output.txt"
dnsdumpster_output="dnsdumpster_output.txt"
altdns_output="altdns_output.txt"
combined_output="combined_output.txt"

# Run Subfinder
subfinder -d "$target_domain" -o "$subfinder_output"

# Run Assetfinder
assetfinder --subs-only "$target_domain" > "$assetfinder_output"

# Run amass
amass enum -d "$target_domain" -o "$amass_output"

# Run findomain
findomain --target "$target_domain" --output "$findomain_output"

# Run dnsdumpster
dnsdumpster -u "$target_domain" -o "$dnsdumpster_output"

# Run altdns
altdns -i "$subfinder_output" -o "$altdns_output" -w words.txt -r -s "$altdns_output"

# Combine results into a single file
cat "$subfinder_output" "$assetfinder_output" "$amass_output" "$findomain_output" "$dnsdumpster_output" "$altdns_output" > "$combined_output"

echo "Subdomain enumeration completed! Results saved in '$combined_output'."
