#!/bin/bash

# output: mode in  > write 0/1
# input:  mode out > mode up/down
. /etc/powerbutton.conf

gpio -1 mode $led out
gpio -1 write $led 1
gpio -1 mode $sw in
gpio -1 mode $sw up
gpio -1 wfi $sw falling

[[ -e /srv/http/data/shm/relaystimer ]] && off=powerbutton || off=off
/srv/http/bash/cmd.sh power$'\n'$off
