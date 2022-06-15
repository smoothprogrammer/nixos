#!/bin/sh

# terminate already running bar instances
killall -q polybar

# launch bar
polybar top 2>&1 | tee -a /tmp/polybar-top.log & disown
