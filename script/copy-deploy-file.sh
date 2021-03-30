#!/usr/bin/expect

# ./copy-deploy-file.sh source target

set timeout 30
set source [lindex $argv 0]
set target [lindex $argv 1]

spawn scp $source $env(SERVER_USERNAME)@$env(SERVER_HOST):$target
expect {
  "(yes/no"
  { send "yes\n";exp_continue; }
  "password:"
  { send "$env(SERVER_PASSWORD)\n"; }
}
expect eof
