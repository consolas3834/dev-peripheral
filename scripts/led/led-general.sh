#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
. $TMP_PATH/phoenix_gpio.conf
# LED_RGB_RED=
# LED_RGB_GREEN=
# LED_RGB_BLUE=
# LED_CHIP=
LED_ON=0
LED_OFF=1
LIB=$TMP_PATH/lib


main(){

    case $1 in
    off|OFF)
        $LIB/gpio-led $LED_CHIP $LED_RGB_RED $LED_OFF
        $LIB/gpio-led $LED_CHIP $LED_RGB_GREEN $LED_OFF
        $LIB/gpio-led $LED_CHIP $LED_RGB_BLUE $LED_OFF
        ;;
    r|R)
        $LIB/gpio-led $LED_CHIP $LED_RGB_RED $LED_ON
        $LIB/gpio-led $LED_CHIP $LED_RGB_GREEN $LED_OFF
        $LIB/gpio-led $LED_CHIP $LED_RGB_BLUE $LED_OFF
        ;;
    g|G)
        $LIB/gpio-led $LED_CHIP $LED_RGB_RED $LED_OFF
        $LIB/gpio-led $LED_CHIP $LED_RGB_GREEN $LED_ON
        $LIB/gpio-led $LED_CHIP $LED_RGB_BLUE $LED_OFF
        ;;
    b|B)
        $LIB/gpio-led $LED_CHIP $LED_RGB_RED $LED_OFF
        $LIB/gpio-led $LED_CHIP $LED_RGB_GREEN $LED_OFF
        $LIB/gpio-led $LED_CHIP $LED_RGB_BLUE $LED_ON
        ;;
    rg|RG)
        $LIB/gpio-led $LED_CHIP $LED_RGB_RED $LED_ON
        $LIB/gpio-led $LED_CHIP $LED_RGB_GREEN $LED_ON
        $LIB/gpio-led $LED_CHIP $LED_RGB_BLUE $LED_OFF
        ;;
    rb|RB)
        $LIB/gpio-led $LED_CHIP $LED_RGB_RED $LED_ON
        $LIB/gpio-led $LED_CHIP $LED_RGB_GREEN $LED_OFF
        $LIB/gpio-led $LED_CHIP $LED_RGB_BLUE $LED_ON
        ;;
    gb|GB)
        $LIB/gpio-led $LED_CHIP $LED_RGB_RED $LED_OFF
        $LIB/gpio-led $LED_CHIP $LED_RGB_GREEN $LED_ON
        $LIB/gpio-led $LED_CHIP $LED_RGB_BLUE $LED_ON
        ;;
    rgb|RGB)
        $LIB/gpio-led $LED_CHIP $LED_RGB_RED $LED_ON
        $LIB/gpio-led $LED_CHIP $LED_RGB_GREEN $LED_ON
        $LIB/gpio-led $LED_CHIP $LED_RGB_BLUE $LED_ON
        ;;
    *)  echo "Invalid parameter"
        ;;
    esac
}

main $1