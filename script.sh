#!/bin/bash

# Define the path to the SQL migration script
sql_script="C:\Program Files\Red Gate\Flyway Desktop\flyway\sql\V5__two_errors_with_table.sql.sql"

# Define the path to store failed statements
failed_statements_file="migration_errors.log"

# Initialize a flag to track whether any errors occurred
errors_occurred=0

# Read each SQL statement from the script file and execute it
while IFS=';' read -r sql_statement; do
    # Remove leading and trailing whitespace from the SQL statement
    sql_statement=$(echo "$sql_statement" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

    # Skip empty lines and comments
    if [[ -z "$sql_statement" || "${sql_statement:0:2}" = "--" ]]; then
        continue
    fi

    # Execute the SQL statement with Flyway
    flyway_output=$(echo "$sql_statement" | flyway.cmd migrate -url=jdbc:postgresql://localhost:5432/flywaydb -user=postgres -password=sillicon 2>&1)

    # Check if the output contains any errors
    if grep -q "ERROR" <<< "$flyway_output"; then
        echo "Error occurred while executing the SQL statement: $sql_statement"
        echo "$sql_statement" >> "$failed_statements_file"
        errors_occurred=1
    fi
done < "$sql_script"

# Check if any errors occurred during execution
if [[ $errors_occurred -eq 0 ]]; then
    echo "All SQL statements executed successfully."
fi



