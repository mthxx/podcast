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
    echo "Tech Talk Today episode $TTT is already downloaded"
    TTT=$(($TTT+1))
else
    CODE="`wget --spider -S "http://201406.jb-dl.cdn.scaleengine.net/t3/2014/T3-00$TTT-432p.mp4" 2>&1 | grep "HTTP/" | awk '{print $2}'`"
    if [ $CODE -eq 404 ]
    then
        echo "Tech Talk Today episode $TTT is not available yet"
    else
        echo "Tech Talk Today episiode $TTT is downloading"
        wget http://201406.jb-dl.cdn.scaleengine.net/t3/2014/T3-00$TTT-432p.mp4 -P $TECHTALKTODAY/
    fi
fi

#Linux Action Show
FILE="$LINUXACTIONSHOW/linuxactionshowep$LAS-432p.mp4"
if [ -f $FILE ];
then
    echo "Linux Action Show episode $LAS is already downloaded"
    LAS=$(($LAS+1))
else
    CODE="`wget --spider -S "http://201406.jb-dl.cdn.scaleengine.net/las/2014/linuxactionshowep$LAS-432p.mp4" 2>&1 | grep "HTTP/" | awk '{print $2}'`"
    if [ $CODE -eq 404 ]
    then
        echo "Linux Action Show episode $LAS is not available yet"
    else
        echo "Linux Action Show episode $LAS is downloading"
        wget http://201406.jb-dl.cdn.scaleengine.net/las/2014/linuxactionshowep$LAS-432p.mp4 -P $LINUXACTIONSHOW/
    fi
fi

#Linux Unplugged
FILE="$LINUXUNPLUGGED/lup-00$LUP-432p.mp4"
if [ -f $FILE ];
then
    echo "Linux Unplugged episode $LUP already downloaded"
    LUP=$(($LUP+1))
else
    CODE="`wget --spider -S "http://201406.jb-dl.cdn.scaleengine.net/linuxun/2014/lup-00$LUP-432p.mp4" 2>&1 | grep "HTTP/" | awk '{print $2}'`"
    if [ $CODE -eq 404 ]
    then
        echo "Linux Unplugged episode $LUP is not available yet"
    else
        echo "Linux Unplugged episode $LUP is downloading"
        wget http://201406.jb-dl.cdn.scaleengine.net/linuxun/2014/lup-00$LUP-432p.mp4 -P $LINUXUNPLUGGED/
    
    fi
fi

#Coder Radio
FILE="$CODERRADIO/cr-0$CR-432p.mp4"
if [ -f $FILE ];
then
    echo "Coder Radio episode $CR is already downloaded"
    CR=$(($CR+1))
else
    CODE="`wget --spider -S "http://201406.jb-dl.cdn.scaleengine.net/coderradio/2014/cr-0$CR-432p.mp4" 2>&1 | grep "HTTP/" | awk '{print $2}'`"
    if [ $CODE -eq 404 ]
    then
        echo "Coder Radio episode $CR is not available yet"
    else
        echo "Coder Radio episode $CR is downloading"
        wget http://201406.jb-dl.cdn.scaleengine.net/coderradio/2014/cr-0$CR-432p.mp4 -P $CODERRADIO/
    fi
fi

echo -e TTT=$TTT\\nLAS=$LAS\\nLUP=$LUP\\nCR=$CR > "$HOME/Development/podcast/config.sh"

