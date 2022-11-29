#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
. $TMP_PATH/phoenix_gpio.conf
# LED_CLOUD_PIN1=
# LED_CLOUD_PIN2=
# LED_CHIP=
LED_ON=0
LED_OFF=1
LIB=$TMP_PATH/lib

main(){

    case $1 in
    off|OFF)
        $LIB/gpio-led $LED_CHIP $LED_CLOUD_PIN1 $LED_OFF
        $LIB/gpio-led $LED_CHIP $LED_CLOUD_PIN2 $LED_OFF
        ;;
    green|GREEN)
        $LIB/gpio-led $LED_CHIP $LED_CLOUD_PIN1 $LED_ON
        $LIB/gpio-led $LED_CHIP $LED_CLOUD_PIN2 $LED_OFF
        ;;
    red|RED)
        $LIB/gpio-led $LED_CHIP $LED_CLOUD_PIN1 $LED_OFF
        $LIB/gpio-led $LED_CHIP $LED_CLOUD_PIN2 $LED_ON
        ;;
    yellow|YELLOW)
        $LIB/gpio-led $LED_CHIP $LED_CLOUD_PIN1 $LED_ON
        $LIB/gpio-led $LED_CHIP $LED_CLOUD_PIN2 $LED_ON
        ;;
    *)  echo "Invalid parameter"
        ;;
    esac
}

main $1