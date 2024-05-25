--------------------------------------------------------------------------------------------
create table sdi_permission(
	p_id uuid,
	p_name varchar(32),
	constraint pk_permission primary key (p_id),
	constraint permission_name_is_unique unique(p_name)
);
--------------------------------------------------------------------------------------------
create table sdi_role(
	r_id uuid, 
	r_name varchar(255),
	constraint pk_role primary key(r_id),
	constraint role_name_is_unique unique(r_name)
);
-------------------------------------------------------------------------------------------
create table sdi_role_permission (
	rp_permission uuid,
	rp_role uuid,
	constraint pk_role_permission primary key (rp_permission, rp_role),
	constraint fk_role_rp foreign key(rp_role) references sdi_role(r_id) 
							on update cascade 
							on delete no action,
	constraint fk_permission_rp foreign key(rp_permission) references sdi_permission(p_id) 
							on update cascade 
							on delete no action
);
--------------------------------------------------------------------------------------------
create view role_permission 
as select r_name as role_name,
		p_name as permission_name
from sdi_role inner join sdi_role_permission on r_id = rp_role
	inner join sdi_permission on p_id = rp_permission;
	
--------------------------------------------------------------------------------------------
select * from role_permission;
--------------------------------------------------------------------------------------------
select role_name,
	string_agg(permission_name, ' ') as permissions
from role_permission
group by role_name
order by count(permission_name) desc;
--------------------------------------------------------------------------------------------
