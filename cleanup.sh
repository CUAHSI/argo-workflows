#!/bin/bash

# Directory containing the YAML files
directory="workflows"

# Loop through all YAML files in the directory
for file in "$directory"/*.yml; do
  # Use sed to remove the specified lines and save back to the original file
  sed -i '' '/resourceVersion:/d; /uid:/d; /creationTimestamp:/d; /generation:/d' "$file"
  echo "Processed $file"
done

echo "All files processed."
