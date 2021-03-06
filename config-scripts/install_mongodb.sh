#!/bin/bash
echo "MongoDB installation: Add PGP key"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
echo "MongoDB installation: Add repo to sources list"
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
echo "MongoDB installation: Installing https support"
apt-get install apt-transport-https ca-certificates
echo "MongoDB installation: Updating apt"
apt-get update
echo "MongoDB installation: Installing mongodb package"
apt-get install -y mongodb-org
echo "MongoDB installation: Start mongodb"
systemctl start mongod
echo "MongoDB installation: Enable mongodb autoexec"
systemctl enable mongod
