--join customer name date amount ordered by amount in desc--
select c.name as 'Customer Name', sum(o.amount) as 'Total Amount'
from customer c -- alias for customer as c
 join [order] o
on [o].customerid = c.id
--where o.Amount < 250 or o.Amount > 600
group by c.name
order by sum(o.amount) desc


