source .env

MESSAGE='
Q: 111121112111111
A: 111122222111111
Q: 334333333433
A: 334444444433
Q: 111717111111
A: 111777111111
Q: 8828882888
A: ?
'

# Encode the MESSAGE variable as a JSON string
MESSAGE_JSON=$(echo "$MESSAGE" | jq -Rs .)

curl https://api.anthropic.com/v1/messages \
    --header "x-api-key: $ANTHROPIC_API_KEY" \
    --header "anthropic-version: 2023-06-01" \
    --header "content-type: application/json" \
    --data @- <<EOF
    {
        "model": "claude-3-opus-20240229",
        "max_tokens": 1024,
        "messages": [
            {
            "role": "user",
            "content": $MESSAGE_JSON
            }
        ]
    }
EOF