#!/bin/bash
if ! dm-tool list-seats|grep -q CanSwitch=false
then
    echo "new"
    dm-tool add-nested-seat --screen 1920x1046 &
    sleep 1
    wmctrl -r Xephyr -T "Tiling Desktop" &
    devilspie2 --folder ~/.config/devilspie2 &
else
    echo "switch"
    wmctrl -a "Tiling Desktop"
fi

