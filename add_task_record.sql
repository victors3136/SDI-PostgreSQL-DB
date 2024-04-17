
call add_task_record(
    cast('123e4567-e89b-12d3-a456-426614174000' AS UUID), 
    cast('Task Name Example' AS VARCHAR(255)), 
    cast('Task Description Example' AS TEXT), 
    cast(1 as smallint),
    cast('2024-04-15 12:00:00' AS TIMESTAMP)
);


call add_task_record(
    cast('123e4567-e89b-12d3-a456-426614174022' AS UUID), 
    cast('Mpp hw' AS VARCHAR(255)), 
    cast('yuh' AS TEXT), 
    cast(2 as smallint),
    cast('2024-06-15 12:00:00' AS TIMESTAMP)
);