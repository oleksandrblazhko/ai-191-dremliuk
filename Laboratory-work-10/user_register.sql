create or replace function user_register(p_user_name varchar, p_password varchar)
returns integer
as $$
begin

	if not exists (select 1 from xato_net_10_million_passwords_1000 where password = p_password) then
		insert into users (user_name, password_hash) values (p_user_name, md5(p_password));
		return 1;
	else
		raise notice 'Incorrect password';
		return -1;
	end if;
end;
$$ language plpgsql;