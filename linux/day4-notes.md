***********************************************************************
DAY-4
***********************************************************************

OSI Model (Open Systems Interconnection)

→ framework that breaks down how data travels from one device to another over a network into 7 distinct layers.

L7 - Application - where user actually interacts
(Browsers, HTTP, HTTPS, SSH, FTP, SMTP)

L6 - Presentation - translates data into readable format
(JSON, XML, encryption, decryption)

L5 - Session - Manages connection between devices (Authentication)

L4 - Transport - moves data reliably -
TCP/UDP - Here, port 80 or 8080 lives.

L3 - Network - DNS resolution ,IP, ICMP, routing

L2 - Data Link - Comm bw directly linked devices - MAC address

L1 - Physical - Denotes physical wires and fibres or wifi

******************

TCP Handshake (3-Way Handshake)

s1: SYN (Synchronise)
The Action: The client (e.g., your browser) sends a packet with a SYN flag turned on to the server - requesting for a connection.

s2: SYN-ACK (Synchronise-Acknowledge)
The Action: The server receives the request and replies with a packet carrying both SYN and ACK flags - acknowledges the request and request back for connection.

s3: ACK (Acknowledge)The Action: The client receives the server's reply and sends a final ACK packet back. - accepts server request and the data transmission proceeds.

**************************
IP Addresses

IPv4 address binary format : 11000000.10101000.00000001.00000001
Same IP address decimal format : 192.168.1.1

For an IP Address - 192.168.1.10/24 (CIDR notation)

• 192.168.1.10 - Unique identifier assigned to specific device.
• /24 bits (Subnet Mask) = Network Portion - belongs to Network ID

- Remaining 8 bits = Host Portion - assigned to individual host devices.

so, total hosts aval → (2^8) - 2 = 254

2 is subtracted as they are reserved

Network address: 192.168.1.0 - identifies the bounds of subnet
Broadcast:       192.168.1.255 - reserved to communicate to every single host on the network simultaneously

192.168.1.0
The Road Name (Network ID). No devices allowed.

192.168.1.1 to 192.168.1.254
The Houses (Usable IPs for your servers/routers).

192.168.1.255
The Megaphone (Broadcast Address). No devices allowed.

- Number of addresses = 2^(32-Subnet Mask)

*********************

IP Classes:

Class A
First octet range : 1-126 with subnet /8.
First bit of each IP has to be 0.
Networks - 126
Hosts - 2^(32-8) = 2 ^ 24 ~ 16.7 million

Class B -
First Octet Range : 128 to 191 with subnet /16.
First two bits of each IP has to be 10.
Networks - 16,384
(128.0-128.255, 129.0-129.255,... to 191.0-191.255) = 64 x 256
Hosts - 2^(32-16) = 2 ^ 16 = 65,534

Class C
First octet range : 192-223 with subnet /24.
First bit of each IP has to be 110.
Networks ~ 2.1 million
(192.0.0-192.255.255...223.0.0-223.255.255) = 32 x 256 x 256
Hosts - 2^(32-24) = 2 ^ 8 = 256

***********************

PUBLIC VS PRIVATE IP

Public IP Addresses are unique globally and can be reached from anywhere on the internet.

Private IP Addresses are reserved for internal, closed networks

Class A : 10.0.0.0 to 10.255.255.255 ~16.7 Million
Large corporate networks, enterprise clouds (AWS VPCs)

Class B : 172.16.0.0 to 172.31.255.255 ~1.04 Million
Mid-sized businesses, Docker containers, virtualization

Class C : 192.168.0.0 to 192.168.255.255 ~65,536
Home routers, small offices, local app server setups


*********************

NAT - Network Address Translation

Technology used by network routers to map multiple private IP addresses inside a local network to a single public IP address.


Saves IPv4 Addresses and adds a Security Layer

**********************

Firewall

It is a network system that governs the incoming and outgoing traffic as per predefined rules.

ex: a web server, allow port 80/8080(Http/Https) but deny 22/3306(database ports)


sudo ufw allow 80/tcp → Opens port 80 for HTTP traffic
sudo ufw deny 22/tcp → Blocks port 22 for SSH traffic  

A Security Group acts as a virtual firewall for AWS resources such as EC2 instances.

***********************

Load Balancer

distributes incoming traffic across backend servers.

              ┌── Server 1
              |
User → LB ────┼── Server 2
              |
              └── Server 3
Benefits:

High availability
Scalability
Traffic distribution
Health checks
Failure handling

***********************

Netcat

nc -vz 127.0.0.1 80 : checks if port is open/closed

v-verbose
z-zero I/O

*************************

Troubleshooting Methodology

SSH works
   ↓
Server is reachable
   ↓
Check application : sudo systemctl status app_name
   ↓
Check port : sudo ss -tulpn | grep :8080
   ↓
Check listening interface : sudo ss -tulpn | grep :8080
   ↓
Check local connectivity : curl http://localhost:8080
   ↓
Check OS firewall
   ↓
Check AWS Security Group
   ↓
Check NACL/routing if relevant
   ↓
Check application logs : sudo journalctl -u app_name -n 10
-
