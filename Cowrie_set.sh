#!/bin/bash
echo prepare step:change the port of ssh and iptable rules to redirect the port 22 to 62222
echo =================================================================
#we use port 81 as new ssh port,but this writting is not so correct but can be used
echo "Port 81" >> /etc/ssh/sshd_config
service ssh restart
#set the iptable rules
iptables -t nat -A PREROUTING -p tcp --dport 22 -j REDIRECT --to-port 62222
#if you want other service, you should add other rules here..


echo first step:install python3 enviroment
echo =================================================================
apt-get -y install git python-virtualenv libssl-dev libffi-dev build-essential libpython3-dev python3-minimal authbind
#python2 enviroment is below
#apt-get -y install git python-virtualenv libssl-dev libffi-dev build-essential libpython-dev python2.7-minimal authbind
echo second step:adduser cowrie
echo =================================================================
./cowrie_step2.sh

echo third step:download the cowrie code
echo =================================================================
# we should change the user first to make the low privilege of this dir
#sudo su - cowrie
#we can also use su cowrie, but i don't know why the coder of the program use the long one
echo "cowrie ALL=(ALL)ALL" >> /etc/sudoers
sudo -u cowrie bash << EOF
echo "cowrie"|sudo -S ./cowrie_step3.sh
#send "cowrie\r"
EOF

echo last step:start the cowrie
cd /home/cowrie
chown -R cowrie:cowrie cowrie/
sudo su - cowrie -c "/home/cowrie/cowrie/bin/cowrie start"
