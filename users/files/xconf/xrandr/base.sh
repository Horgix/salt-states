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
    --off                 \
  \
  --output    VIRTUAL1    \
    --off
