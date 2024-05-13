create table "user"(
	"id" uuid,
	"username" varchar(32),
	"password" varchar(64),
	"email" varchar(255),
	constraint pk_user primary key ("id"),
	constraint username_not_null check("username" is not null),
	constraint password_not_null check("password" is not null),
	constraint unique_username unique("username")
);
create table "task"(
	"id" uuid, 
	"name" varchar(255),
	"description" text,
	"priority" smallint,
	"due_date" timestamp,
	"user" uuid,
	constraint pk_tasks primary key("id"),
	constraint task_name_not_null check("name" is not null),
	constraint task_priority_between_1_and_10 check(1<= "priority" and "priority" <= 10),
	constraint task_user_not_null check("user" is not null),
	constraint fk_users_tasks foreign key ("user") references "user"("id") on delete cascade
);
create index index_on_user_id_for_task on task("user");
create table subtask(
	"id" UUID, 
	"subject" varchar(255),
	"task" UUID,
	constraint pk_subtasks primary key("id"),
	constraint fk_tasks_subtasks foreign key("task") references "task"("id") on delete cascade,
	constraint subtask_subject_not_null check("subject" is not null)
);
create index index_on_task_id_for_subtask on "subtask"("task");

select * 
	from "user" "u" 
		inner join "task" "t" on "u"."id" = "t"."user" 
		inner join "subtask" "s" on "t"."id" = "s"."id";
	
drop table "subtask";
drop table "task";
drop table "user";