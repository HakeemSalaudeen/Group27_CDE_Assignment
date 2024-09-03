--  list of order IDs where either gloss_qty or poster_qty is greater than 4000
select id  
from orders  
where gloss_qty > 4000 or poster_qty > 4000;

-- list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000
select *  from orders 
where standard_qty = 0 and (gloss_qty > 1000 or poster_qty > 1000);

-- company names that start with a 'C' or 'W', 
-- and where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'
select *  from accounts
where (name like 'C%' OR name like 'W%')
		AND ((primary_poc like '%ana%' or primary_poc like '%Ana%')  
		And primary_poc not like '%eana%');


-- Table that shows the region for each sales rep along with their associated accounts.
select r.name region_name, s.name SalesRep_name, a.name AccountName
from region r  
join sales_reps s    
on r.id = s.region_id   
join accounts a    
on s.id = a.sales_rep_id
order by 3;