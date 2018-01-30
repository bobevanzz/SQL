select c.name as 'Customer Name', sum(o.amount) as 'Total Amount'
from customer c
 join [order] o
on [o].customerid = c.id
group by c.name
having sum(amount) >1000


