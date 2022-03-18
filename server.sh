while true;
  do echo -e "HTTP/1.1 200 OK\n\n$(date)" \
  | nc -l -k -p 8080 -q 1;
  while IFS= read -r INPUT || [ "$INPUT" ]; do
    echo "Req line: $INPUT" >&2
done 
done
