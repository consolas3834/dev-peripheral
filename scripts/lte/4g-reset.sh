#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
. $TMP_PATH/phoenix_gpio.conf
# LTE_RESET_PIN=10
# LTE_RESET_CHIP=0
LTE_HIGH=1
LTE_LOW=0

lte_reset(){
    gpiod $LTE_RESET_CHIP $LTE_RESET_PIN=$LTE_HIGH
    sleep 0.5
    gpiod $LTE_RESET_CHIP $LTE_RESET_PIN=$LTE_LOW
}

lte_reset