#!/bin/bash

# Use these if you are running the script as root, 
# such as in a cronjob saving to owncloud on the owncloud server
#USER=""
#HOME="/home/$USER"

#Podcast Path
PODCAST_PATH="$HOME/Podcasts"              # Location of the parent directory where you want your podcasts saved
SELF_PATH="$HOME/Development/podcast"      # The location of the directory containing this script
BACKLOG="5"

source $SELF_PATH/config.sh

# Jupiter Broadcasting Download URL
YEAR="2014"
JB_URL="http://${YEAR}06.jb-dl.cdn.scaleengine.net"

# Tech Talk Today
T3_PATH="$PODCAST_PATH/TechTalkToday"
T3_FILE="T3-0$T3-432p.mp4"
T3_NAME="Tech Talk Today"
T3_ACR="T3"
T3_URL="$JB_URL/t3/${YEAR}/$T3_FILE"

# Linux Action Show
LAS_PATH="$PODCAST_PATH/LinuxActionShow"
LAS_FILE="linuxactionshowep$LAS-432p.mp4"
LAS_NAME="Linux Action Show"
LAS_ACR="LAS"
LAS_URL="$JB_URL/las/${YEAR}/$LAS_FILE"

# Linux Unplugged
LUP_PATH="$PODCAST_PATH/LinuxUnplugged"
LUP_FILE="lup-00$LUP-432p.mp4"
LUP_NAME="Linux Unplugged"
LUP_ACR="LUP"
LUP_URL="$JB_URL/linuxun/${YEAR}/$LUP_FILE"

# Coder Radio
CR_PATH="$PODCAST_PATH/CoderRadio"
CR_FILE="cr-0$CR-432p.mp4"
CR_URL="$JB_URL/coderradio/${YEAR}/$CR_FILE"
CR_ACR="CR"
CR_NAME="Coder Radio"

# Tech Snap Now
TSN_PATH="$PODCAST_PATH/TechSnap"
TSN_FILE="techsnap-0${TSN}.mp4"
TSN_URL="$JB_URL/techsnap/${YEAR}/$TSN_FILE"
TSN_ACR="TSN"
TSN_NAME="Tech Snap"

# BSD Now
BSD_PATH="$PODCAST_PATH/BSDNow"
BSD_FILE="bsd-00${BSD}.mp4"
BSD_URL="$JB_URL/bsdnow/${YEAR}/$BSD_FILE"
BSD_ACR="BSD"
BSD_NAME="BSD Now"

# Faux Show
FAUX_PATH="$PODCAST_PATH/FauxShow"
FAUX_FILE="fauxshow-ep${FAUX}.mp4"
FAUX_URL="$JB_URL/fauxshow/${YEAR}/$FAUX_FILE"
FAUX_ACR="FAUX"
FAUX_NAME="Faux Show"

# Scibyte
SCI_PATH="$PODCAST_PATH/Scibyte"
SCI_FILE="scibyte-0${SCI}.mp4"
SCI_URL="$JB_URL/scibyte/${YEAR}/$SCI_FILE"
SCI_ACR="SCI"
SCI_NAME="Scibyte"

# Womens Tech Radio
WTR_PATH="$PODCAST_PATH/WomensTechRadio"
WTR_FILE="WTR-000${WTR}.mp4"
WTR_URL="$JB_URL/wtr/${YEAR}/$WTR_FILE"
WTR_ACR="WTR"
WTR_NAME="WomensTechRadio"

checkPodcasts () {
    
    FILE="$1/$6-$4"
    OLD_FILE="$1/$6-`expr $4 - $BACKLOG`"
    if [ -f $FILE ]; then
        echo "$3 episode $4 is already downloaded"
        eval $6=$(($4+1))
    else
        CODE="`wget --spider -S "$5" 2>&1 | grep "HTTP/" | awk '{print $2}'`"
        if [ $CODE -eq 404 ]; then
            echo "$3 episode $4 is not available yet"
        else
            echo "$3 episiode $4 is downloading"
            wget -O$1/$6-$4 $5 -P $1/ 
            eval $6=$(($4+1))
            
            if [ -f $OLD_FILE ]; then
                echo "Removing episode `expr $4 - $BACKLOG`"
                echo `rm $OLD_FILE`
            fi
        fi
    fi
}

# Comment out or uncomment any podcasts to your preferences.
checkPodcasts $T3_PATH $T3_FILE "$T3_NAME" $T3 $T3_URL $T3_ACR
checkPodcasts $LAS_PATH $LAS_FILE "$LAS_NAME" $LAS $LAS_URL $LAS_ACR
checkPodcasts $LUP_PATH $LUP_FILE "$LUP_NAME" $LUP $LUP_URL $LUP_ACR
checkPodcasts $CR_PATH $CR_FILE "$CR_NAME" $CR $CR_URL $CR_ACR
checkPodcasts $TSN_PATH $TSN_FILE "$TSN_NAME" $TSN $TSN_URL $TSN_ACR
#checkPodcasts $BSD_PATH $BSD_FILE "$BSD_NAME" $BSD $BSD_URL $BSD_ACR
#checkPodcasts $FAUX_PATH $FAUX_FILE "$FAUX_NAME" $FAUX $FAUX_URL $FAUX_ACR
#checkPodcasts $SCI_PATH $SCI_FILE "$SCI_NAME" $SCI $SCI_URL $SCI_ACR
checkPodcasts $WTR_PATH $WTR_FILE "$WTR_NAME" $WTR $WTR_URL $WTR_ACR



echo -e T3=$T3\\nLAS=$LAS\\nLUP=$LUP\\nCR=$CR\\nTSN=$TSN\\nBSD=$BSD\\nFAUX=$FAUX\\nSCI=$SCI\\nWTR=$WTR > "$SELF_PATH/config.sh"

