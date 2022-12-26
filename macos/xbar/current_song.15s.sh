#!/bin/bash

SONG=`/usr/local/bin/mpc --host=gh -f "[%title%[ - %artist%]]|[%name%]|[%file%]"|head -n1|sed 's/^[ \-]*//;s/[ \-]*$//'|grep -v "^volume: "`

if echo $SONG | grep -Eq 'KEXP|kexp128'; then
	SONG=`curl 'https://api.kexp.org/v2/plays/?format=json&limit=1' -s -H 'User-Agent: Mozilla/5.0 (X11; OpenBSD amd64; rv:72.0) Gecko/20100101 Firefox/72.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' | \
	/usr/local/bin/jq -j '.results[].song, " - ", .results[].artist' | \
	/usr/bin/sed 's/null\ \-\ null//'` 
	STATION='on KEXP'
elif echo $SONG | grep -q 'WNXP'; then
	SONG=`curl 'https://api.tunegenie.com/v2/brand/nowplaying/?apiid=m2g_bar&b=wnxp' -s -H 'User-Agent: Mozilla/5.0 (X11; OpenBSD amd64; rv:72.0) Gecko/20100101 Firefox/72.0' -H 'Accept: application/json' -H 'Accept-Language: en-US,en;q=0.5'  -H 'Origin: https://b3.tunegenie.com' | \
	/usr/local/bin/jq -j '.[].song, " - ", .[].artist'`
	STATION='on WNXP'
fi

# Only show something if we have a song to display
if [ -n "$SONG" ]; then
	echo "[$SONG] $STATION"
else
	echo "#"
fi

echo "---"