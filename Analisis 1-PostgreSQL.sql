SELECT * from region
--nomor 1
-- Kota yang memiliki revenue tertinggi
SELECT 
	r.city,
    sum(o.sales) total_revenue
FROM 
	orders1 o
	LEFT JOIN region r on o.postal_code = r.postal_code
GROUP by 1
ORDER BY 2 DESC
LIMIT 1

--nomor 2
-- Dari soal sebelumnya, rata-rata spending per konsumen pada kota tersebut
WITH
	complete_transaction AS (
SELECT
      o.sales,
      c.customer_name,
      r.city
FROM
      orders1 o
left join customer c on o.customer_id = c.customer_id
LEFT join region r on o.postal_code = r.postal_code
)

SELECT * from complete_transaction
order by city desc

SELECT
	city,
    AVG(sales) AS average_spending
FROM
	complete_transaction
group by 
	1
 HAVING
 	city = 'New York City'
    
   
--nomor 3
-- nama-nama konsumen yang memiliki spending di atas rata-rata
WITH 
	complete_transaction AS (
SELECT
	r.city,
	cu.customer_name,
sum 
      (o.sales) total_revenue
FROM 
      orders1 o
JOIN 
      region r ON o.postal_code = r.postal_code
join 
      customer cu on o.customer_id = cu.customer_id
GROUP by 
      1,2
having sum
      (o.sales) > 200.18
)

SELECT
	customer_name,
	total_revenue
FROM 
	complete_transaction
WHERE 
	city = 'New York City'
ORDER by 
	total_revenue DESC

