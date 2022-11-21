create or replace function lastname_log_func()
returns trigger as
$$
   begin
      raise notice 'Reader id=% got new lastname="%" at %', new.id , new.lastname, current_timestamp;
     return new;
   end;
$$ language plpgsql;

drop trigger if exists reader_new_lastname on public.reader;
create trigger reader_new_lastname
	after update of lastname on public.reader
	for each row
	execute procedure lastname_log_func();

update public.reader
set lastname = 'Баринов'
where id = 1