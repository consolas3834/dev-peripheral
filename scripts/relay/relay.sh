#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
. $TMP_PATH/phoenix_gpio.conf
# RELAY_PIN1=
# RELAY_PIN2=
# RELAY_CHIP=
RELAY_ON=0
RELAY_OFF=1
LIB=$TMP_PATH/lib

main(){

    local RELAY_PIN
    case $1 in
    relay1)
        RELAY_PIN=$RELAY_PIN1
        ;;
    relay2)
        RELAY_PIN=$RELAY_PIN2
        ;;
    *)  echo "Invalid parameter"
        ;;

    case $2 in
    on|ON)
        $LIB/gpio-switch $RELAY_CHIP $RELAY_PIN $RELAY_ON
        ;;
    off|OFF)
        $LIB/gpio-switch $RELAY_CHIP $RELAY_PIN $RELAY_OFF
        ;;
    *)  echo "Invalid parameter"
        ;;
    esac

}

main $1