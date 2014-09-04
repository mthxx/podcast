#!/bin/bash
source config.sh

#podcast Path
PODCAST="/Music/podcast"

#Tech Talk Today
FILE="$HOME$PODCAST/Tech_Talk_Today/T3-00$ttt-432p.mp4"
if [ -f $FILE ];
then
    ttt=$(($ttt+1))
else
    echo "Tech Talk Today is Downloading"
    wget http://201406.jb-dl.cdn.scaleengine.net/t3/2014/T3-00$ttt-432p.mp4 -P $HOME$PODCAST/Tech_Talk_Today/
fi

#Linux Action Show
FILE="$HOME$PODCAST/Linux_Action_Show/linuxactionshowep328-432p.mp4"
if [ -f $FILE ];
then
    las=$(($las+1))
else
    echo "Linux Action Show is Downloading"
    wget http://201406.jb-dl.cdn.scaleengine.net/las/2014/linuxactionshowep$las-432p.mp4 -P $HOME$PODCAST/Linux_Action_Show/
fi

#Linux Unplugged
FILE="$HOME$PODCAST/Linux_Unplugged/lup-00$lup-432p.mp4"
if [ -f $FILE ];
then
    lup=$(($lup+1))
else
    echo "Linux Unplugged is Downloading"
    wget http://201406.jb-dl.cdn.scaleengine.net/linuxun/2014/lup-00$lup-432p.mp4 -P $HOME$PODCAST/Linux_Unplugged/
fi


# Coder Radio
FILE="$HOME$PODCAST/Coder_Radio/cr-0$cr-432p.mp4"
if [ -f $FILE ];
then
    cr=$(($cr+1))
else
    echo "Coder Radio is Downloading"
    wget http://201406.jb-dl.cdn.scaleengine.net/coderradio/2014/cr-0$cr-432p.mp4 -P $HOME$PODCAST/Coder_Radio/
fi

echo -e ttt=$ttt\\nlas=$las\\nlup=$lup\\ncr=$cr > "$HOME/Development/podcast/config.sh"

