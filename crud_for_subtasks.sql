-- Get 1
create or replace function get_subtask_record(
    in s_id uuid
) returns subtasks
language sql
as $$
select * from subtasks where id = s_id;
$$;
-- Get all
create or replace function get_all_subtask_records( )
returns setof subtasks
language sql
as $$
select * from subtasks;
$$;
-- Add 1
create or replace procedure add_subtask_record(
    in s_id uuid,
    in s_subject varchar(255),
    in s_task uuid
)
language sql
as $$
insert into subtasks (id, subject, task)
values (s_id, s_subject, s_task);
$$;
-- Delete 1 
create or replace procedure delete_subtask_record(in s_id uuid)
language sql
as $$
delete from subtasks where id = s_id;
$$;
-- Update 1
create or replace procedure update_subtask_record (
    in s_id UUID, 
    in s_subject VARCHAR(255),
    in s_task UUID
)
language sql
as $$
update subtasks
set subject = s_subject,
    task = s_task
where id = s_id;
$$;