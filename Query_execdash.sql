Select ord.order_id,
		CONCAT(cus.first_name,' ',cus.last_name) as 'Customer_name',
		cus.city,
		cus.state,
		ord.order_date, 
		SUM(ite.quantity) as 'total_units',
		SUM(ite.quantity*ite.list_price) as 'Revenue',
		pro.product_name,
		cat.category_name,
		sto.store_name,
		CONCAT(sta.first_name, ' ', sta.last_name) as 'Sales_Rep'
from sales.orders ord
Join sales.customers cus
ON ord.customer_id = cus.customer_id
Join sales.order_items ite
ON ord.order_id = ite.order_id
Join production.products pro
On ite.product_id = pro.product_id
Join production.categories cat
ON pro.category_id = cat.category_id
Join sales.stores sto
ON ord.store_id = sto.store_id
Join sales.staffs sta
ON ord.staff_id = sta.staff_id
group by 
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name);