#!/bin/sh 

dayanddate () {
    LC_TIME="es_MC.UTF-8" date '+%G. %B. %e, %A'
}

battery () {
    ~/.scripts/statusbarsetup/battery.sh
}

wifi () {
    ~/.scripts/statusbarsetup/wifi.sh
}

volume () {
    ~/.scripts/statusbarsetup/volume.sh 
}

timedate () {
    date '+%I:%M:%S %p'
}

while :; do
    xsetroot -name "$(dayanddate)"";""$(battery)""$(wifi)"" $(volume)"" $(timedate)"
    sleep 1
done
