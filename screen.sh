#!/bin/sh

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi


source ./env-vars
# The above commands exports OCR_API_KEY=xxxxxxxxxxxx defined in the env-vars file as
# export OCR_API_KEY=YourAPIKeyGoesHere


FOLDER=$(defaults read com.apple.screencapture location)
SCREENSHOT=${FOLDER}"$1"
OCR_API_URL="https://api.ocr.space/Parse/Image"
SCREENTEXT=${SCREENSHOT}".json"
OCR_WEB_SVR="http://www.ocrwebservice.com/restservices/processDocument?language=english&pagerange=all&tobw=true&gettext=true&outputformat=txt"

curl --silent --connect-timeout 5 --form "file=@${SCREENSHOT}" --form "apikey=${OCR_API_KEY}" ${OCR_API_URL} | /usr/local/bin/jq --ascii-output --join-output '.["ParsedResults"]?|.[0]?|.["ParsedText"]?'  > ${SCREENTEXT}

size=$(ls -l "${SCREENTEXT}" | cut -d' ' -f 8)
if [ "$size" -gt 0 ]; then
     echo "Success"
     exit 1
fi

rm -f ${SCREENTEXT}
echo "Error"
exit 0
