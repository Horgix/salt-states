#!/bin/sh
xrandr \
  --output    eDP1        \
    --primary             \
    --mode    1600x900    \
  \
  --output    HDMI1       \
    --off                 \
  \
  --output    VGA1        \
    --mode    1024x768    \
    --right-of eDP1       \
  \
  --output    VIRTUAL1    \
    --off
