#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
. $TMP_PATH/phoenix_gpio.conf
# LED_WIFI_PIN=
# LED_WIFI_CHIP=
LED_WIFI_ON=0
LED_WIFI_OFF=1
LIB=$TMP_PATH/lib

main(){
    echo "$LED_WIFI_CHIP $LED_WIFI_PIN"
    case $1 in
    on|ON)
        $LIB/gpio-led $LED_WIFI_CHIP $LED_WIFI_PIN $LED_WIFI_ON
        ;;
    off|OFF)
        $LIB/gpio-led $LED_WIFI_CHIP $LED_WIFI_PIN $LED_WIFI_OFF
        ;;
    *)  echo "Invalid parameter"
        ;;
    esac

}

main $1