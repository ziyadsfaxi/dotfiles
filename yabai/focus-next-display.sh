#!/bin/bash

# Get current display index
current_display_index=$(yabai -m query --displays --display | jq '.index')

# Get an array of display indices
display_indices=($(yabai -m query --displays | jq -r '.[].index'))

# Find the current index in the array
current_index=-1
for i in "${!display_indices[@]}"; do
   if [[ "${display_indices[$i]}" == "$current_display_index" ]]; then
       current_index=$i
       break
   fi
done

# This should not happen
if [[ "$current_index" == -1 ]]; then
    exit 1
fi

# Calculate the next index, wrapping around
next_index=$(((current_index + 1) % ${#display_indices[@]}))
next_display_index=${display_indices[$next_index]}

# Focus the next display
yabai -m display --focus "$next_display_index"
