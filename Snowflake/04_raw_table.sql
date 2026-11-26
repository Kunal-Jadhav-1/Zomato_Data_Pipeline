USE ROLE ACCOUNTADMIN;
USE DATABASE ZOMATO;
USE SCHEMA RAW;

-- RAW.USERS
CREATE OR REPLACE TABLE RAW.USERS(
	_idx STRING,
	user_id STRING,
	name STRING,
	email STRING,
	password STRING,
	age STRING,
	gender STRING,
	marital_status STRING,
	occupation STRING,
	monthly_income STRING,
	education STRING,
	family_size STRING
);

-- RAW.REVIEWS
CREATE OR REPLACE TABLE RAW.REVIEWS(
	review_id STRING,
	order_id STRING,
	user_id STRING,
	restaurant_id STRING,
	rating STRING,
	comment STRING,
	review_date STRING
);

-- RAW.RESTAURANT
CREATE OR REPLACE TABLE RAW.RESTAURANT(
	_idx STRING,
	id STRING,
	name STRING,
	city STRING,
	rating STRING,
	rating_count STRING,
	cost STRING,
	cuisine STRING,
	lic_no STRING,
	link STRING,
	address STRING,
	menu STRING
);

-- RAW.ORDERS
CREATE OR REPLACE TABLE RAW.ORDERS(
	order_id STRING,
	order_timestamp STRING,
	order_date STRING,
	user_id STRING,
	r_id STRING,
	restaurant_city STRING,
	cuisine STRING,
	items_count STRING,
	sales_qty STRING,
	subtotal STRING,
	discount STRING,
	delivery_fee STRING,
	gst STRING,
	sales_amount STRING,
	currency STRING,
	payment_method STRING,
	order_status STRING,
	customer_rating STRING,
	delivery_time_min STRING
);

-- RAW.ORDER_ITEMS
CREATE OR REPLACE TABLE RAW.ORDER_ITEMS(
	order_item_id STRING,
	order_id STRING,
	r_id STRING,
	f_id STRING,
	price STRING,
	quantity STRING,
	line_amount STRING
);

-- RAW.MENU
CREATE OR REPLACE TABLE RAW.MENU(
	_idx STRING,
	menu_id STRING,
	r_id STRING,
	f_id STRING,
	cuisine STRING,
	price STRING
);

-- RAW.FOOD
CREATE OR REPLACE TABLE RAW.FOOD(
	_idx STRING,
	f_id STRING,
	item STRING,
	veg_or_non_veg STRING
);