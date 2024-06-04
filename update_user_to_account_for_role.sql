alter table sdi_user
	add column u_role uuid,
	add constraint fk_user_role foreign key (u_role) references sdi_role(r_id) on update cascade on delete no action;

select 	u_id as "id",
		u_username as "username",
		r_name as "role"
from sdi_user 
	inner join sdi_role on u_role = r_id 
	inner join sdi_role_permission on r_id = rp_role
	inner join sdi_permission on rp_permission = p_id
group by "id", "username", "role";