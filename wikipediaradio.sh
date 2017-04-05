#! /bin/bash
# Wikipedia Radio
# CC0 by Tom Higgins in service to Friend COmputer 
#    
# Requires IA Library https://internetarchive.readthedocs.io/en/latest/installation.html
#          Pico2Wave  
#          Lame
#
#

# Change iaarchive to the Identifier for your particular IA project
# NB IA can handle about 1000 items per Identifier. After it hits the limit
# the indivudal fules and the media player interface will not show up on the 
# web page. Plan accordingly
iaarchive="WikipediaRadio"
count=0
# Change Files to the top directory of text files 
FILES="text/AB/wiki_*"
for f in $FILES
do

        while read -r line
        do
          if [[ "$line" == "<doc"* ]]
          then
          # If this is the top of a new article set title to the articles name and set up the line count
            title=$(echo "$line"|cut -d "\"" -f 6|sed 's/ //g')
            mkdir "$title"
            count=0
           elif [[ "$line" == "</doc"* ]]
           # If this is the end of the article push the finalized mp3 to IA and clean up 
             then
             ia upload "$iaarchive" "$mp3keep" --metadata="mediatype:audio"
             mv "$mp3keep" mp3/
             rmdir "$title/"
             else
            # If this is a line of text in the article read it and convert it to a temp mp3
            # add the temp mp3 to the master mp3 for this article
            # increase the line count
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
