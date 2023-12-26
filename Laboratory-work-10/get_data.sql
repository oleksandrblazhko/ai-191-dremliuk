create or replace function get_data(p_user_name varchar, p_token varchar, faculty_name varchar)
returns table (
    d_id integer,
    name varchar,
    faculty varchar,
    spot_conf integer
)
as $$
begin
	if not exists ( select from users u, sso_tokens t
					where lower(u.user_name) = p_user_name 
						and u.id = t.user_id
						and t.token = p_token
				) then
		raise exception 'auth error';
	end if;

	return query
	select * from department d where d.faculty = faculty_name;
end;
$$ language plpgsql;