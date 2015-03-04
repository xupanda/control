#!/bin/bash
# run your command to ervery ser.

# set iplist from $1
if [ -z $1 ];then
        echo "Useage: $0 {iplist file name}"
        echo "For example:"
        echo "          $0 ./iplist"
        echo ""
        exit 1
        elif [ ! -f $1 ];then
                echo "Invaild file."
                exit 2
fi
IL=$1

# get command from read
while :
do
        read -p "Your command : " com
        read -p "Verify: $com ,right? (y/n) " ver
        case $ver in
                y)
                break
                ;;
                n)
                echo "Reinput ! "
                continue
                ;;
                *)
                echo "Reinput ! "
                continue
        esac
done
#com="/etc/init.d/php-fpm reload"

while read ip;do
        #while read ip port;do
        echo ""
        echo "Result of $ip"
        0</dev/null ssh $ip $com
        if [ $? -ne 0 ];then
                echo "Not done!"
                echo ""
        fi
done < $IL
