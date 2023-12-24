# Generate SQL Migration Script

## Description
This script generates an SQL migration file with a formatted name based on the input arguments and a timestamp. It capitalizes, removes accents, and spaces from the provided arguments to form the file name.

> The script was created to facilitate and organize the creation of SQL files that run when starting the local database in Docker Compose, for an application that does not have configured migrations.

## Configuration and Usage

### Execution Permission
Before using the script, execution permission needs to be granted. This can be done with the following command:

```bash
chmod +x generate-sql-migration.sh
```

### Script Execution
To use the script, provide the migration name as an argument. The script will generate an `.sql` file with a formatted name and timestamp in the specified directory.

```bash
./generate-sql-migration.sh [names...]
```

Example:
```bash
./generate-sql-migration.sh sample iNit Database
```

This command will generate a file named `1703395808-SampleInitDatabase.sql` (the number will be the current timestamp) in the configured directory for migrations.

### Migration Path Configuration
The default path where migration files are saved is `sql/`. You can change this path by modifying the `default_path` variable at the beginning of the script:
```bash
default_path="your/desired/path/"
```

## Changelog

### 2023-12-24
- Creation of the script and basic functionality.

## Detailed Explanation

### Script Structure
The script performs the following operations in order:
1. Capitalizes the input arguments.
2. Removes accents from the capitalized string.
3. Removes spaces and punctuation.
4. Generates a file name with the current timestamp and the formatted string.
5. Creates an SQL migration file with the generated name in the configured directory.
6. Adds a default header to the file, including the generation date, author, and a space for description.

### Generated File Header
The header included in each generated SQL migration file contains:
- File generation date.
- Author (current system user).
- Space reserved for migration description.
- Comment with space for rollback script.
