# Subdomain-Enumeration-Script
This Bash script automates the process of subdomain enumeration by leveraging various powerful tools such as Subfinder, Assetfinder, Amass, Findomain, dnsdumpster, and altdns. It efficiently collects subdomains for a given target domain, making it a valuable asset for reconnaissance and security assessment.

## **Installation**
Clone the Repository:
> git clone https://github.com/yourusername/subdomain-enumeration-script.git
> cd subdomain-enumeration-script

**Ensure Go is Installed:**
This script utilizes Go modules to install required tools. Ensure Go is installed and properly configured on your system. You can install Go from <a href="https://go.dev/doc/install">here</a>.

**Run the Script:**
> ./subdomain_enumeration.sh

**Requirements**
Go Programming Language: Ensure Go is installed on your system.
Internet Connection: The script requires an active internet connection to fetch and install necessary tools.

## **Usage**
**Execute the Script:**
Run the script and follow the prompts to enter the target domain.

**Input Target Domain:**
Upon running the script, you'll be prompted to enter the target domain. Provide the domain name and press Enter.

**View Results:**
The script will perform subdomain enumeration using various tools and consolidate the results into a single output file named combined_output.txt. You can find the results in this file.

**Tools Used**
- Subfinder: A tool designed to gather subdomains using passive online sources.
- Assetfinder: Utilized for retrieving subdomains from certificate transparency logs and web archives.
- Amass: A versatile tool for network mapping and attack surface enumeration.
- Findomain: Specialized in finding subdomains through various methods including web scraping.
- dnsdumpster: A tool for retrieving DNS information and subdomains from DNSDumpster.com.
- Altdns: Used for generating permutations and alterations of subdomains to discover additional domains.
