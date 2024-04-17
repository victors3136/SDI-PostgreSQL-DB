create table tasks(
	id UUID, 
	name varchar(255),
	description text,
	priority smallint,
	dueDate timestamp,
	constraint pk_tasks primary key(id),
	constraint task_name_not_null check(name is not null),
	constraint task_priority_between_1_and_10 check(1<= priority and priority <= 10)
);
create table subtasks(
	id UUID, 
	subject varchar(255),
	task UUID,
	constraint pk_subtasks primary key(id),
	constraint fk_tasks_subtasks foreign key(task) references tasks(id),
	constraint subtask_subject_not_null check(subject is not null)
);
select * from tasks;
select * from subtasks;