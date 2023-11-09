#!/bin/bash

# Set the duration of the timer in seconds
duration=60

echo "Timer starts with a duration of $duration seconds."

# Calculate the current time
minutes=$((duration / 60))
seconds=$((duration % 60))

echo "Timer: $minutes minutes $seconds seconds"

while [ $duration -gt 0 ]; do
    duration=$((duration - 1))
    minutes=$((duration / 60))
    seconds=$((duration % 60))
    echo "Timer: $minutes minutes $seconds seconds"
    sleep 1
done

echo "Timer has ended!"
