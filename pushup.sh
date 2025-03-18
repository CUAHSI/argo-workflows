#!/bin/bash

directory_path="workflows"

if [[ -d "$directory_path" ]]; then
    echo "Listing files in directory: $directory_path"
    for file in "$directory_path"/*; do
        if [[ -f "$file" ]]; then
            kubectl apply -n workflows -f ./$file
        fi
    done
else
    echo "Directory does not exist: $directory_path"
fi


