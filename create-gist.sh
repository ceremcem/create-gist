#!/bin/bash
# based on: https://gist.github.com/s-leroux/7cb7424d33ba3753e907cc2553bcd1ba
# modified by: cca


print_usage(){
  cat << USAGE

	usage: 
		
		$(basename $0) /path/to/file [Github user name]

USAGE
}

# 0. Your file name
FNAME=$1

if [[ ! -f $FNAME ]]; then
  print_usage
  exit 2
fi

# 0.1 Your username (optional)
GITHUB_USERNAME=$2


# 1. Somehow sanitize the file content
#    Remove \r (from Windows end-of-lines),
#    Replace tabs by \t
#    Replace " by \"
#    Replace EOL by \n
CONTENT=$(sed -e 's/\r//' -e's/\t/\\t/g' -e 's/"/\\"/g' "${FNAME}" | awk '{ printf($0 "\\n") }')

# 2. Build the JSON request
read -r -d '' DESC <<EOF
{
  "description": "some description",
  "public": true,
  "files": {
    "${FNAME}": {
      "content": "${CONTENT}"
    }
  }
}
EOF

# 3. Use curl to send a POST request

if [[ "$GITHUB_USERNAME" != "" ]]; then
  # REGISTERED USER
  OUTPUT=$(curl -u "${GITHUB_USERNAME}" -X POST -d "${DESC}" "https://api.github.com/gists")
else
  # ANONYMOUS GIST :
  OUTPUT=$(curl -X POST -d "${DESC}" "https://api.github.com/gists")
fi

echo "$OUTPUT"

echo "-----------------" 
echo " URL: "
echo "-----------------"
echo "$OUTPUT" | grep 'raw_url'
