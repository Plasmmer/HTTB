while true;
  do echo -e "HTTP/1.1 200 OK\n\n$(date)" \
  | nc -l -k -p 8080 -q 1; 
#  read -d } PAYLOAD;
#  echo "$PAYLOAD"
done
