select * from sdi_task;
select * from sdi_subtask;
select count(*) from sdi_task;
select count(*) from sdi_subtask;
select * from sdi_task limit 1;
select t_name Name, s_subject Subtask, s_id SubtaskID
from sdi_task inner join sdi_subtask
	on t_id = s_task
where t_id ='ab0ba0c0-9f5a-472f-a113-c533e601ad21'