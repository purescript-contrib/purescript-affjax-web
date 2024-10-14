#!/usr/bin/env bash

set -e

npm run build

mocha-headless-chrome --file dist/index.html --out output/test-output-headless.txt --args disable-web-security --args no-sandbox --executablePath chromium --visible --timeout 9999999

# or open to debug
#
# chromium --disable-web-security --no-sandbox --disable-gpu --args --allow-file-access-from-files --user-data-dir=/tmp/chrome_dev_test dist/index.html
