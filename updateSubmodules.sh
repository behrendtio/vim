# !/bin/bash
# # # # # # # # # # # # # # # # # # # # # # # # # # #
# Submodule (plugin) update script                  #
#                                                   #
# AUTHOR Mario Behrendt                             #
# VERSION 0.1                                       #
# COPYRIGHT 2011 Mario Behrendt                     #
# SINCE 28.05.2011                                  #
# # # # # # # # # # # # # # # # # # # # # # # # # # #

BASEDIR=`pwd`
LOGFILE=update.log
DATE=`date`

clear
echo "Checking submodules"

echo $DATE > $BASEDIR/$LOGFILE
echo "" >> $BASEDIR/$LOGFILE

for SUBMODULE in `ls bundle`; do
    cd bundle/$SUBMODULE

	echo "Submodule $SUBMODULE" >> $BASEDIR/$LOGFILE
	echo "==============================" >> $BASEDIR/$LOGFILE

    git checkout master >> $BASEDIR/$LOGFILE 2>&1
    git pull >> $BASEDIR/$LOGFILE 2>&1
	echo "" >> $BASEDIR/$LOGFILE

    cd $BASEDIR
	echo -n "."
done

echo " Done"
echo ""
echo "Remove update log in $BASEDIR/$LOGFILE? [Y/n]"

read -n 1 -s ANSWER

if  ([ "" == "$ANSWER" ] || [ "Y" == "$ANSWER" ] || [ "y" == "$ANSWER" ]); then
	rm -f $BASEDIR/$LOGFILE
	echo "Log deleted"
fi

exit 0
