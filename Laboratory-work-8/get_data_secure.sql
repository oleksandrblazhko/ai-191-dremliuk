create or replace function get_data_secure(faculty_name varchar)
returns table (
    d_id integer,
    name varchar,
    faculty varchar,
    spot_conf integer
)
as $$
begin
	return query
	select * from department d where d.faculty = faculty_name;
end;
$$ language plpgsql;