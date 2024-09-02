#!/bin/bash

# File to be copied from the API Server repository

FILES=("pkg/apis/cel/config.go" "pkg/cel/errors.go" "pkg/cel/limits.go" 
	"pkg/cel/quantity.go" "pkg/cel/types.go" "pkg/cel/url.go" 
	"pkg/cel/value.go" "pkg/cel/OWNERS" "pkg/cel/library/lists.go" 
	"pkg/cel/library/regex.go" "pkg/cel/library/test.go" "pkg/cel/library/urls.go")


# Check if the base directory exists
if [ ! -d "$REPOSITORY_DIR" ]; then
    echo "Error: Base directory $base_directory does not exist."
    exit 1
fi

# Check if the destination directory exists
if [ ! -d "$DESTINATION_DIR" ]; then
    echo "Error: Destination directory $destination_directory does not exist."
    exit 1
fi


# Loop through each file in the list
for file in "${FILES[@]}"; do
    # Find the file in the base directory
    file_path="$REPOSITORY_DIR/$file"
    
    if [ -n "$file_path" ]; then
        # Use the install command to copy the file and create the necessary directories
        install -m "644" -D "$file_path" "$DESTINATION_DIR/$file"
        echo "Copied $file_path to $DESTINATION_DIR/$file"
    else
        echo "File '$file_path' not found in $REPOSITORY_DIR."
	exit 1
    fi
done

echo "Done!"
