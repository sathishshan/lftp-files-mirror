#!/bin/bash

#usage
function usage {
	echo "USAGE: For MAN page use -m [help command]"
	echo "$0 -u Username -p 'Password' -h Host -d Domain.com -f path_to_remotefile.txt"
}

while getopts ":u:p:h:d:f:m" opt; do
	case "$opt" in
		u)
			FTPNAME=$OPTARG
			;;
		p)
			FTPPASS=$OPTARG
			;;
		h) 
			HOST=$OPTARG
			;;
		d) 
			DOMAIN=$OPTARG
			;;
		f)
			REMOTE_FILE=$OPTARG
			;;
		m | *)
		 	usage
		 	exit
		 	;;
		?)
                        echo "I don't know what $OPTARG is !!!"
                        usage
                        exit 1
			;;
	esac
done

locpath="/home/sathish/Downloads/${DOMAIN}/out"
dom="/home/sathish/Downloads/${DOMAIN}"

if [ -d "${dom}" ]; then
	echo "The Domain name already exist!"
	exit 1
else
mkdir -p "${locpath}"

#Passing Arguments

# Creating lftp_runner
echo "
set net:timeout 10
set ssl:verify-certificate false
set ftp:ssl-allow no
set ftp:passive-mode true
set ftp:list-options -a

open $HOST
user $FTPNAME \"$FTPPASS\"" > "${locpath}/lftp_runner.txt"

cat "$REMOTE_FILE" 2> /dev/null | while read line
do
echo "mget -d ${line}" >> "${locpath}/lftp_runner.txt"
done
cd "${dom}"
# Executing lftp runner

lftp -f "${locpath}/lftp_runner.txt"
echo "Mirroring Completed, Successfully!"
fi
