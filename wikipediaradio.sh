#! /bin/bash
# 
#
# Requires IA Library https://internetarchive.readthedocs.io/en/latest/installation.html
#          Pico2Wave  
#          Lame
#
#

# Change iaarchive to the Identifier for your particular IA project
iaarchive="WikipediaRadio"
count=0
FILES="text/AB/wiki_*"
for f in $FILES
do

        while read -r line
        do
          if [[ "$line" == "<doc"* ]]
          then
            title=$(echo "$line"|cut -d "\"" -f 6|sed 's/ //g')
            mkdir "$title"
            count=0
           elif [[ "$line" == "</doc"* ]]
             then
             ia upload "$iaarchive" "$mp3keep" --metadata="mediatype:audio"
             mv "$mp3keep" mp3/
             rmdir "$title/"
             else
                count=$((count+1))
                wavefile="$title/"$"$title"$"."$"$count"$".wav"
                mp3file="$title/"$"$title"$"."$"$count"$".mp3"
                mp3keep="$title/"$"$title"$".mp3"
                echo "$wavefile"
                pico2wave -l en-US -w "$wavefile"  "$line"
                lame --quiet "$wavefile" "$mp3file"
                rm "$wavefile"
                cat "$mp3file" >>"$mp3keep"
                rm "$mp3file"
           fi
       done <"$f"
done
