#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
. $TMP_PATH/phoenix_gpio.conf
# LED_BT_PIN=
# LED_BT_CHIP=
LED_BT_ON=0
LED_BT_OFF=1
LIB=$TMP_PATH/lib

main(){

    case $1 in
    on|ON)
        $LIB/gpio-led $LED_BT_CHIP $LED_BT_PIN $LED_BT_ON
        ;;
    off|OFF)
        $LIB/gpio-led $LED_BT_CHIP $LED_BT_PIN $LED_BT_OFF
        ;;
    *)  echo "Invalid parameter"
        ;;
    esac

}

main $1