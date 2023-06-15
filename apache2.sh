#! /bin/bash

mkdir /www
cd /www
yum install -y wget bzip2 expat-devel gcc gcc-c++ 
wget https://downloads.apache.org/httpd/httpd-2.4.57.tar.bz2
wget https://downloads.apache.org/apr/apr-1.7.4.tar.bz2
wget https://downloads.apache.org/apr/apr-util-1.6.3.tar.bz2
wget https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.bz2
tar xvfj httpd-2.4.57.tar.bz2 
tar xvfj apr-1.7.4.tar.bz2 
tar xvfj apr-util-1.6.3.tar.bz2 
tar xvfj pcre-8.45.tar.bz2 
cd apr-1.7.4
./configure --prefix=/www/apr ; make ; make install 
cd ../apr-util-1.6.3
./configure --prefix=/www/aprutil --with-apr=/www/apr ; make ; make install 
cd ../pcre-8.45
./configure --prefix=/www/pcre ; make ; make install 
cd ../httpd-2.4.57
./configure --prefix=/usr/local/apache2 --with-apr=/www/apr --with-apr-util=/www/aprutil --with-pcre=/www/pcre/bin/pcre-config ; make ; make install
/usr/local/apache2/bin/apachectl start
firewall-cmd --add-port=80/tcp

