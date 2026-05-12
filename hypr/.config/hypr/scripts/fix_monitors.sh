#!/usr/bin/env bash

sleep 2

hyprctl keyword monitor "desc:AU Optronics 0x5895,1920x1080@165,0x0,1"
hyprctl keyword monitor "desc:Shenzhen KTC Technology Group AQ27H1,1920x1080@144,1920x0,1"

sleep 0.3

hyprctl dispatch movecursor 960 540
sleep 0.1
hyprctl dispatch movecursor 2000 500
