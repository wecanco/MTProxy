
#!/bin/bash
# cat /etc/system-release | grep -o '.*\.'
OS=$( cat /etc/system-release | cut -d ' ' -f 1)
VER=$( cat /etc/system-release | cut -d ' ' -f 3)

if [ $VER < 7 ]
then
   cp -fr Makefile.6.x Makefile
else
  cp -fr Makefile.7.x Makefile
fi

make
