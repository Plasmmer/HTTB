#!/bin/sh

log "$request_body"
if jq -e . >/dev/null 2>&1 <<<"$request_body"
then
    log "Parsed JSON successfully and got something other than false/null"
    json_username="$(echo "$request_body" | jq -r '.name')"
    json_age="$(echo "$request_body" | jq -r '.age')"
    log "Name: $json_username | Age: $json_age"
else
    log "Failed to parse JSON, or got false/null"
fi
