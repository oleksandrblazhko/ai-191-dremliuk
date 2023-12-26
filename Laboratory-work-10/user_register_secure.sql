create or replace function user_register_secure(p_user_name varchar, p_password varchar)
returns integer
as $$
begin

	if (select p_password ~ '^(?=.*\d{2,})(?=.*[a-z]{2,})(?=.*[A-Z]{4,})(?=.*[!@#$%^&*]{4,}).{12,}$') then
		insert into users (user_name, password_hash) values (p_user_name, md5(p_password));
		return 1;
	else
		raise notice 'Incorrect password';
		return -1;
	end if;
end;
$$ language plpgsql;