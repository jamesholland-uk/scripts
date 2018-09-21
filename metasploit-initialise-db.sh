#!/usr/bin/expect -f

set force_conservative 0  ;
if {$force_conservative} {
    set send_slow {1 .1}
    proc send {ignore arg} {
        sleep .1
        exp_send -s -- $arg
    }
}

set timeout -1
spawn msfconsole
match_max 100000
expect -exact "Would you like to use and setup a new database (recommended)? "
send -- "yes\r"
expect ">"
send -- "exit\r"
expect eof
