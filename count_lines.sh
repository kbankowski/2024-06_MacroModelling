#!/bin/bash

# Directory containing the files
DIR="models"

# Check if the directory exists
if [ -d "$DIR" ]; then
    # Loop through each file in the directory
    for file in "$DIR"/*; do
        if [ -f "$file" ]; then
            # Count the number of lines in the file
            num_lines=$(wc -l < "$file")
            # Print the result
            echo "File: $file - Lines: $num_lines"
        fi
    done
else
    echo "Directory $DIR does not exist."
fi
