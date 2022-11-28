#!/bin/sh

DEV_PATH=/dev
NET_PATH=/proc/sys/net/ipv4/conf

check_dev(){
    dev=$1
    find $DEV_PATH -name $DEV
}

check_module(){
    module=$1
    lsmod | grep $1
}

check_net(){
    net=$1
    [ -d $NET_PATH/$net ]
}

main(){

opts=`getopt -a -o d:n:m:D:N:M: --long net:,dev:,module:,help -- "$@"`
eval set -- "$opts"

while :
do
    case $1 in
    -d|-D|--dev)
        shift
        check_dev $1
        shift
        ;;
    -n|-N|--net) 
        shift
        check_net $1
        shift
        ;;
    -m|-M|--module)
        shift
        check_module $1
        shift
        ;;
    --help)
        shift
        usage
        ;;
    --) 
        shift
        break
        ;;
    *)   ;;
    esac
done
}

main $@
