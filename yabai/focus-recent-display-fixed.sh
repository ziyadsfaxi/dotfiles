#!/bin/bash
yabai -m display --focus recent
osascript -e 'tell application "System Events" to set frontmost of first process whose frontmost is true to true' >/dev/null 2>&1
