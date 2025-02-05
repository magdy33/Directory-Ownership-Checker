
#auther : magdi_
#date :
#last modified
#description : this script is to find if there is a directory which is attached to a certin user

#!/bin/bash

cd /home/

for DIR in *
	do
	CHK=$(grep -c "/home/$DIR" /etc/passwd)
	if [ $CHK -ge 1 ]
		then 
		continue 		
	else
		echo "$DIR is not attached to a user"

fi
done
