create table sdi_user(
	u_id uuid,
	u_username varchar(32),
	u_password varchar(64),
	u_email varchar(255),
	constraint pk_user primary key (u_id),
	constraint username_not_null check(u_username is not null),
	constraint password_not_null check(u_password is not null),
	constraint unique_username unique(u_username)
);
create table sdi_task(
	t_id uuid, 
	t_name varchar(255),
	t_description text,
	t_priority smallint,
	t_due_date timestamp,
	t_user uuid,
	constraint pk_tasks primary key(t_id),
	constraint task_name_not_null check(t_name is not null),
	constraint task_priority_between_1_and_10 check(1<= t_priority and t_priority <= 10),
	constraint task_user_not_null check(t_user is not null),
	constraint fk_users_tasks foreign key(t_user) references sdi_user(u_id) on delete cascade
);
create index index_on_user_id_for_task on sdi_task(t_user);
create table sdi_subtask(
	s_id uuid, 
	s_subject varchar(255),
	s_task uuid,
	constraint pk_subtasks primary key(s_id),
	constraint fk_tasks_subtasks foreign key(s_task) references sdi_task(t_id) on delete cascade,
	constraint subtask_subject_not_null check(s_subject is not null)
);
create index index_on_task_id_for_subtask on sdi_subtask(s_task);
select * 
	from sdi_user 
		inner join sdi_task on u_id = t_user 
		inner join sdi_subtask on t_id = s_task;
	
drop table sdi_subtask cascade;
drop table sdi_task cascade;
drop table sdi_user cascade;