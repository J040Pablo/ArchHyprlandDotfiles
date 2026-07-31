#!/bin/bash

if hyprctl monitors | grep -q "Monitor eDP-1"; then
    hyprctl keyword monitor "eDP-1,disable"
else
    hyprctl keyword monitor "eDP-1,1366x768,1920x0,1"
fi