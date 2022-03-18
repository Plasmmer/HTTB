while true; do
#  do echo -e "HTTP/1.1 200 OK\n\n$(date)" \
#  do echo -e "HTTP/1.1 200 OK\n\n$(less <&0)" \
#  do echo -e "HTTP/1.1 200 OK\n\n$(cat -)" \
#  do echo -e "HTTP/1.1 200 OK\n\n$(cat - &)" \
#  STDIN=$(cat - &)
#  echo -e "HTTP/1.1 200 OK\n\n$STDIN" \
  echo -e "HTTP/1.1 200 OK\n\n$(date)" \
  | nc -l -k -p 8080 -q 1;
done


