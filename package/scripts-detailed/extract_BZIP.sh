#!/bin/bash

Exec=bash -c '' 'dummy-param' %F

Exec=bash -c 'nameext=$(basename "$1"); content=${nameext%.*}; dir=$(dirname "$1"); cd "$dir"; overw="0"; if ( [ -d "$content" ] || [ -f "$content" ] ); then echo "file/folder exists"; overw=$(kdialog --warningyesno "Existing data must be overwritten to extract this archive. Do you want to overwrite them?"; case $? in 0) ow="0";; 1) ow="1";; esac; echo "$ow"; "$ow"); fi; echo $overw; if [ "$overw" == "0" ]; then bunzip2 -f "$nameext"; kdialog --title "Extract" --msgbox "Extraction done!"; else kdialog --title "Extract" --error "Extraction aborted!"; fi;' 'dummy-param' %F