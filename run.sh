#!/bin/bash

# This script compiles and runs a C++ program using g++ on Mac
# It then deletes the executable file

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <cpp_file>"
    exit 1
fi

# Get the C++ file name from the command line argument
cpp_file="$1"

# Check if the file exists
if [ ! -f "$cpp_file" ]; then
    echo "Error: File '$cpp_file' not found."
    exit 1
fi

# Extract the base name of the C++ file without the extension
base_name=$(basename -s .cpp "$cpp_file")

# Compile the C++ code using g++
g++ -o "$base_name" "$cpp_file"

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful. Running the program..."
    # Run the compiled program
    "./$base_name"
    
    # Delete the executable
    rm "$base_name"
else
    echo "Compilation failed."
fi
