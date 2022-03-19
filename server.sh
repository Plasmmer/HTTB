
#!/bin/bash

while true; do
##  do echo -e "HTTP/1.1 200 OK\n\n$(date)" \
##  do echo -e "HTTP/1.1 200 OK\n\n$(less <&0)" \
##  do echo -e "HTTP/1.1 200 OK\n\n$(cat -)" \
##  do echo -e "HTTP/1.1 200 OK\n\n$(cat - &)" \
##  STDIN=$(cat - &)
##  echo -e "HTTP/1.1 200 OK\n\n$STDIN" \
#  echo -e "HTTP/1.1 200 OK\n\n<h1>Title</h1>$(date)" \
#  | nc -l -k -p 8080 -q 1;
#  nc -l 8080 | cat - | grep -o '{...\+}' \
#  | nc -l -k -p 8080 -q 1;
#   echo -e "HTTP/1.1 200 OK\n\n<h1>Title</h1>$(date)" \
#  | nc -l -k -p 8080 -q 1;
#  nc -l -k -p 8080 -q 1 & | cat - | grep -o '{...\+}';
#  cat - | grep -o '{...\+}' < nc -l -k -p 8080 -q 1;
#echo -e "HTTP/1.1 200 OK\n\n<h1>Title</h1>$(date)" \
#  | nc -l -k -p 8080 -q 1 &
#   echo -e "HTTP/1.1 200 OK\n\n<h1>Title</h1><p>$(date)</p><br><input type=\"submit\" value=\"Submit\">" \
#  | nc -l -k -p 8080 -q 1;
#   echo -e "HTTP/1.1 200 OK\n\n<h1>Title</h1><p>$(date)</p>"
#  | nc -l -k -p 8080 -q 1;
#   echo -e "HTTP/1.1 200 OK\n\n<h1>Title</h1>$(date)" \
#  | nc -l -k -p 8080 -q 1 | cat - | grep -o '{...\+}';
#   echo -e "HTTP/1.1 200 OK\n\n<h1>Title</h1>$(date)" \
#  | nc -l -k -p 8080 -q 1 & | cat - | grep -o '{...\+}';
#   echo -e "HTTP/1.1 200 OK\n\n<h1>Title</h1>$(date)" \
#  | nc -l -k -p 8080 -q 1 | cat - | grep -o '{...\+}';
#   echo -e "HTTP/1.1 200 OK\n\n<h1>Title</h1>$(date)" \
#  | nc -l -k -p 8080 -q 1;
#  nc -l -k -p 8080 -q 1 | cat - | grep -o '{...\+}';
ncat -l 0.0.0.0 8080 --sh-exec "bash newserver.sh"
done
