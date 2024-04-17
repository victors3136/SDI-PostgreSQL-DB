-- Get 1
create or replace function get_task_record(
    in t_id UUID
) returns tasks
language sql
as $$
select * from tasks t where t.id = t_id;
$$;
-- Get all
create or replace function get_all_task_records( )
returns setof tasks
language sql
as $$
select * from tasks;
$$;
-- Add 1
create or replace procedure add_task_record(
    in t_id uuid,
    in t_name varchar(255),
    in t_description text,
    in t_priority smallint,
    in t_dueDate timestamp
)
language sql
as $$
insert into tasks (id, name, description, priority, dueDate)
values (t_id, t_name, t_description, t_priority, t_dueDate);
$$;
-- Delete 1
create or replace procedure delete_task_record(in t_id uuid)
language sql
as $$
	delete from tasks t where t.id=t_id
$$;
-- Update 1
create or replace procedure update_tasks_record (
	in t_id uuid, 
	in t_name varchar(255),
	in t_description text, 
	in t_priority smallint,
	in t_dueDate timestamp)
language sql
as $$
UPDATE tasks
SET name = t_name,
    description = t_description,
    priority = t_priority,
    dueDate = t_dueDate
WHERE id = t_id;
$$