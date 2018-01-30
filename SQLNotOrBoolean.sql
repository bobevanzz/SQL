select * from customer
where State != 'KY' and State != 'IN'

select * from customer 
where state not in ('KY','IN')