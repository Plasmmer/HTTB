#while true; do
##  do echo -e "HTTP/1.1 200 OK\n\n$(date)" \
##  do echo -e "HTTP/1.1 200 OK\n\n$(less <&0)" \
##  do echo -e "HTTP/1.1 200 OK\n\n$(cat -)" \
##  do echo -e "HTTP/1.1 200 OK\n\n$(cat - &)" \
#  STDIN=$(cat - &)
#  echo -e "HTTP/1.1 200 OK\n\n$STDIN" \
#  | nc -l -k -p 8080 -q 1;
#done

#!/bin/bash

echo "Start listening on port 8080 ..."
while read line
do
    if [ "$line" == 'exit' ]; then
        echo "Received 'exit'"
        break
    else
        echo "$line"
    fi
done < <((echo "Welcome. Please give me one of the following commands: $AVAILABLECOMMANDS") | nc -q -1 -l 8080)
echo "Good bye"
#- Credits: https://askubuntu.com/questions/873788/bash-read-lines-from-netcat-connection
