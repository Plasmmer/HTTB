#json_string="{\"name\":\"loremipsum\", \"age\":\"34\"}"
json_string="text"

if jq -e . >/dev/null 2>&1 <<<"$json_string"; then
    echo "Parsed JSON successfully and got something other than false/null"
else
    echo "Failed to parse JSON, or got false/null"
fi

