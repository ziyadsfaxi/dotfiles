#!/bin/bash

# This script was created because yabai kept changing focus to the next monitor when cycling through spaces.

# Get current display index
current_display_index=$(yabai -m query --displays --display | jq '.index')

# Get currently focused space index
current_space=$(yabai -m query --spaces --space | jq '.index')

# Get all spaces on the current display (including visible)
spaces_on_display=($(yabai -m query --spaces | jq -r --argjson idx "$current_display_index" '
  map(select(.display == $idx)) | sort_by(.index) | .[].index
'))

# Find index of current space in the array
current_index=-1
for i in "${!spaces_on_display[@]}"; do
	if [[ "${spaces_on_display[$i]}" -eq "$current_space" ]]; then
		current_index=$i
		break
	fi
done

# If not found (shouldn't happen), exit
if [[ "$current_index" -eq "-1" ]]; then
	exit 1
fi

# Compute next index, wrap if at end
next_index=$(((current_index + 1) % ${#spaces_on_display[@]}))

# Focus the next space
yabai -m space --focus "${spaces_on_display[$next_index]}"
