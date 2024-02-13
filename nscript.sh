#!/bin/bash

sql_script="C:\Program Files\Red Gate\Flyway Desktop\flyway\sql\V5__two_errors_with_table.sql.sql"


# Define the path to the SQL migration script
sql_script="path/to/your/script.sql"

# Define the path to store the error log
error_log="error_log.txt"

# Execute the SQL script and capture errors
flyway_output=$(flyway.cmd migrate -url=jdbc:postgresql://localhost:5432/flywaydb -user=postgres -password=sillicon -locations=C:\Program Files\Red Gate\Flyway Desktop\flyway\sql = -dryRunOutput=dryrun.sql 2>&1)

# Check if there were any errors during execution
if grep -q "ERROR" <<< "$flyway_output"; then
    # Extract and store the errors in the error log
    echo "Errors encountered during SQL script execution:" >> "$error_log"
    echo "$flyway_output" | grep "ERROR" >> "$error_log"
    echo "See $error_log for details."
else
    echo "SQL script executed successfully."
fi

