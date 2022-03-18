#!/bin/bash

#while true; do
##  do echo -e "HTTP/1.1 200 OK\n\n$(date)" \
##  do echo -e "HTTP/1.1 200 OK\n\n$(less <&0)" \
##  do echo -e "HTTP/1.1 200 OK\n\n$(cat -)" \
##  do echo -e "HTTP/1.1 200 OK\n\n$(cat - &)" \
##  STDIN=$(cat - &)
##  echo -e "HTTP/1.1 200 OK\n\n$STDIN" \
#  echo -e "HTTP/1.1 200 OK\n\n$(date)" \
#  | nc -l -k -p 8080 -q 1;
#done

unset PIDTMP; rm -rf tmplog.log 2>/dev/null

while true; do
    if [[ "$PIDTMP" == "" ]]; then
      nc -vv -l -p 8080 > tmplog.log 2>&1 & PIDTMP=$!;
    fi

    if [[ "$PIDTMP" != "" ]]; then
      if [[ -f tmplog.log ]]; then
        thisip="$(cat -v tmplog.log 2> /dev/null | tr -d '\0' | grep -aiv "failed" | grep -ioE -m2  "\\[([0-9]{1,3}\.){3}[0-9]{1,3}\\]" | tail -1 | sed 's/^.\(.*\).$/\1/')" 2> /dev/null
        #uncomment if u want output to screen
        #if [[ "$thisip" != "" ]]; then cat tmplog.log 2> /dev/null; fi;
      fi

      if [[ "$thisip" != "" ]]; then
        kill $PIDTMP 2>/dev/null
        wait $PIDTMP 2>/dev/null; unset PIDTMP;
        
        if [[ "$(grep -rnw log.log -e "$thisip" 2> /dev/null)" == "" ]]; then
          echo "$thisip" >> log.log
        fi
        unset thisip
      fi
    fi

    sleep 2
done
#- credits: https://stackoverflow.com/questions/68016063/netcat-nc-listen-grep-ip-and-disconnect
