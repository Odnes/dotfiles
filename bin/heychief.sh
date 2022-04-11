#!/bin/bash

# pipefail to be POSIX in next revision
set -eou pipefail

if [ ! -f "$NOTES/heychief.txt" ]
then
	touch "$NOTES/heychief.txt" 
fi

logfile="$NOTES/heychief.txt" 
DATE=$(date +"%a %d/%m/%y %H:%M")

append_to_log() {
    TMP="/tmp/heychief_tmp"
    echo "$DATE"  >> "$logfile"
    nvim "$TMP" 
     
    # non POSIX 
    # Master sed by abusing it for editing first, be sorry later
    sed --in-place "\$s/\$/ \- $(cat $TMP)/" "$logfile"
    rm -f "$TMP"
}
skip_log(){
    echo "$DATE" | xargs echo >> "$logfile"
}

ACTION=$(dunstify -u critical --action="default,Append" --action="skip,Skip" "heychief" "How you doin")

case "$ACTION" in
"default")
    append_to_log
    ;;
"skip")
    skip_log 
    ;;
esac