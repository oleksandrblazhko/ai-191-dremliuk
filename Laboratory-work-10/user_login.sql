create or replace function user_login(
     v_user_name varchar, 
	 v_password varchar
)
	returns varchar
as $$
declare
	v_token varchar;
	v_user_id integer;
begin
	select id into v_user_id 
	from users
	where 	user_name = v_user_name
			and password_hash = md5(v_password);
	if not found then 
		return '';
	else 
		select md5(inet_client_addr()::varchar || inet_client_port() || 
			pg_backend_pid()) into v_token;
		insert into sso_tokens (user_id,token) values (v_user_id,v_token);
		-- raise notice 'token';
		return v_token;
	end if;
end;
$$ language plpgsql;
