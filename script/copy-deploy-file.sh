#!/usr/bin/expect

# ./copy-deploy-file.sh source target

set timeout 30
set source [lindex $argv 0]
set target [lindex $argv 1]

spawn scp $source $env(APPLEHUB_USERNAME)@$env(APPLEHUB_HOST):$target
expect {
  "(yes/no"
  { send "yes\n";exp_continue; }
  "password:"
  { send "$env(APPLEHUB_PASSWORD)\n"; }
}
expect eof
