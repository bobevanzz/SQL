-- list customer where creditlimit between 200000 and 500000 inclusive
select name, creditlimit from customer
where creditlimit >= 200000 and creditlimit<= 500000
-- list customers where IsCorpAcct is 1 and sort by City
select name , IsCorpAcct, City
from customer 
where IsCorpAcct =1
order by city
--list orders where customers are from ohio
select * from 
[customer] c
join [order] o
on c.id = o.CustomerId
where [state] = 'OH'
--all totals of orders summarized by state
select state, sum(amount) 
from customer c
join [order] o
on o.CustomerId = c.Id
group by c.State
having c.state in ('KY', 'IN')