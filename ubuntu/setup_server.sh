# Change hostname
# echo 'JL-server' > /etc/hostname
# hostname -F /etc/hostname
#


# Add a new user on server
# adduser username
# Add the user to the administer the system (admin) 
# usermod -a -G sudo username


# SSH Key Pair Authentication
ssh-keygen
scp ~/.ssh/id_rsa.pub username@JL-server:
mkdir .ssh
mv id_rsa.pub .ssh/authorized_keys
chown -R username:username .ssh
chmod 700 .ssh
chmod 600 .ssh/authorized_keys


# Disabling SSH Password Authentication and Root Login
sudo nano /etc/ssh/sshd_config
PasswordAuthentication no
PermitRootLogin no
sudo service ssh restart


# Creating a Firewall
# Check default firewall rules
sudo iptables -L
# Create a file to hold your firewall rules
sudo nano /etc/iptables.firewall.rules
#---------------------------------------------------------------
*filter

#  Allow all loopback (lo0) traffic and drop all traffic to 127/8 that doesn't use lo0
-A INPUT -i lo -j ACCEPT
-A INPUT -d 127.0.0.0/8 -j REJECT

#  Accept all established inbound connections
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#  Allow all outbound traffic - you can modify this to only allow certain traffic
-A OUTPUT -j ACCEPT

#  Allow HTTP and HTTPS connections from anywhere (the normal ports for websites and SSL).
-A INPUT -p tcp --dport 80 -j ACCEPT
-A INPUT -p tcp --dport 443 -j ACCEPT

#  Allow SSH connections
#
#  The -dport number should be the same port number you set in sshd_config
#
-A INPUT -p tcp -m state --state NEW --dport 22 -j ACCEPT

#  Allow ping
-A INPUT -p icmp -j ACCEPT

#  Log iptables denied calls
-A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

#  Drop all other inbound - default deny unless explicitly allowed policy
-A INPUT -j DROP
-A FORWARD -j DROP

COMMIT
#---------------------------------------------------------------
# Activate the firewall rules
sudo iptables-restore < /etc/iptables.firewall.rules
# Recheck firewall
sudo iptables -L
# Ensure that the firewall rules are activated every time server restart
sudo nano /etc/network/if-pre-up.d/firewall
#---------------------------------------------------------------
#!/bin/sh
/sbin/iptables-restore < /etc/iptables.firewall.rules
#---------------------------------------------------------------
# Set the script's permissions
sudo chmod +x /etc/network/if-pre-up.d/firewall


# Installing and Configuring Fail2Ban
sudo apt-get install fail2ban
# Optionally, override the default Fail2Ban configuration by creating a new jail.local file
sudo nano /etc/fail2ban/jail.local







