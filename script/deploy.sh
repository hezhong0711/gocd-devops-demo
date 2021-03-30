#!/usr/bin/expect

set timeout 30
spawn ssh -p 22 $env(SERVER_USERNAME)@$env(SERVER_HOST) "docker-compose down && docker-compose pull && docker-compose up"
expect {
    "(yes/no)?"
    {send "yes\n";exp_continue;}
    "password:"
    {send "$env(SERVER_PASSWORD)\n";}
}

expect eof
