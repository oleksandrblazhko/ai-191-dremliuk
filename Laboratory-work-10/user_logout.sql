create or replace function user_logout(
    v_user_name varchar
)
	returns integer
as $$
declare
	v_user_id integer;
begin
	select id into v_user_id 
	from users
	where user_name = v_user_name;
	if found then 
		delete from sso_tokens where user_id = v_user_id;
		return 1;
	else 
		return -1;
	end if;
end;
$$ language plpgsql;
