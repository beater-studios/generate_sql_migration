#!/bin/bash

# Author: Davyd Maker
# Organization: Beater Studios
# Description: This script generates a SQL migration file with a timestamp and a formatted name based on the input arguments.
# Version: 1.0.0
# License: MIT
# Usage: ./generate-sql-migration.sh [names...]
# Example: ./generate-sql-migration.sh sample iNit Database
# Output: 1703395808-SampleInitDatabase.sql
# Created: 2023-12-24
# Last modified: 2023-12-24

# Set the default path for the migration files
default_path="sql/"

# Get the current timestamp
timestamp=$(date +%s)

# Capitalize the input arguments
string_capitalized=$(echo "$@" | awk '{for (i=1; i<=NF; i++) $i=toupper(substr($i, 1, 1)) tolower(substr($i, 2));}1')

# Remove accents from the capitalized string
string_without_accents=$(echo "$string_capitalized" | iconv -f UTF-8 -t ASCII//TRANSLIT)

# Remove spaces and punctuation from the string
string_concatenated=$(echo "$string_without_accents" | tr -d '[:space:][:punct:]')

# Generate the migration name with timestamp and formatted string
migration_name="${timestamp}-${string_concatenated}.sql"

# Concatenate the default path with the migration name
migration_path="${default_path}${migration_name}"

# Create the migration file
touch "$migration_path"

# Get the current user
current_user=$USER

# Write header to the migration file
{
    echo "-- Generation Date: $(date)"
    echo "-- Author: $current_user"
    echo "-- Description: <describe the purpose of this SQL script here>"
    echo ""
    echo ""
    echo ""
    echo "-- Fill in the rollback script in the comment for registration and eventual need"
    echo "/*"
    echo ""
    echo "*/"
} > "$migration_path"

# Print the migration name with success message
echo "Migration "$string_concatenated" created successfully!"
