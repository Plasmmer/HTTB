#!/bin/sh

echo "Installing httb..."

sudo cp -f httb /usr/bin/httb

sudo mkdir /usr/lib/httb
sudo cp -f README.md /usr/lib/httb/README.md
#sudo cp -rf custom /usr/lib/httb/custom/
rsync -av custom/ /usr/lib/httb/custom
#mkdir /usr/lib/httb/custom/db

mkdir /var/www
mkdir /var/www/html

mkdir /etc/httb
cat >> /etc/httb/httb.conf.json <<EOF
{
	"htmlfolder": "/var/www/html"
}
EOF

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
