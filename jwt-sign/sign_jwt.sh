# useful functions
base64_encode() {
  declare input=${1:-$(</dev/stdin)}
  # Use `tr` to URL encode the output from base64.
  printf '%s' "${input}" | base64 | tr -d '=' | tr '/+' '_-' | tr -d '\n'
}

json() {
  declare input=${1:-$(</dev/stdin)}
  printf '%s' "${input}" | jq -c .
}

hmacsha256_sign() {
  declare input=${1:-$(</dev/stdin)}
  printf '%s' "${input}" | openssl dgst -binary -sha256 -hmac "$1"
}

# check if jwt secret is present (-z flag for absence)
[[ -z "$JWT_SECRET" ]] && { echo 'Error: $JWT_SECRET env variable is missing'; exit 1; }
# check if payload passed (-n flag to check existence)
if [[ -n "$payload" ]]
then
  payload=$(echo "$(less $payload)" | json)
else
  payload='{}'
fi

# check if jq is not installed in the system
if ! command -v jq &> /dev/null
then
  echo 'Error: jq tool could not be found'
  exit
fi

header='{
  "typ": "JWT",
  "alg": "HS256",
  "kid": "0001",
  "iss": "Bash JWT Generator"
}'

# Use jq to set the dynamic `iat` and `exp`
# fields on the header using the current time.
# `iat` is set to now
header=$(
  echo "${header}" | jq --arg time_str "$(date +%s)" \
  '($time_str | tonumber) as $time_num | .iat=$time_num'
)


header_base64=$(echo "${header}" | json | base64_encode)
payload_base64=$(echo "${payload}" | base64_encode)

header_payload=$(echo "${header_base64}.${payload_base64}")
signature=$(echo "${header_payload}" | hmacsha256_sign JWT_SECRET | base64_encode)

echo "${header_payload}.${signature}"
