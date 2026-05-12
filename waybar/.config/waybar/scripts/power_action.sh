#!/usr/bin/env bash

case "$1" in
    lock)
        pidof hyprlock >/dev/null || hyprlock
        ;;

    logout)
        hyprctl dispatch exit
        ;;

    suspend)
        pidof hyprlock >/dev/null || hyprlock &
        sleep 0.5
        systemctl suspend
        ;;

    hibernate)
        pidof hyprlock >/dev/null || hyprlock &
        sleep 0.5
        systemctl hibernate
        ;;

    reboot)
        systemctl reboot
        ;;

    shutdown)
        systemctl poweroff
        ;;

    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 1
        ;;
esac
