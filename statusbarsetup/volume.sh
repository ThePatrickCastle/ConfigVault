#!/bin/sh

# Get the sound percentage
SOUND_PERCENTAGE=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))

# Check if the sound percentage was retrieved successfully
if [ -z "$SOUND_PERCENTAGE" ]; then
    echo "No audio device found"
    exit 1
fi

# Output the sound percentage
echo "⊵$SOUND_PERCENTAGE"
