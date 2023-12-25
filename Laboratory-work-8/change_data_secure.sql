create or replace function change_data_secure(p_name varchar, p_faculty varchar)
returns varchar
as $$
declare
begin
	update department set name = p_name
	where faculty = p_faculty;
	return 'Ok - ' || now();
end;
$$ language plpgsql;