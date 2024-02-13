## Output for script.sh
### Approach:
-  In this script I am traversing the SQL script and trying to migrate the changes in the database one by one query.
### Error:
Correct queries are also giving error.

---
![image](https://github.com/Harshit-kumar24/flyway_assignment/assets/108082088/bd795b19-286d-4def-a646-9414e2abbe6f)

## Output for flyway_script.sh
### Approach:
- Just storing the error as soon as it encounters an error.
### Error:
- Not able to run the queries that are below a query which will throw an error
  
![image](https://github.com/Harshit-kumar24/flyway_assignment/assets/108082088/05bfb22b-2e3d-4f7e-925f-0bd53f54d925)

### Output for answer.sh
### Approach:
- In this logic I am taking a query and trying to migrate the changes which will be done in a function and if it fails the errors will be logged and will repeat the same process for the next query
- Not giving errors for the correct query
### Error:
- Not able to log the error message for the next failed query.

![image](https://github.com/Harshit-kumar24/flyway_assignment/assets/108082088/631c5ee6-89a6-439d-9d2f-10e475e72b83)
