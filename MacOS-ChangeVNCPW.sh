#!/usr/bin/env bash

[ -z $VNCPassword ] && echo "VNCPassword variable is empty. Exiting" && exit

PasswordLength=${#VNCPassword}
[ $PasswordLength -gt 8 ]  && echo "The password cant be larger than 8 characters. It's currently $PasswordLength characters long. Exiting" && exit

echo "Changing Password"
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -clientopts -setvnclegacy -vnclegacy yes -setvncpw -vncpw "$VNCPassword"

echo "Restarting VNC Service"
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent && echo "DONE"
