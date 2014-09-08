#!/bin/bash
source config.sh

#podcast Paths
PODCAST="$HOME/Videos"
TECHTALKTODAY="$PODCAST/TechTalkToday"
LINUXACTIONSHOW="$PODCAST/LinuxActionShow"
LINUXUNPLUGGED="$PODCAST/LinuxUnplugged"
CODERRADIO="$PODCAST/CoderRadio"

#Tech Talk Today
FILE="$TECHTALKTODAY/T3-00$TTT-432p.mp4"

if [ -f $FILE ]; then
    echo "Tech Talk Today Episode $TTT Already Downloaded"
    TTT=$(($TTT+1))
else
    echo "Tech Talk Today Episiode $TTT is Downloading"
    wget http://201406.jb-dl.cdn.scaleengine.net/t3/2014/T3-00$TTT-432p.mp4 -P $TECHTALKTODAY/
fi

#Linux Action Show
FILE="$LINUXACTIONSHOW/linuxactionshowep$LAS-432p.mp4"
if [ -f $FILE ];
then
    echo "Linux Action Show Episode $LAS Already Downloaded"
    LAS=$(($LAS+1))
else
    echo "Linux Action Show Episode $LAS is Downloading"
    wget http://201406.jb-dl.cdn.scaleengine.net/las/2014/linuxactionshowep$LAS-432p.mp4 -P $LINUXACTIONSHOW/
fi

#Linux Unplugged
FILE="$LINUXUNPLUGGED/lup-00$LUP-432p.mp4"
if [ -f $FILE ];
then
    echo "Linux Unplugged Episode $LUP Already Downloaded"
    LUP=$(($LUP+1))
else
    echo "Linux Unplugged Episode $LUP is Downloading"
    wget http://201406.jb-dl.cdn.scaleengine.net/linuxun/2014/lup-00$LUP-432p.mp4 -P $LINUXUNPLUGGED/
fi

#Coder Radio
FILE="$CODERRADIO/cr-0$CR-432p.mp4"
if [ -f $FILE ];
then
    echo "Coder Radio Episode $CR Already Downloaded"
    CR=$(($CR+1))
else
    echo "Coder Radio Episode $CR is Downloading"
    wget http://201406.jb-dl.cdn.scaleengine.net/coderradio/2014/cr-0$CR-432p.mp4 -P $CODERRADIO/
fi

echo -e TTT=$TTT\\nLAS=$LAS\\nLUP=$LUP\\nCR=$CR > "$HOME/Development/podcast/config.sh"

