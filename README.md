# screentext
An easy way to extract text from screenshots via OCR. 

Every time you take a screenshot, it gets send to an OCR and the parsed results are saved as ORIGINAL_FILENAME.json in the same directory

## Reqs
- OCR API Key. Get yours at http://www.ocrwebservice.com/account/signup
- jq.  `brew install jq` or see https://stedolan.github.io/jq/download/ if on a different OS.

If using the applescript, then:
- Mac
- Internet access when taking the screenshot

Note: I'm running the shell script via applescript folder actions but it can also be set up via a cron job, run it in terminal, or whatever works for ya ;)

## Install
- Edit "Image - Convert to Text.scpt" to point to your shell script location! (Line 11)
- Copy "Image - Convert to Text.scpt" to "/Library/Scripts/Folder Action Scripts"
- Find the directory where your screenshots are saved and add the apple script folder action.

## Todo
- Investigate other third party OCRs as the current OCR call doesn't seem to be as accurate..
- Make more generic and update the applescript
