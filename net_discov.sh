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
	#read the users input and store subnet into variable subnet
	read -p "Enter subnet to ping network: " subnet
	
	#clears the output in both txt files each time. 
	> results.txt
	> host_up.txt

	#for loop that iterates through the host 
	for host in {1..254}
	do 
		ip="$subnet.$host"

		#pings the network and sends results to txt file
		ping -c 1 -w 1 $ip >> results.txt
		
		#used to check exit codes and sends output to the txt file. 
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
 	echo "Results are in results.txt"
	echo "Hosts reached found in host_up.txt"
 }

arp_scan(){
	#read the users input and store subnet into variable subnet 
 	read -p "Enter the subnet: " subnet
	
	# conducts an arp-scan to find the mac address of each device on the network
	sudo arp-scan $subnet
}

net_mapper(){
	#read the users input and stores input into variable host
	read -p "Enter host to scan: " host

 	#read the users input and stores file name into variable
	read -p "Enter output file name: " filename

	#nmap scan completes TCP Scan and sends ouput to file
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
	#read the users input and stores input into variable DNS 
	read -p "Enter host name: " DNS
	
 	#completes a DNS lookup
	nslookup $DNS
}

use_netstat() {
	# use netstat to find all running processes listening on a tcp port with the proccess id.
	netstat -tulnp
}

tcpdump(){
	#tcp dump to capture 50 packets on the provide network interface
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

