#!/bin/bash

# Define the SQL file to execute
sql_file="C:\Program Files\Red Gate\Flyway Desktop\flyway\sql\V5__two_errors_with_table.sql.sql"

# Define a temporary file to store the queries
temp_file=$(mktemp)

# Function to execute SQL queries and catch errors
try_catch() {
    local output
    output=$(echo "$(<"$temp_file")" | flyway.cmd migrate -url=jdbc:postgresql://localhost:5432/flywaydb -user=postgres -password=sillicon 2>&1)
    if echo "$output" | grep -q "ERROR"; then
        echo "Error occurred while executing queries:"
        echo "$output"
    fi
}

# Read each line from the SQL file
while IFS= read -r line; do
    # Append the line to the temporary file
    echo "$line" >> "$temp_file"

    # Check if the line ends with a semicolon
    if [[ $line == *";"* ]]; then
        # Try executing the queries and catch errors
        try_catch

        # Clear the temporary file for the next set of queries
        > "$temp_file"
    fi
done < "$sql_file"

# Remove the temporary file
rm "$temp_file"

