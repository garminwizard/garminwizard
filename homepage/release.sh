#!/bin/bash

npm run build

# Change directory to ../garminwizard.github.io
cd ../garminwizard.github.io || exit

# Remove all files and directories
rm -rf *

# Copy contents from ../garminwizard-homepage/build/ to current directory
cp -r ../garminwizard-homepage/build/* .

# Restore LICENSE and README.md if they are modified
git restore LICENSE
git restore README.md

# Add all changes
git add *

# Commit changes with message "Update"
git commit -am "Update"

# Push changes to remote repository
git push
