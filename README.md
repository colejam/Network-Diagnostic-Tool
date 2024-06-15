# Network Diagnostic Tool

This project provides a comprehensive Bash script for network diagnostics, integrating several essential network tools to assist with network configuration, monitoring, and troubleshooting. The script offers a user-friendly, menu-driven interface, making it accessible for both novice and experienced users. This tool can be especially useful for system administrators and network engineers who need to perform various network diagnostic tasks efficiently.

## Features

1. **Display Network Configuration**: Uses `ifconfig` to display detailed information about the network interfaces on the system.
2. **Ping a Specific Host**: Allows the user to ping a specific IP address to check its reachability and latency.
3. **Ping a Subnet**: Pings all hosts in a specified subnet to determine which are reachable and which are not, saving the results to files.
4. **ARP Scan**: Utilizes `arp-scan` to perform a detailed scan of a specified subnet, displaying the ARP table.
5. **Network Mapper**: Employs `nmap` to conduct a TCP scan on a specified host, saving the results to a user-defined file.
6. **DNS Lookup**: Uses `nslookup` to perform DNS lookups for specified hostnames, providing detailed DNS information.
7. **View Network Connections**: Displays active network connections using `netstat`, including listening ports and the associated processes.
8. **Capture Network Traffic**: Leverages `tcpdump` to capture network traffic on a specified interface, saving the output to a `.pcap` file for further analysis.

## Usage

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/colejam/network-diagnostic-tool.git
   cd network-diagnostic-tool

2. **Make the Script Executable**
   ```bash
   chmod +x net_discov.sh

3. **Run Script**
   ```bash
   ./net_discov.sh

**Yes, this is hosted on a virtual machine!**
<img width="1440" alt="Untitled" src="https://github.com/colejam/Network-Diagnostic-Tool/assets/163930716/6c93ff72-e2dc-4419-96c7-6c107d9961e3">

<img width="1440" alt="Screenshot 2024-06-15 at 7 46 07 PM" src="https://github.com/colejam/Network-Diagnostic-Tool/assets/163930716/b7351ca6-e9c1-434f-bba7-49d35e367c1a">

<img width="1440" alt="Screenshot 2024-06-15 at 7 45 32 PM" src="https://github.com/colejam/Network-Diagnostic-Tool/assets/163930716/93416621-04ef-4b52-b25a-65c57a3421f7">


