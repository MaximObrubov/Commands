printf "CURL as a Googlebot:\n\n"
curl --user-agent "Googlebot/2.1 (+http://www.google.com/bot.html)" -v "$1"
printf '\n==========================================================================\n\n'
printf "CURL as a Facebootbot:\n\n"
curl -v --compressed -H "Range: bytes=0-524288" -H "Connection: close" -A "facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)" "$1"
printf '\n==========================================================================\n\n'
