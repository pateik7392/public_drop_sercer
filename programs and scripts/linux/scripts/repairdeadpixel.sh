#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 input_image"
    exit 1
fi

input_image="$1"
output_image="fixed_$input_image"

# Define the pixel coordinates you want to fix (replace with your specific pixel coordinates)
x=100
y=100

# Replace the pixel at the specified coordinates with a nearby pixel value
convert "$input_image" -fill "$(convert "$input_image" -crop "1x1+$x+$y" +repage -format "%[pixel:u]" info:-)" -draw "point $x,$y" "$output_image"

echo "Fixed pixel at ($x, $y)"
