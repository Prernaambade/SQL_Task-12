select * from sales

create table Report_table(
	product_id varchar primary key,
	sum_of_sales float,
	sum_of_profit float
)
create or replace function update_product_report()
returns trigger as $$
declare
       sumOfSales float;
       sumOfProfit float;
       count_report int;
BEGIN
     select sum(sales),sum(profit)into sumOfSales,sumOfProfit from sales
     where product_id = New.product_id;
    
     select count (*) into count_report from Report_table where product_id=New.product_id;
     if count_report =0 THEN
     insert into Report_Table values (New.product_id,sumOfSales , sumOfProfit);
     else
         update Report_table set sum_of_sales=sumOfSales , sum_of_profit=sumOfProfit
          where product_id = New.product_id;
     end if;
     Return new;
end
$$ language plpgsql;

create trigger update_product_report
after insert on sales
for each row 
execute function update_product_report();

select * from sales
select sum(sales),sum(profit)from sales where product_id='OFF-PA-10002365'

insert into sales (order_line,order_id,order_date,ship_date,ship_mode,customer_id,product_id,sales,quantity,discount,profit)
values(9998,'CA-2016-152156','2024-08-17','2024-09-17','Second class','CG-12520','OFF-PA-10002365',150,2,2,20)

insert into sales (order_line,order_id,order_date,ship_date,ship_mode,customer_id,product_id,sales,quantity,discount,profit)
values(9999,'CA-2016-152157','2024-08-17','2024-09-17','Second class','CG-12520','OFF-PA-10002366',250,2,2,20)

select * from sales order by order_line desc

select * from Report_table
