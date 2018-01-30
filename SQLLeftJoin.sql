--join customer name date amount ordered by amount in desc--
select c.id as 'Id', name as 'Customer Name', 
				convert(varchar(10),date,1) as 'Order Date',
				 isnull(amount,0.00) as 'Amount'
from customer c
left join [order] o
on [o].customerid = c.id
--where clause with boolean expression--
where o.Amount < 250 or o.Amount > 600
order by  o.Amount desc


