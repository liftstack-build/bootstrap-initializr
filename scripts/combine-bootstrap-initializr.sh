#!/usr/bin/env bash

# update initializr's bootstrap with latest bootstrap version from repo
# 
# 1.  Download Initializr with Bootstrap
#   Main Page:          http://www.initializr.com
#   Direct Download:    http://www.initializr.com/builder?mode=less&boot-hero&h5bp-htaccess&h5bp-nginx&h5bp-webconfig&h5bp-chromeframe&h5bp-analytics&h5bp-build&h5bp-iecond&h5bp-favicon&h5bp-appletouchicons&h5bp-scripts&h5bp-robots&h5bp-humans&h5bp-404&h5bp-adobecrossdomain&jquery&modernizrrespond&boot-css&boot-scripts
#
# 2.  Download latest Bootstrap or clone the github repo
#   http://twitter.github.com/bootstrap/
#
# 3.  Run this script from the same directory.  This simply copies all files in 
#   bootstrap/js, bootstrap/less, and bootstrap/img to their respective directories
#   in initializr's unpacked directory, overwriting old versions, and renaming 
#   some files appropriately (for example, removing the 'bootstrap-' preface on 
#   bootstrap js files.

INITIALIZR="./initializr"
BOOTSTRAP="./submodules/bootstrap"
TEMP="./temp"
TARGET="./target"

while getopts "initializr:bootstrap:temp:target"\
    optionName; do
    case "$optionName" in
        initializr)     INITIALIZR="$OPTARG";;
        bootstrap)      BOOTSTRAP="$OPTARG";;
        temp)           TEMP="$OPTARG";;
        target)         TARGET="$OPTARG";;
        [?]) printErrorHelpAndExit "badOptionHelp";;
    esac
done


#1.  create initializr, bootstrap, target, temp
if [ ! -d "$INITIALIZR" ]; then 
    echo "$INITIALIZR does not exist, please try again."
fi
    
if [ ! -d "$BOOTSTRAP" ]; then
   echo "$BOOTSTRAP does not exist, please try again."
fi

if [ -d "$TEMP" ]; then
    rm -rf $TEMP
fi

if [ -d "$TARGET" ]; then
    rm -rf $TARGET
fi

mkdir -p $TEMP
mkdir -p $TARGET

#2.  copy initializr target
cp -r $INITIALIZR/* $TARGET

#3.  copy bootstrap temp (only needed files)
cp -r $BOOTSTRAP/img $TEMP
cp -r $BOOTSTRAP/js $TEMP
cp -r $BOOTSTRAP/less $TEMP

#4.  mmv -r "bootstrap-*" "#1"
mmv "$TEMP/js/bootstrap-*" "$TEMP/js/#1"
mmv "$TEMP/js/tests/unit/bootstrap-*" "$TEMP/js/tests/unit/#1"

#5.  copy temp target
# http://superuser.com/questions/62141/linux-how-to-move-all-files-from-current-directory-to-upper-directory
# shopt -s dotglob; mv -- * .. 
# for zsh, s/shopt/setopt/g
cp -r $TEMP/img/* $TARGET/img/
cp -r $TEMP/js/* $TARGET/js/libs/bootstrap/
cp -r $TEMP/js/.jshintrc $TARGET/js/libs/bootstrap/
cp -r $TEMP/less/* $TARGET/less/bootstrap/
cp -r $TEMP/less/* $TARGET/less/bootstrap/
#( shopt -s dotglob; cp -r $TEMP/img/* $TARGET/img/ )
#( shopt -s dotglob; cp -r $TEMP/js/* $TARGET/js/libs/bootstrap/ )
#( shopt -s dotglob; cp -r $TEMP/less/* $TARGET/less/bootstrap/ )
#setopt -s extendedglob; cp -r $TEMP/img/* $TARGET/img/
#setopt -s extendedglob; cp -r $TEMP/js/* $TARGET/js/libs/bootstrap/
#setopt -s extendedglob; cp -r $TEMP/less/* $TARGET/less/bootstrap/
#shopt -s dotglob
#cp -r $TEMP/img/* $TARGET/img/
#cp -r $TEMP/js/* $TARGET/js/libs/bootstrap/
#cp -r $TEMP/less/* $TARGET/less/bootstrap/
#setopt extendedglob
#cp -r $TEMP/img/* $TARGET/img/
#cp -r $TEMP/js/* $TARGET/js/libs/bootstrap/
#cp -r $TEMP/less/* $TARGET/less/bootstrap/

#6.  backup this script to scripts repo
cp combine-bootstrap-initializr.sh ~/bin/scripts
