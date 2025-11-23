#!/usr/bin/env bash

# Script to check if the focused window is the last window in its column,
# and if true, move focus to the window/column to the left then right, to refocus both columns.

set -e  # Exit immediately if a command exits with a non-zero status

# Maximize/minimize the focused window
 
# Get the focused window information
focused_window=$(niri msg --json focused-window)
[[ $? -ne 0 ]] && exit 0

# Extract the column position of the focused window
# The format is [column, position_in_column] - we only need the column
focused_column=$(echo "$focused_window" | jq -r '.layout.pos_in_scrolling_layout[0]')
[[ -z "$focused_column" ]] || [[ "$focused_column" == "null" ]] && exit 0

# Get all windows information
all_windows=$(niri msg --json windows)
[[ $? -ne 0 ]] && exit 0

# Find the maximum column number to determine if we're in the last column
max_column=$(
    echo "$all_windows" | 
    jq -r '.[].layout.pos_in_scrolling_layout[0]' |
    sort -n |
    tail -1
)
[[ -z "$max_column" ]] || [[ "$max_column" == "null" ]] && exit 0

# Check if the focused window is in the last column and move focus if needed
[[ "$focused_column" -eq "$max_column" ]] &&
    niri msg action focus-column-left &&
    niri msg action focus-column-right