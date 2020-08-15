#!/bin/sh

# If a command fails then the deploy stops
set -e

# Build the project.
hugo

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -s -m "$msg"

# Push source and build repos.
git push origin master

cd ../

git add .

git commit -s -m "$msg"

git push origin master

