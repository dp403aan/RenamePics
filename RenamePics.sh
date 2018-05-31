#!/bin/sh
#--------------------------------------------------------------------------------
# Title..............: RenamePics.sh
# Description........: This script will rename pics with number incrementation
#                    : ex: Manila_0001.jpg, Manila_0002.jpg, Manila_0003.jpg, ...
# Author.............: dp403aan
# Creation date......: jeu 17 fév 14:13:01 NFT 2011
# Usage..............: ./RenamePics.sh
# Args...............:
# Notes..............:
#--------------------------------------------------------------------------------
# clear screen
clear

# Directory of pics
echo -e "Place of the pics ? "
read PLACE
cd ${PLACE}

echo -e "Pics before renaming :\n----------------------\n`ls -1 $1`"

echo -e "\nName for new pics ?"
read NAME

echo -e "\nWhich file extension (ex: jpg/JPG/png/PNG) ?"
read EXTENSION

echo -e "\nWhich number to start with (ex: 0001 or 0022 or whatever) ?"
read NUM

NUM2=`expr 1 + ${NUM}`
NUM2=`awk 'BEGIN{NUM2="'${NUM2}'";printf ("%04d", NUM2)}'`
NUM3=`expr 1 + ${NUM2}`
NUM3=`awk 'BEGIN{NUM3="'${NUM3}'";printf ("%04d", NUM3)}'`
NUM4=`expr 1 + ${NUM3}`
NUM4=`awk 'BEGIN{NUM4="'${NUM4}'";printf ("%04d", NUM4)}'`

echo -e "\nSum up before renaming :\n------------------------\n"

echo -e "- ${NAME}_${NUM}.${EXTENSION} for the first pic\n- ${NAME}_${NUM2}.${EXTENSION} for the second one\n- ${NAME}_${NUM3}.${EXTENSION} for the third one\n- ${NAME}_${NUM4}.${EXTENSION} for the fourth one\n- and so on ..."

echo -e "\nIs this OK (o/n) ?"
read REP
if [ ${REP} = "o" ]
then
 echo -e "OK ... renaming is on the way ..."
else
 exit
fi

NUM=`expr ${NUM} - 1`

for file in *.${EXTENSION}
do
 NUM=`expr 1 + ${NUM}`
 NUM=`awk 'BEGIN{NUM="'${NUM}'";printf ("%04d", NUM)}'`
 mv "${file}" ${NAME}_${NUM}.${EXTENSION}
done

echo -e "\nEnd of renaming..."

echo -e "\nPics after renaming:\n-----------------------\n`ls -1 *`"
