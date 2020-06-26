#!/bin/bash

clear
echo "[*] Installing Egress-Assess Dependencies..."
apt-get update
apt-get -y install smbclient
echo "[*] Installing pip"
apt-get -y install pip
echo "[*] Installing scapy"
apt-get -y install python-scapy
echo "[*] Installing paramiko"
apt-get -y install python-paramiko python-crypto
echo "[*] Installing ecdsa"
pip install ecdsa
echo "[*] Installing pyasn1"
apt-get -y install python-pyasn1
echo "[*] Installing dnspython"
apt-get -y install python-dnspython
echo "[*] Installing impacket"
pip install impacket
echo "[*] Installing pyftpdlib..."
git clone https://github.com/giampaolo/pyftpdlib.git
cd pyftpdlib
python setup.py install
cd ..
rm -rf pyftpdlib
echo "[*] Installing cryptography"
pip install cryptography
echo "[*] Installing dnslib"
pip install dnslib
cd ../protocols/servers/serverlibs/web
clear
echo "[*] Generating SSL Certificate (web)"
openssl req -new -x509 -keyout server.key -out server.crt -days 365 -nodes -newkey rsa:4096 -batch && cat server.key server.crt > server.pem && rm server.key server.crt
cd ../sftp
echo "[*] Generating SSL Key (sftp)"
ssh-keygen -b 4096 -f server.key -N ""
echo
echo
echo "[*] Install complete!"
echo "[*] Enjoy Egress-Assess!"
