#!/bin/bash
	clear
	echo " ********** WeCan MTProxy | @WeCanGP ********** "
# cat /etc/system-release | grep -o '.*\.'
OS=$( cat /etc/system-release | cut -d ' ' -f 1)
VER=$( cat /etc/system-release | cut -d ' ' -f 3)
echo "OS: $OS "
echo "Version: $VER "
if [ $VER < 7 ]
then
   cp -fr $PWD/Makefile.6.x $PWD/Makefile
else
  cp -fr $PWD/Makefile.7.x $PWD/Makefile
fi

make all
cd objs/bin
curl -s https://core.telegram.org/getProxySecret -o proxy-secret
curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf
adduser -M mtproxy

