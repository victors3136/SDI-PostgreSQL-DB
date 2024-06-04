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


select p_name
from sdi_permission
         inner join sdi_role_permission on p_id = rp_permission
         inner join sdi_role on rp_role = r_id
         inner join sdi_user on u_role = r_id
where u_id = 'd1daab41-2584-4412-8d80-382ca49e0346'