-- list customer where creditlimit between 200000 and 500000 inclusive
select name, creditlimit from customer
where creditlimit >= 200000 and creditlimit<= 500000
-- list customers where IsCorpAcct is 1 and sort by City
select name , IsCorpAcct, City
from customer 
where IsCorpAcct =1
order by city