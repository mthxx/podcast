#!/bin/bash
source config.sh

#Podcast Path
PODCAST_PATH="$HOME/Videos"

#Jupiter Broadcasting Download URL
YEAR="2014"
JB_URL="http://${YEAR}06.jb-dl.cdn.scaleengine.net"

#Tech Talk Today
TTT_PATH="$PODCAST_PATH/TechTalkToday"
TTT_FILE="T3-00$TTT-432p.mp4"
TTT_NAME="Tech Talk Today"
TTT_ACR="TTT"
TTT_URL="$JB_URL/t3/${YEAR}/$TTT_FILE"

#Linux Action Show
LAS_PATH="$PODCAST_PATH/LinuxActionShow"
LAS_FILE="linuxactionshowep$LAS-432p.mp4"
LAS_NAME="Linux Action Show"
LAS_ACR="LAS"
LAS_URL="$JB_URL/las/${YEAR}/$LAS_FILE"

#Linux Unplugged
LUP_PATH="$PODCAST_PATH/LinuxUnplugged"
LUP_FILE="lup-00$LUP-432p.mp4"
LUP_NAME="Linux Unplugged"
LUP_ACR="LUP"
LUP_URL="$JB_URL/linuxun/${YEAR}/$LUP_FILE"

#Coder Radio
CR_PATH="$PODCAST_PATH/CoderRadio"
CR_FILE="cr-0$CR-432p.mp4"
CR_URL="$JB_URL/coderradio/${YEAR}/$CR_FILE"
CR_ACR="CR"
CR_NAME="Coder Radio"

checkPodcasts () {
    
    FILE="$1/$2"
    if [ -f $FILE ]; then
        echo "$3 episode $4 is already downloaded"
        eval $6=$(($4+1))
    else
        CODE="`wget --spider -S "$5" 2>&1 | grep "HTTP/" | awk '{print $2}'`"
        if [ $CODE -eq 404 ]
        then
            echo "$3 episode $4 is not available yet"
        else
            echo "$3 episiode $4 is downloading"
            wget $5 -P $1/
            eval $6=$(($4+1))
        fi
    fi
}

checkPodcasts $TTT_PATH $TTT_FILE "$TTT_NAME" $TTT $TTT_URL $TTT_ACR
checkPodcasts $LAS_PATH $LAS_FILE "$LAS_NAME" $LAS $LAS_URL $LAS_ACR
checkPodcasts $LUP_PATH $LUP_FILE "$LUP_NAME" $LUP $LUP_URL $LUP_ACR
checkPodcasts $CR_PATH $CR_FILE "$CR_NAME" $CR $CR_URL $CR_ACR

echo -e TTT=$TTT\\nLAS=$LAS\\nLUP=$LUP\\nCR=$CR > "$HOME/Development/podcast/config.sh"

