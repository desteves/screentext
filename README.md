# screentext
An easy way to extract text from screenshots via OCR. 

## Reqs
- OCR API Key.

### Applescript
- Mac
- Internet access when taking the screenshot
Note: I'm running the shell script via applescript folder actions but it can also be set up via a cron or just run it in terminal or whatever works for ya ;)

## How
Every time you take a screenshot, it gets send to an OCR and the parsed results are saved as ORIGINAL_FILENAME.json in the same directory

## TODO
- Investigate other third party OCRs as the current OCR call doesn't seem to be as accurate..
- Make more generic
