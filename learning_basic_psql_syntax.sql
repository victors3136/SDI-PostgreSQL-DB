create table try(tid int, constraint pk_try primary key (tid)); 
insert into try values (1), (2), (3); 
select * from try; 
drop table try; 