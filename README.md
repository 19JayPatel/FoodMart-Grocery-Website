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

```
---
## 📸 Screenshots

### Home Page
![Home Page](https://github.com/19JayPatel/FoodMart-Grocery-Website/blob/master/Screenshot/Home.png)
### User SignUp Page
![UserSignup](https://github.com/19JayPatel/FoodMart-Grocery-Website/blob/master/Screenshot/UserSignup.png)
### User Login Page
![UserLogin](https://github.com/19JayPatel/FoodMart-Grocery-Website/blob/master/Screenshot/Userlogin.png)
### Admin Login Page
![AdminLogin](https://github.com/19JayPatel/FoodMart-Grocery-Website/blob/master/Screenshot/Adminlogin.png)
### Dashboard Page
![Dashboard](https://github.com/19JayPatel/FoodMart-Grocery-Website/blob/master/Screenshot/Dashboard.png)
### ManageProduct Page
![ManageProduct](https://github.com/19JayPatel/FoodMart-Grocery-Website/blob/master/Screenshot/Manageproduct.png)

