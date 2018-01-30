select c.id as 'Id', name as 'Customer Name', date as 'Date', amount as 'Amount'
from [order] o
join customer c
on [o].customerid = c.id
order by c.name, o.Amount desc
