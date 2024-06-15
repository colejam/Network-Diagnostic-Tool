#!/bin/bash 
#header is used to describe the purpose of the script
header() {
	echo "Network Diagnostic"
	echo "=================="
}

net_config() {
	#network interface configuration display
	ifconfig
}

ping_host() {
	#read the users input and store it into the variable host
	read -p "Enter host IP to ping: " host

	#ping the specific host entered
	ping -c 5 $host
	
	#used to check exit codes 
	if [ "$?" -eq 0 ];
                then
                        echo "Host $host is reachable" 
                else
                        echo "Host $host is unreachable"

                fi
	
}

ping_net() {
	#read the users input and store subnet into variable
	read -p "Enter subnet to ping network: " subnet
	
	
	> results.txt
	> host_up.txt

	#for loop that iterates through the host 
	for host in {1..254}
	do 
		ip="$subnet.$host"

		#pings the network and sends results to txt file
		ping -c 1 -w 1 $ip >> results.txt
		
		#used to check exit codes and executes the statements
		if [ "$?" -eq 0 ]; 
		then 
			echo "Host $ip is reachable" 
			echo "$ip" >> host_up.txt
			echo "Results are in results.txt"
			echo "Hosts reached found in host_up.txt"
		else 
			echo "Host $ip is unreachable"

		fi
	done	
}

arp_scan(){
	#read the users input and store subnet into variable
 	read -p "Enter the subnet: " subnet
	
	# shows arp table with verbose output and sorts the arp table
	sudo arp-scan $subnet
}

net_mapper(){
	read -p "Enter host to scan: " host
	
	#clear past scan results
	read -p "Enter output file name: " filename

	#nmap scan completes TCP Scan 
	sudo nmap -sT -T4 $host -oN $filename
	
	#used to check exit codes 
	if [ $? -eq 0 ]
	then
		echo "success"
	else
		echo "failed"
	fi
}

use_nslookup() {
	read -p "Enter host name: " DNS

	nslookup $DNS
}

use_netstat() {
	netstat -tulnp
}

tcpdump(){
	read -p "Enter the network interface: " interface
	read -p "Enter the output file name: " filename
	sudo tcpdump -i $interface -c 50 -w $filename 
}
#what will be displayed after the terminal is cleared
displayname(){
	echo "===================="
	echo "Choose Network Tool:"	
	echo "===================="
	echo "1. Network Interface Configuration"
	echo "2. Ping a host"
	echo "3. Ping all host on a network"
	echo "4. ARP Scan"
	echo "5. Nmap" 
	echo "6. DNS Lookup"
	echo "7. Netstat"
	echo "8. TCPdump"
	echo "9. Exit"	

}
while true;
do
	clear
	header
	displayname
	read -p "Enter # for Network Tool [1-9]: " choice 

	case $choice in 
	
		1)	
			net_config
			;;
		2)	
			ping_host
			;;
		3)
			ping_net
			;;
		4)
			arp_scan
			;;
		5)
			net_mapper
			;;
		6)
			use_nslookup
			;;
		7)
			use_netstat
			;;
		8)
			tcpdump
			;;
		9)
			echo "Exiting ..."
			break
			;;
		*)
			echo "Invalid choice. Try again."
			;;

		esac

		echo " "
		read -p "Press Enter to continue ..." dummy

done

