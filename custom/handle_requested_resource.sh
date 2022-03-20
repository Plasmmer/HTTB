#!/bin/sh

log "$request_body"
if jq -e . >/dev/null 2>&1 <<<"$json_string"; then
    echo "Parsed JSON successfully and got something other than false/null"
    json_username="$(echo "$request_body" | jq -r '.name')"
    json_age="$(echo "$request_body" | jq -r '.age')"
    log "Name: $json_username | Age: $json_age"
else
    echo "Failed to parse JSON, or got false/null"
fi
