#!/bin/sh
xrandr \
  --output    eDP1        \
    --mode    1368x768    \
    --pos     0x824       \
    --left-of VGA1        \
  \
  --output    HDMI1       \
    --mode    1680x1050   \
    --pos     3286x0      \
    --rotate  left        \
  \
  --output    VGA1        \
    --primary             \
    --mode    1920x1080   \
    --pos     1366x424    \
    --rotate  normal      \
    --left-of HDMI1       \
  \
  --output    VIRTUAL1    \
    --off
