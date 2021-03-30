#!/usr/bin/expect

set timeout 30
spawn ssh -p 22 $env(APPLEHUB_USERNAME)@$env(APPLEHUB_HOST) "docker-compose down && docker-compose pull && docker-compose up"
expect {
    "(yes/no)?"
    {send "yes\n";exp_continue;}
    "password:"
    {send "$env(APPLEHUB_PASSWORD)\n";}
}

expect eof
