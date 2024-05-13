-- Get 1
create or replace function get_user_record(
    in u_id uuid
) returns "user"
language sql
as $$
select * from "user" where id = u_id;
$$;
-- Get all
create or replace function get_all_user_records( )
returns setof "user"
language sql
as $$
select * from "user";
$$;
-- Add 1
create or replace procedure add_user_record(
    in u_id uuid,
    in u_username varchar(32),
    in u_password varchar(64),
	in u_email varchar(255)
)
language sql
as $$
insert into "user" (id, username, password, email)
values (u_id, u_username, u_password, u_email);
$$;
-- Delete 1 
create or replace procedure delete_user_record(in u_id uuid)
language sql
as $$
delete from "user" where id = u_id;
$$;
-- Update 1
create or replace procedure update_user_record (
    in u_id uuid, 
	in u_username varchar(32),
	in u_password varchar(64),
    in u_email varchar(255)
)
language sql
as $$
update "user"
set username = u_username,
    "password" = u_password,
	email = u_email
where id = u_id;
$$;