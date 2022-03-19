#!/usr/bin/bash
declare -r DEBUG=1

log() {
    if [ $DEBUG = 1 ]
    then
        echo "$1" >&2;
    fi
}

serve() {
#    nc --listen --keep-open 0.0.0.0 7999 --sh-exec "./server.sh process"
#    ncat --listen --keep-open 0.0.0.0 7999 --sh-exec "./server.sh process"
    ncat --listen --keep-open 0.0.0.0 8080 --sh-exec "bash server.sh process"
}

process() {
#    echo "<h1>Hello, World!</h1><p>It's like the early times of the Internet... ...but we are building the Web 3.0, actually.</p>"
#    echo "<html><head></head><body><h1>Hello, World!</h1><p>It's like the early times of the Internet... ...but we are building the Web 3.0, actually.</p></body></html>"
    echo -e "<html><head></head><body><h1>Hello, World!</h1><p>It's like the early times of the Internet... ...but we are building the Web 3.0, actually.</p></body></html>"
    log "Hello, Error"
}

"$1"
