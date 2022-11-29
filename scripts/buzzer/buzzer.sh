#!/bin/sh

echo $0
TMP_PATH=$(dirname $(dirname $0))
. $TMP_PATH/phoenix_gpio.conf

BUZZER_ON=0
BUZZER_OFF=1
LIB=$TMP_PATH/lib

main(){
    case $1 in
    on|ON)
        $LIB/gpio-switch $BUZZER_CHIP $BUZZER_PIN $BUZZER_ON
        ;;
    off|OFF)
        $LIB/gpio-switch $BUZZER_CHIP $BUZZER_PIN $BUZZER_OFF
        ;;
    *)  echo "Invalid parameter"
        ;;
    esac
}

main $1