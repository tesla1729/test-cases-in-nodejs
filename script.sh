#!/bin/bash -x

# Set the repository URL
repo_url="https://github.com/tesla1729/test-cases-in-nodejs.git"

# Set the output file name
output_file="github_report.txt"

# Get the tag and version information using Git
tags=$(git ls-remote --tags $repo_url)
versions=$(git ls-remote $repo_url)

# Create the table header
echo "Tag/Version | Release Date | Description" > $output_file
echo "--- | --- | ---" >> $output_file

# Loop through the tags and versions and create a table row for each
while read -r tag; do
    tag_name=$(echo $tag | awk '{print $2}' | awk -F '/' '{print $3}')
    tag_date=$(git log -1 --format=%ai $tag_name)
    tag_desc=$(git log -1 --format=%s $tag_name)
    echo "$tag_name | $tag_date | $tag_desc" >> $output_file
done <<< "$tags"

while read -r version; do
    version_name=$(echo $version | awk '{print $2}')
    version_date=$(git log -1 --format=%ai $version_name)
    version_desc=$(git log -1 --format=%s $version_name)
    echo "$version_name | $version_date | $version_desc" >> $output_file
done <<< "$versions"

# Output the report
cat $output_file
