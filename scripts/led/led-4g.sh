#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
. $TMP_PATH/phoenix_gpio.conf
# LED_4G_CHIP=
# LED_4G_PIN1=
# LED_4G_PIN2=
# LED_4G_PIN3=
# LED_4G_PIN4=
ON=0
OFF=1

LIB=$TMP_PATH/lib

LED_LEVEL(){
    $LIB/gpio-led ${LED_4G_CHIP} ${LED_4G_PIN1} $1
    $LIB/gpio-led ${LED_4G_CHIP} ${LED_4G_PIN2} $2
    $LIB/gpio-led ${LED_4G_CHIP} ${LED_4G_PIN3} $3
    $LIB/gpio-led ${LED_4G_CHIP} ${LED_4G_PIN4} $4
}

main(){
    case $1 in
    0)
        LED_LEVEL OFF OFF OFF OFF
        ;;
    1)
        LED_LEVEL ON OFF OFF OFF
        ;;
    2)
        LED_LEVEL ON ON OFF OFF
        ;;
    3)
        LED_LEVEL ON ON ON OFF
        ;;
    4)
        LED_LEVEL ON ON ON ON
        ;;
    *)  echo "Invalid parameter"
        ;;
    esac    
}

main $1