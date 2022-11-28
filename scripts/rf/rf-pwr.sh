#!/bin/sh

. ../phoenix_gpio.conf
# RF_PIN=
# RF_CHIP=
RF_DEV=watchdog1
LIB=../lib
RF_ENABLE=1
RF_DISABLE=0

check_wdt(){
    $LIB/check_config.sh -d $RF_DEV
}

main(){

    check_wdt

    case $1 in 
    enable|ENABLE)
        $LIB/gpio-switch $RF_CHIP $RF_PIN $RF_ENABLE
        ;;
    disable|DISABLE)
        $LIB/gpio-switch $RF_CHIP $RF_PIN $RF_DISABLE
        ;;
    *)  echo "Invalid parameter"
        ;;
    esac

}

main $1