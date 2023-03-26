#!/bin/sh

# terminate already running bar instances
polybar-msg cmd quit

# launch the bar
polybar top & disown
