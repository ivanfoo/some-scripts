#!/bin/bash

# RESOLUTION SETTINGS
# This sets your VGA1 monitor to its best resolution.
xrandr --output VGA1 --mode 1280x1024 --rate 60
# This sets your laptop monitor to its best resolution.
xrandr --output LVDS1 --mode 1280x800 --rate 60

# MONITOR ORDER
# Put the Laptop right, VGA1 monitor left
xrandr --output VGA1 --left-of LVDS1
# Put the Laptop left, VGA1 monitor right
# xrandr --output LVDS1 --left-of VGA1

# PRIMARY MONITOR
# This sets your laptop monitor as your primary monitor.
# xrandr --output LVDS --primary
# This sets your VGA monitor as your primary monitor.
xrandr --output VGA1 --primary
