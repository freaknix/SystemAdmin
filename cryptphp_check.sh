#!/bin/bash
#Author: Afzaal Shabbir (freaknix.freezone@gmail.com)
#Purpose: CHeck CryptPHP vulnerability on wordpress sites.

log=/tmp/cryptphp.txt

>/tmp/cryptphp.txt

droot='/var/www/vhosts/'

if [ ! -f "$log" ]; then
touch $log
fi

echo "" > $log

cd $droot

find $droot*/httpdocs -type f -name social.png -exec file {} \;| grep PHP > $log

if [ -s "$log" ]; then
   cat $log| mail -s "CryptPHP Infected domains on Apollo" -a cryptphp.txt sa-group@freezone.co.uk

fi

exit 0
