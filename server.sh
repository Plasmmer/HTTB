#!/usr/bin/bash
declare -r CR=$'\r'
declare -r LF=$'\n'
declare -r CR_LF="${CR}${LF}"

declare -r DEBUG=1

declare -A function_dictionary=(
    [login]=login
)

log() {
    if [ $DEBUG = 1 ]
    then
        echo "$1" >&2;
    fi
}

serve() {
    ncat --listen --keep-open 0.0.0.0 8080 --sh-exec "bash server.sh process"
}

process() {
#    IFS=$'\n'
    IFS=$LF

    get_request_headers

    get_request_body

    handle_requested_resource

#    echo -e "<html><head></head><body><h1>Hello, World!</h1><p>It's like the early times of the Internet... ...but we are building the Web 3.0, actually.</p></body></html>"
    echo -e "HTTP/1.1 200 OK\n\n<html><head></head><body><h1>Hello, World!</h1><p>It's like the early times of the Internet... ...but we are building the Web 3.0, actually.</p></body></html>"
    log "Hello, Error"
}

get_request_headers() {
#    jsonrequest="$(cat - | grep -o '{...\+}')"
#    log "$jsonrequest"
    request_headers=()

    while true
    do
        read header
        log "$header"
#        jsonrequest="$(cat - | grep -o '{...\+}')"
#        log "$jsonrequest"
        if [ "$header" = $CR_LF ]
        then
            break
        fi
        request_headers=("${request_headers[@]}" "$header")
    done
}

handle_requested_resource() {

    regexp=".* (.*) HTTP"
    [[ "${request_headers[0]}" =~ $regexp ]]

    resource="${BASH_REMATCH[1]}"

    requested_resource="./app$resource"
    if [ -f "$requested_resource" ]
    then
        send_file "$requested_resource"
    fi

    log "$request_body"

    requested_resource="${resource:1}"

    for x in "${!function_dictionary[@]}"
    do
        if [[ "$requested_resource" =~ $x ]]
        then
            ${function_dictionary[$x]}
        fi
    done

    send_file "./app/404.html"

#    log "$request_body"
}

send_file() {
    # -> content_type
    requested_resource="$1"
    extension="${requested_resource##*.}"
    set_response_content_type "$extension"

    # -> data |  content_length
    get_requested_content "$1"

    # -> response_headers
    set_response_headers  "$content_type" "$content_length"

    # -> response
    build_response "$response_headers" "$content"

    # -> ECHO data | PRINTF data
    send_response "$response"

    regex=".*\.(.*)"
    [[ "$requested_resource" =~ $regex  ]]
    extension="${BASH_REMATCH[1]}"
}

set_response_content_type() {
    case "$1" in
        "html")
            content_type="Content-Type: text/html"
            ;;
        "css")
            content_type="Content-Type: text/css"
            ;;
        "js")
            content_type="Content-Type: text/javascript"
            ;;
        "ico")
            content_type="Content-Type: image/x-icon"
            ;;
        "png")
            content_type="Content-Type: image/png"
            ;;
        "jpg" | "jpeg")
            content_type="Content-Type: image/jpeg"
            ;;
        "mp4")
            content_type="Content-Type: video/mp4"
            ;;
        *)
            content_type="Content-Type: text/plain"
            ;;
    esac
}

get_requested_content() {
    length=$(stat --printf "%s" "$1")
    content_length="Content-Length: $length"
    content=$(cat "$1" | sed 's/\\/\\\\/g' | sed 's/%/%%/g' | sed 's/\x00/\\x00/g')
}

set_response_headers() {
    version="HTTP/1.1 200 OK"
    date="Date: $(date)"
    connection="Connection: Closed"

    response_headers="${version}$CR_LF${date}$CR_LF${cookies}$CR_LF$1$CR_LF$2$CR_LF${connection}"
}

build_response() {
    response="$1$CR_LF$CR_LF$2"
}

send_response() {
    printf -- "$1$CR_LF"
    exit
}

get_request_body() {
    request_type="$(echo "${request_headers[0]}" | cut -d" " -f1)"

    post_length=0
    for i in "${request_headers[@]}"
    do
        header=$(cut -d":" -f1 <<< "$i")
        if [ "$header" = "Content-Length" ]
        then
            post_length=$(echo "$i" | cut -d":" -f2 | tr -d "$CR" | tr -d "$LF" | tr -d ' ')
        fi
    done

    if [ "$post_length" -ne 0 ]
    then
        IFS= read -n "$post_length" request_body
    fi
}

"$1"
