
CREATE TABLE dim_products (
                product_id VARCHAR(10) NOT NULL,
                product_year VARCHAR(4) NOT NULL,
                description VARCHAR(255) NOT NULL,
                price NUMERIC(10,2) NOT NULL,
                cost NUMERIC(10,2),
                product_group VARCHAR(255),
                CONSTRAINT dim_products_pk PRIMARY KEY (product_id, product_year)
)

CREATE TABLE dim_geography (
                postal_code VARCHAR(10) NOT NULL,
                city_name VARCHAR(100) NOT NULL,
                city_id VARCHAR(10) NOT NULL,
                description VARCHAR(100),
                country_id VARCHAR(10) NOT NULL,
                country_name VARCHAR(100) NOT NULL,
                CONSTRAINT dim_geography_pk PRIMARY KEY (postal_code)
)

CREATE TABLE dim_customer (
                customer_id VARCHAR(10) NOT NULL,
                postal_code VARCHAR(10) NOT NULL,
                name VARCHAR(255) NOT NULL,
                customer_type VARCHAR(50) NOT NULL,
                address VARCHAR(500),
                CONSTRAINT dim_customer_pk PRIMARY KEY (customer_id)
)

CREATE TABLE dim_date (
                date DATETIME NOT NULL,
                month VARCHAR(2) NOT NULL,
                year VARCHAR(4) NOT NULL,
                quarter VARCHAR NOT NULL,
                day_of_month VARCHAR(2) NOT NULL,
                CONSTRAINT dim_date_pk PRIMARY KEY (date)
)

CREATE TABLE fact_order_item (
                customer_id VARCHAR(10) NOT NULL,
                date DATETIME NOT NULL,
                product_id VARCHAR(10) NOT NULL,
                product_year VARCHAR(4) NOT NULL,
                postal_code VARCHAR(10) NOT NULL,
                order_code VARCHAR(10) NOT NULL,
                order_address VARCHAR(500),
                quantity INT NOT NULL,
                price NUMERIC(10,2) NOT NULL,
                total NUMERIC(10,2) NOT NULL,
                CONSTRAINT fact_order_item_pk PRIMARY KEY (customer_id, date, product_id, product_year, postal_code, order_code)
)

ALTER TABLE fact_order_item ADD CONSTRAINT dim_product_fact_order_item_fk
FOREIGN KEY (product_id, product_year)
REFERENCES dim_products (product_id, product_year)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE fact_order_item ADD CONSTRAINT dim_geography_fact_order_item_fk
FOREIGN KEY (postal_code)
REFERENCES dim_geography (postal_code)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE dim_customer ADD CONSTRAINT dim_geography_dim_customer_fk
FOREIGN KEY (postal_code)
REFERENCES dim_geography (postal_code)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE fact_order_item ADD CONSTRAINT dim_customer_fact_order_item_fk
FOREIGN KEY (customer_id)
REFERENCES dim_customer (customer_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE fact_order_item ADD CONSTRAINT dim_date_fact_order_item_fk
FOREIGN KEY (date)
REFERENCES dim_date (date)
ON DELETE NO ACTION
ON UPDATE NO ACTION
