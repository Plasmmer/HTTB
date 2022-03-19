#!/usr/bin/bash
declare -r DEBUG=1

log() {
    if [ $DEBUG = 1 ]
    then
        echo "$1" >&2;
    fi
}

echo "<h1>Hello, World!</h1><p>It's like the early times of the Internet... ...but we are building the Web 3.0, actually.</p>"
