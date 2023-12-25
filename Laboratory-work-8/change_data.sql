create or replace function change_data(name varchar, faculty varchar)
returns varchar
as $$
declare
	str varchar;
begin
	str := 'update department set name = ''' || name || '''
	where faculty = ''' || faculty || '''';
    raise notice 'Query=%', str;
	execute str;
	return 'Ok - ' || now();
end;
$$ language plpgsql;