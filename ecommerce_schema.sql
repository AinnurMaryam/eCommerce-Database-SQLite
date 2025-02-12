CREATE TABLE IF NOT EXISTS "Users" (
	"user_id"	INTEGER,
	"username"	TEXT NOT NULL,
	"password"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"phone"	TEXT,
	PRIMARY KEY("user_id")
);
CREATE TABLE IF NOT EXISTS "Categories" (
	"category_id"	INTEGER,
	"category_name"	TEXT NOT NULL,
	"description"	TEXT,
	PRIMARY KEY("category_id")
);
CREATE TABLE IF NOT EXISTS "ShopOwners" (
	"owner_id"	INTEGER,
	"name"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"phone"	TEXT,
	PRIMARY KEY("owner_id")
);
CREATE TABLE IF NOT EXISTS "Shops" (
	"shop_id"	INTEGER,
	"shop_name"	TEXT NOT NULL,
	"location"	TEXT,
	"owner_id"	INTEGER,
	PRIMARY KEY("shop_id"),
	FOREIGN KEY("owner_id") REFERENCES "ShopOwners"("owner_id")
);
CREATE TABLE IF NOT EXISTS "Products" (
	"product_id"	INTEGER,
	"name"	TEXT NOT NULL,
	"description"	TEXT,
	"price"	REAL NOT NULL,
	"stock"	INTEGER NOT NULL,
	"shop_id"	INTEGER,
	"category_id"	INTEGER,
	PRIMARY KEY("product_id"),
	FOREIGN KEY("category_id") REFERENCES "Categories"("category_id"),
	FOREIGN KEY("shop_id") REFERENCES "Shops"("shop_id")
);
CREATE TABLE IF NOT EXISTS "ProductReview" (
	"review_id"	INTEGER,
	"product_id"	INTEGER,
	"user_id"	INTEGER,
	"stars"	INTEGER CHECK(stars >= 1 AND stars <= 5),
	"comment"	TEXT,
	"image"	TEXT,
	"date"	TEXT,
	PRIMARY KEY("review_id"),
	FOREIGN KEY("product_id") REFERENCES "Products"("product_id"),
	FOREIGN KEY("user_id") REFERENCES "Users"("user_id")
);
CREATE TABLE IF NOT EXISTS "Payments" (
	"payment_id"	INTEGER,
	"order_id"	INTEGER,
	"amount"	REAL NOT NULL,
	"payment_date"	TEXT,
	"payment_method"	TEXT,
	"payment_status"	TEXT,
	PRIMARY KEY("payment_id"),
	FOREIGN KEY("order_id") REFERENCES "Orders"("order_id")
);
CREATE TABLE IF NOT EXISTS "ShippingAddress" (
	"address_id"	INTEGER,
	"name"	TEXT NOT NULL,
	"address_line_1"	TEXT NOT NULL,
	"address_line_2"	TEXT,
	"postcode"	TEXT NOT NULL,
	"city"	TEXT NOT NULL,
	"state"	TEXT NOT NULL,
	"country"	TEXT NOT NULL,
	"phone_number"	TEXT,
	PRIMARY KEY("address_id")
);
CREATE TABLE IF NOT EXISTS "Orders" (
	"order_id"	INTEGER,
	"user_id"	INTEGER,
	"product_id"	INTEGER,
	"quantity"	INTEGER NOT NULL,
	"total_price"	REAL NOT NULL,
	"date"	TEXT,
	"status"	TEXT,
	"address_id"	INTEGER,
	PRIMARY KEY("order_id"),
	FOREIGN KEY("address_id") REFERENCES "ShippingAddress"("address_id"),
	FOREIGN KEY("product_id") REFERENCES "Products"("product_id"),
	FOREIGN KEY("user_id") REFERENCES "Users"("user_id")
);
CREATE TABLE IF NOT EXISTS "UserAddress" (
	"user_address_id"	INTEGER,
	"user_id"	INTEGER,
	"address_id"	INTEGER,
	PRIMARY KEY("user_address_id"),
	FOREIGN KEY("address_id") REFERENCES "ShippingAddress"("address_id"),
	FOREIGN KEY("user_id") REFERENCES "Users"("user_id")
);
