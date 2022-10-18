#!/bin/bash

# pipefail to be POSIX in next revision
set -eou pipefail

if [ ! -f "$NOTES/bosworth.txt" ]
then
	touch "$NOTES/bosworth.txt" 
fi

logfile="$NOTES/bosworth.txt" 
DATE=$(date +"%a %d/%m/%y %H:%M")

append_to_log() {
    TMP="/tmp/bosworth_tmp"
    echo "$DATE"  >> "$logfile"
    # should disable this when calling from interactive shell
    # kludge to fit current zim line width at hearth
    alacritty -e nvim -c "set textwidth=63" "$TMP" 
     
    
    
    if [ -n "$(cat $TMP)" ] # non-zero
    then
        # non POSIX 
        # Master sed by abusing it for editing first, be sorry later
        sed --in-place "\$s/\$/ \- $(cat $TMP)/" "$logfile"
    fi
    rm -f "$TMP"
}

skip_log(){
    echo "$DATE" | xargs echo >> "$logfile"
}

# --action="skip,Skip"
ACTION=$(dunstify -u critical --action="default,Append"  \
         "bosworth.sh" "Hey chief! How you doin?")

case "$ACTION" in
"default")
    append_to_log
    ;;
"skip")
    skip_log 
    ;;
esac
