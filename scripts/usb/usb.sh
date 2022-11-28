#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
. $TMP_PATH/phoenix_gpio.conf
LIB=$TMP_PATH/lib
# USB_ENABLE_PIN=
# USB_ENABLE_CHIP=
USB_ENABLE=0
USB_DISABLE=1

main(){


    case $1 in 
    enable|ENABLE)
        $LIB/gpio-switch $USB_ENABLE_CHIP $USB_ENABLE_PIN $USB_ENABLE
        ;;
    disable|DISABLE)
        $LIB/gpio-switch $USB_ENABLE_CHIP $USB_ENABLE_PIN $USB_DISABLE
        ;;
    *)  echo "Invalid parameter"
        ;;
    esac

}

main $1