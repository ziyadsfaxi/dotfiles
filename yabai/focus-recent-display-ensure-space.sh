#!/bin/bash

# Get current display index
current_display=$(yabai -m query --displays --display | jq -r '.index')

# Get all displays and find the recent one (the one that isn't current)
recent_display=$(yabai -m query --displays | jq -r "[.[] | select(.index != $current_display)][0].index")

if [[ -z "$recent_display" || "$recent_display" == "null" ]]; then
    # No other display found, exit
    exit 0
fi

# Try to find a window on the target display to focus
# This is the most reliable way to transfer focus between displays
target_window=$(yabai -m query --windows | jq -r "map(select(.display == $recent_display))[0].id")

if [[ -n "$target_window" && "$target_window" != "null" ]]; then
    # Found a window, focus it
    yabai -m window --focus "$target_window"
else
    # No windows on target display, try to find a non-visible space
    target_space=$(yabai -m query --spaces | jq -r "map(select(.display == $recent_display and .[\"is-visible\"] == false))[0].index")

    if [[ -z "$target_space" || "$target_space" == "null" ]]; then
        # All spaces on target display are visible, create a new one
        yabai -m space --display "$recent_display" --create
        target_space=$(yabai -m query --spaces | jq -r "map(select(.display == $recent_display and .[\"is-visible\"] == false))[0].index")
    fi

    yabai -m space --focus "$target_space"
fi
