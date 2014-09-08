#!/bin/bash
source config.sh

#Podcast Paths
PODCAST_PATH="$HOME/Videos"
TTT_PATH="$PODCAST_PATH/TechTalkToday"
LAS_PATH="$PODCAST_PATH/LinuxActionShow"
LUP_PATH="$PODCAST_PATH/LinuxUnplugged"
CR_PATH="$PODCAST_PATH/CoderRadio"

TTT_FILE="T3-00$TTT-432p.mp4"
LAS_FILE="linuxactionshowep$LAS-432p.mp4"
LUP_FILE="lup-00$LUP-432p.mp4"
CR_FILE="cr-0$CR-432p.mp4"


#Tech Talk Today
FILE="$TTT_PATH/$TTT_FILE"

if [ -f $FILE ]; then
    echo "Tech Talk Today episode $TTT is already downloaded"
    TTT=$(($TTT+1))
else
    CODE="`wget --spider -S "http://201406.jb-dl.cdn.scaleengine.net/t3/2014/$TTT_FILE" 2>&1 | grep "HTTP/" | awk '{print $2}'`"
    if [ $CODE -eq 404 ]
    then
        echo "Tech Talk Today episode $TTT is not available yet"
    else
        echo "Tech Talk Today episiode $TTT is downloading"
        wget http://201406.jb-dl.cdn.scaleengine.net/t3/2014/$TTT_FILE -P $TTT_PATH/
    fi
fi

#Linux Action Show
FILE="$LAS_PATH/$LAS_FILE"
if [ -f $FILE ];
then
    echo "Linux Action Show episode $LAS is already downloaded"
    LAS=$(($LAS+1))
else
    CODE="`wget --spider -S "http://201406.jb-dl.cdn.scaleengine.net/las/2014/$LAS_FILE" 2>&1 | grep "HTTP/" | awk '{print $2}'`"
    if [ $CODE -eq 404 ]
    then
        echo "Linux Action Show episode $LAS is not available yet"
    else
        echo "Linux Action Show episode $LAS is downloading"
        wget http://201406.jb-dl.cdn.scaleengine.net/las/2014/$LAS_FILE -P $LAS_PATH/
    fi
fi

#Linux Unplugged
FILE="$LUP_PATH/$LUP_FILE"
if [ -f $FILE ];
then
    echo "Linux Unplugged episode $LUP already downloaded"
    LUP=$(($LUP+1))
else
    CODE="`wget --spider -S "http://201406.jb-dl.cdn.scaleengine.net/linuxun/2014/$LUP_FILE" 2>&1 | grep "HTTP/" | awk '{print $2}'`"
    if [ $CODE -eq 404 ]
    then
        echo "Linux Unplugged episode $LUP is not available yet"
    else
        echo "Linux Unplugged episode $LUP is downloading"
        wget http://201406.jb-dl.cdn.scaleengine.net/linuxun/2014/$LUP_FILE -P $LUP_PATH/
    
    fi
fi

#Coder Radio
FILE="$CR_PATH/$CR_FILE"
if [ -f $FILE ];
then
    echo "Coder Radio episode $CR is already downloaded"
    CR=$(($CR+1))
else
    CODE="`wget --spider -S "http://201406.jb-dl.cdn.scaleengine.net/coderradio/2014/$CR_FILE" 2>&1 | grep "HTTP/" | awk '{print $2}'`"
    if [ $CODE -eq 404 ]
    then
        echo "Coder Radio episode $CR is not available yet"
    else
        echo "Coder Radio episode $CR is downloading"
        wget http://201406.jb-dl.cdn.scaleengine.net/coderradio/2014/$CR_FILE -P $CR_PATH/
    fi
fi

echo -e TTT=$TTT\\nLAS=$LAS\\nLUP=$LUP\\nCR=$CR > "$HOME/Development/podcast/config.sh"

