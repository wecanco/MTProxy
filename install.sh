#!/bin/bash
	clear
	echo " ********** WeCan MTProxy | @WeCanGP ********** "
# cat /etc/system-release | grep -o '.*\.'
OS=$( cat /etc/system-release | cut -d ' ' -f 1)
VER=$( cat /etc/system-release | cut -d ' ' -f 3)
echo "OS Version: $VER \n"
if [ $VER < 7 ]
then
   cp -fr Makefile.6.x Makefile
else
  cp -fr Makefile.7.x Makefile
fi

make all
cd objs/bin
curl -s https://core.telegram.org/getProxySecret -o proxy-secret
curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf
adduser -M mtproxy

