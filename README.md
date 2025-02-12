# e-Commerce Database Design (SQLite) 🛒  

A relational database schema for an e-commerce platform using SQLite.  

## 📌 Features  
✔️ ER Diagram for database structure  
✔️ SQL script to create tables and relationships  

## 🛠️ Technologies Used  
- SQLite  
- SQL  

## 📊 Database Schema  
This e-commerce database consists of multiple tables with well-defined relationships:  

- **Users** – Stores customer login information  
- **Categories** – Contains product categories  
- **ShopOwners** – Details of shop owners  
- **Shops** – Represents stores selling products  
- **Products** – List of products available for sale  
- **ProductReview** – Stores customer reviews and ratings  
- **Orders** – Records customer purchases  
- **Payments** – Stores payment transactions  
- **ShippingAddress** – Stores delivery details  

### **ER Diagram**  
Below is the ER diagram for this e-commerce database:  

![ER Diagram](er_diagram.pdf)  

## 🚀 How to Run  
1. Install SQLite (`sqlite3`) if not already installed.  
2. Load the schema into an SQLite database:  
   ```sh
   sqlite3 ecommerce.db < ecommerce_schema.sql
3. The database is now set up with empty tables. You can start inserting data and running queries!

📂 Files Included
ecommerce_schema.sql → Creates the database structure
er_diagram.pdf → Visual representation of the database

