#!/bin/bash
/usr/bin/expect << -EOF

#create a user account
spawn adduser cowrie
expect "*password:" 
send "cowrie\r" 
expect "*password:" 
send "cowrie\r" 
expect "*[]:" 
send "\r" 
#send "\r\n"
expect "*[]:"
send "\r"
expect "*[]:"
send "\r"
expect "*[]:" 
send "\r"
expect "*[]:" 
send "\r"
expect "*?"
send "\r"
expect "Is the information correct?*"
send "\r"
#interact
expect eof

#send "\r\n"
#expect "Work Phone []:"
#send "\r\n"
#expect "Home Phone []:"
#send "\r\n"
#expect "Other []:"
#send "\r\n"
#send "Y\r\n"
#expect eof
#interact

