#!/bin/sh

echo "Installing httb..."

sudo cp -f httb /usr/bin/httb

sudo mkdir /usr/lib/httb
sudo cp -f README.md /usr/lib/httb/README.md

mkdir /var/www
mkdir /var/www/html

installfail(){
   echo "Installation has failed."
   exit 1
}

if [ -f /usr/bin/httb ];then
   echo "- Turning httb into an executable..."
   sudo chmod +x /usr/bin/httb
   echo "Done!"
#   if httb babyisalive; then echo "Done! Running \"httb -r '#first' sample.html\" command as example to use it:" && (httb -r '#first' /usr/lib/httb/sample.html &);exit 0; else installfail; fi
   else
      installfail
fi
