select * from inserted
union 
select * from deleted

select convert(char(5),'hi') 
union
select convert(char(11),'hello there')

select convert(char(5),'hi') as Greeting
union
select convert(char(11),'hello there') as GreetingNow
union 
select convert(char(11),'bonjour')
union 
select convert(char(11),'hi')


select convert(char(5),'hi') as Greeting
union all
select convert(char(11),'hello there') as GreetingNow
union all
select convert(char(11),'bonjour')
union all
select convert(char(11),'hi')


select convert(tinyint, 45) as Mycolumn
union
select convert(bigint, 456)

select 4
union
select 'hi there'
