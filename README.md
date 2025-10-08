# 🛒 FoodMart – Online Grocery Store (ASP.NET WebForms)

FoodMart is a simple **grocery shopping web application** built using **ASP.NET WebForms** and **SQL Server**.  
It allows customers to register, log in, browse grocery items, manage their cart, and place orders.  
An **Admin Panel** is provided for managing categories, products, and users.

---

## 🚀 Features
- 👤 **User Authentication** (Register/Login/Logout)  
- 🛍️ **Product Browsing** with categories  
- 🛒 **Shopping Cart System** (Add/Remove items)  
- 📦 **Order Placement**  
- 🛠️ **Admin Panel**: Manage categories & products  
- 📊 **SQL Server Database** integration  

---

## 🛠️ Tech Stack
- **Frontend:** ASP.NET WebForms, HTML, CSS, Bootstrap  
- **Backend:** C# (Code-behind in .aspx.cs)  
- **Database:** SQL Server  
- **IDE:** Visual Studio 2022  

---

## ⚙️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/19JayPatel/FoodMart-Grocery-Website.git
```
---
## 🛢 IMP SQL All Query
```bash
CREATE DATABASE FoodMart;

CREATE TABLE [dbo].[Admin_tbl] (
    [AdminID]  INT           IDENTITY (1, 1) NOT NULL,
    [Username] VARCHAR (MAX) NOT NULL,
    [Password] VARCHAR (MAX) NOT NULL
);

CREATE TABLE [dbo].[Categories] (
    [CategoryID]   INT            IDENTITY (1, 1) NOT NULL,
    [CategoryName] NVARCHAR (MAX) NOT NULL
);

CREATE TABLE [dbo].[Products_tbl] (
    [ProductID]    INT            IDENTITY (1, 1) NOT NULL,
    [ProductName]  NVARCHAR (MAX) NOT NULL,
    [Weight]       NVARCHAR (MAX) NOT NULL,
    [Price]        NVARCHAR (MAX) NOT NULL,
    [CategoryID]   INT            NOT NULL,
    [CategoryName] NVARCHAR (MAX) NOT NULL,
    [ProductImage] NVARCHAR (MAX) NOT NULL
);

CREATE TABLE [dbo].[User_tbl] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [FullName] NVARCHAR (MAX) NOT NULL,
    [Email]    NVARCHAR (MAX) NOT NULL,
    [PNumber]  NVARCHAR (MAX) NOT NULL,
    [Password] NVARCHAR (MAX) NOT NULL
);

CREATE TABLE [dbo].[Cart_tbl] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [User_id]          NVARCHAR (MAX)  NOT NULL,
    [Product_id]       NVARCHAR (MAX)  NOT NULL,
    [Product_name]     NVARCHAR (MAX)  NOT NULL,
    [Product_price]    DECIMAL (10, 2) NULL,
    [Product_quantity] INT             NULL,
    [Product_image]    NVARCHAR (MAX)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Order_tbl] (
    [Order_Id]         INT             IDENTITY (1, 1) NOT NULL,
    [User_Id]          INT             NOT NULL,
    [Order_Date]       DATETIME        NOT NULL,
    [Total_Amount]     DECIMAL (18, 2) NOT NULL,
    [Order_Status]     NVARCHAR (MAX)  NOT NULL,
    [Shipping_Address] NVARCHAR (MAX)  NOT NULL,
    [Payment_Method]   NVARCHAR (MAX)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Order_Id] ASC)
);

CREATE TABLE [dbo].[OrderItems_tbl] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [Order_Id]         INT             NOT NULL,
    [Product_Name]     NVARCHAR (MAX)  NOT NULL,
    [Product_Price]    DECIMAL (10, 2) NOT NULL,
    [Product_Quantity] INT             NOT NULL,
    [Product_Image]    NVARCHAR (MAX)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


-- Insert default admin credentials for Foodmart
INSERT INTO [dbo].[Admin_tbl] ([Username], [Password])
VALUES ('foodmart', 'foodmart123');

```
---
## 📸 Screenshots

### Home Page
![Home Page](https://github.com/19JayPatel/FoodMart-Grocery-Website/blob/master/Screenshot/Home.png)

