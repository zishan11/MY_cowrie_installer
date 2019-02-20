#!/bin/bash
cd /home/cowrie
sudo git clone http://github.com/cowrie/cowrie
cd cowrie
whoami
echo fourth step:set virtual enviroment
echo =================================================================
pwd
#we use python3, so set the virtual env to python3 and activate the env
virtualenv --python=python3 cowrie-env
source cowrie-env/bin/activate
pip install -U -r requirements.txt

echo fifth step:set configuration
echo =================================================================
mkdir log
cd etc/
touch cowrie.cfg
cat > cowrie.cfg << EOF
[ssh]
enabled=true
listen_port=62222
listen_endpoints = tcp:62222:interface=0.0.0.0
[output_jsonlog]
enabled=true
logfile=log/cowrie.json
[output_textlog]
enabled=true
logfile=log/audit.log
format=text
EOF
#if you want to add other settings, you can use "cat>>"

echo sixth step:start the cowrie
echo =================================================================

