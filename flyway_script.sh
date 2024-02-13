# Apply migrations
migration_output=$(flyway.cmd migrate -url=jdbc:postgresql://localhost:5432/flywaydb -user=postgres -password=sillicon 2>&1)

# Check if any errors occurred during the migration
if echo "$migration_output" | grep -q "ERROR"; then
    echo "Errors encountered during migration. Storing migration error logs..."

    # Store migration output in a separate file
    echo "$migration_output" > migration_errors.log
	
    #storing the SQL statements
   failed_statement=$(echo "$migration_output" | awk '/^Statement/ { getline; print }')

# Store failed SQL statement in a separate file
echo "$failed_statement" > failed_statements.sql 

    echo "Failed SQL statements stored in failed_statements.sql"
else
    echo "Migration completed successfully."
fi








