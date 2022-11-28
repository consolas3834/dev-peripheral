#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
. $TMP_PATH/phoenix_gpio.conf
# WDT_PIN=
# WDT_CHIP=
WDT_DEV=watchdog1
LIB=$TMP_PATH/lib
WDT_ENABLE=1
WDT_DISABLE=0

check_wdt(){
    $LIB/check_config.sh -d $WDT_DEV
}

main(){

    check_wdt

    case $1 in 
    enable|ENABLE)
        $LIB/gpio-switch $WDT_CHIP $WDT_PIN $WDT_ENABLE
        ;;
    disable|DISABLE)
        $LIB/gpio-switch $WDT_CHIP $WDT_PIN $WDT_DISABLE
        ;;
    *)  echo "Invalid parameter"
        ;;
    esac

}

main $1