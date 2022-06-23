#!/bin/sh

# terminate already running bar instances
killall -q polybar

# launch the bar
polybar top & disown
