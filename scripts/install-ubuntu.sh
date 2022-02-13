#!/bin/bash

chpasswd <<<"root:root"

apt update

apt install bind9 net-tools vim mc dnstop -y

systemctl start named
systemctl enable named
systemctl status named

# Install Webmin from Webmin APT repository
echo "--------------  Install Webmin from Webmin APT repository -----------------"
echo "deb https://download.webmin.com/download/repository sarge contrib" | tee /etc/apt/sources.list.d/webmin.list
apt install apt-transport-https sudo gnupg2 -y
wget -qO - http://www.webmin.com/jcameron-key.asc | apt-key add -
apt update
apt install webmin -y
systemctl status webmin
echo "Visit https://127.0.0.1:10000/ on host OS"

echo "-------------- Check ufv firewall -------------------------------"
ufw status