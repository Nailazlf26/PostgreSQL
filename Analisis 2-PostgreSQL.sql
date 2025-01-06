SELECT * FROM orders_new_edited

--*pilih kolom
SELECT
	order_id,
    customer_id,
    sales
FROM
	orders_new_edited
    
--* distinct (unik)
-- memanggil row dengan nilai yang berbeda 
SELECT DISTINCT subcategory, category FROM orders_new_edited

-- filter baris
SELECT * FROM orders_new_edited 
where city in ('iowa city','waterloo','Dubuque')

-- Tampilkan nama-nama konsumen segment Consumer yang pernah membeli meja
SELECT 
	customer_name,
    segment,
    subcategory
FROM 
	orders_new_edited 
WHERE 
	segment = 'Consumer' 
AND 
	subcategory = 'Tables' 

-- ubah ordeorder_date ke date dari varchar
ALTER TABLE orders_new_edited
ALTER COLUMN order_date TYPE date USING order_date :: date

-- Tampilkan nama-nama konsumen dari segment Corporate dan Home Office yang berasal dari kota Los Angeles dan 
-- bertransaksi selama tahun 2018.
SELECT 
	customer_name,
    segment,
    city, 
    order_date
FROM 
	orders_new_edited 
WHERE 
	segment = 'Corporate' 
AND 
	city = 'Los Angeles' 
AND 
	EXTRACT (year from order_date) = 2018

-- Tampilkan nama-nama konsumen dari segment Corporate dan Home Office yang berasal dari kota Los Angeles dan 
-- bertransaksi selama Q1 tahun 2018.
SELECT 
	customer_name,
    segment,
    city, 
    order_date
FROM 
	orders_new_edited 
WHERE 
	segment = 'Corporate' 
AND 
	city = 'Los Angeles' 
AND 
	EXTRACT (year from order_date) = 2018
AND 
	EXTRACT (MONTH FROM order_date) <=3

-- Query transaksi yang merugikan saja yang terjadi di tahun 2018 hingga 2019
-- di kota Los Angeles. diurutkan dari kerugian terbesar
SELECT 
    customer_id,
    customer_name,
    order_date,
    profit,
    city
FROM 
	orders_new_edited 
WHERE 
	profit < 0 
AND 
	city = 'Los Angeles' 
AND 
	(order_date BETWEEN '2018-01-01' AND '2019-12-31')
ORDER BY
	profit ASC
    
-- Query transaksi yang untung saja yang terjadi pada Q1 2018 di kota
-- Henderson. diurutkan dari keuntungan terbesar
SELECT 
    customer_id,
    customer_name,
    order_date,
    profit,
    city
FROM 
	orders_new_edited 
WHERE 
	profit >= 0 
AND 
	city = 'Henderson' 
AND 
	EXTRACT (year from order_date) = 2018
AND 
	EXTRACT (MONTH FROM order_date) <=3
ORDER BY
	profit ASC