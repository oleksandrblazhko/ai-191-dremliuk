create or replace function get_data(faculty_name varchar)
returns table (
    d_id integer,
    name varchar,
    faculty varchar,
    spot_conf integer
)
as $$
declare
	str varchar;
begin
	str := 'select * from department where faculty = ''' || faculty_name || '''';
    raise notice 'Query=%', str;
	return query execute str;
end;
$$ language plpgsql;