#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
. $TMP_PATH/phoenix_gpio.conf
# LED_RF_PIN1=
# LED_RF_PIN2=
# LED_CHIP=
LED_ON=0
LED_OFF=1
LIB=$TMP_PATH/lib

main(){

    case $1 in
    off|OFF)
        $LIB/gpio-led $LED_CHIP $LED_RF_PIN1 $LED_OFF
        $LIB/gpio-led $LED_CHIP $LED_RF_PIN2 $LED_OFF
        ;;
    r|R)
        $LIB/gpio-led $LED_CHIP $LED_RF_PIN1 $LED_ON
        $LIB/gpio-led $LED_CHIP $LED_RF_PIN2 $LED_OFF
        ;;
    g|G)
        $LIB/gpio-led $LED_CHIP $LED_RF_PIN1 $LED_OFF
        $LIB/gpio-led $LED_CHIP $LED_RF_PIN2 $LED_ON
        ;;
    rg|RG)
        $LIB/gpio-led $LED_CHIP $LED_RF_PIN1 $LED_ON
        $LIB/gpio-led $LED_CHIP $LED_RF_PIN2 $LED_ON
        ;;
    *)  echo "Invalid parameter"
        ;;
    esac
}

main $1