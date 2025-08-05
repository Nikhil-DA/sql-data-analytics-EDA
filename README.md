# 📊 SQL Data Analytics Project

> **Project Type**: End-to-End SQL Analytics  
> **Data Source**: From prebuilt Data Warehouse (`gold_` schema)  
> **Skills Used**: Advanced SQL, Data Exploration, Segmentation, KPI Analysis  
> **Duration**: 13 Structured Scripts (SQL Modules 01–13)

---

## 🧠 Project Overview

This project showcases **deep-dive analytics on a sales and customer dataset**, leveraging a **prebuilt multi-layered Data Warehouse** developed in a prior project. The focus here is on **extracting business insights using only SQL**, simulating the work of a **Data Analyst/BI Developer** querying a clean, analytics-ready data source.

---

## 🏗️ Warehouse Structure (Input Source)

All queries and analytics in this project use the `gold_` layer of a previously built DWH.

- ✅ Cleaned, normalized, and joined tables
- ✅ Already transformed data from CRM and ERP sources
- ✅ Optimized schema for analytics use cases

**Schemas Used**:
- `gold_fact_sales`
- `gold_dim_products`
- `gold_dim_customers`

📁 For full warehouse creation steps, see: ########################################

---

## 📚 Module Structure

### 🔎 01–06: Exploratory Data Analysis
> These scripts explore customer demographics, product categories, sales timelines, and geographies.

- **Customer Country Distribution**
- **Sales Timelines (min/max dates, range)**
- **Top Categories/Subcategories**
- **Sales by Channel**
- **Customer Segmentation by Gender, Marital Status, Region**
- **Yearly & Monthly Sales Trends**

### 📈 07–13: Advanced Analytics & Segmentation
> These modules focus on product performance, recency metrics, and business KPIs.

- **Channel-Level Sales Aggregations**
- **Customer Lifetime Value (CLTV)**
- **Customer Retention Analysis**
- **Monthly Sales Growth (YoY, MoM)**
- **Product Segmentation by Revenue & Recency**
- **Average Order Revenue (AOR)**
- **Monthly Revenue & Lifespan by Product**

---

## 💡 Key Business KPIs Calculated

- 🧾 **Total Orders, Quantity, Revenue**
- 🧑‍💼 **Customer Count & Repeat Rates**
- 📦 **Product Lifespan, Last Sale Date, Recency**
- 💰 **Average Selling Price & Monthly Revenue**
- 🚦 **Segmentation** (High-Performer, Mid-Range, Low-Performer)

---

## 📤 Deliverables

Each script is modular and production-ready, enabling direct connection to a BI tool (like **Power BI** or **Tableau**) via views or scheduled jobs.

- `sql/01_country_distribution.sql`
- `sql/06_sales_trends.sql`
- `sql/09_customer_retention.sql`
- `sql/13_product_segmentation.sql`

➡️ *All SQL scripts are named sequentially for easy navigation.*

---

## 🧩 Tools & Tech Stack

- **SQL** (MySQL syntax)
- **Data Warehouse**: `gold_` schema
- **CTEs, Window Functions, CASE logic**
- **Segmentation Logic & KPI Math**
- **Optional BI Layer**: Power BI (can connect using the same queries)

---

## ✅ Outcomes

- 🟢 Simulated **real-world analytics tasks**
- 🟢 Reused a professional **data warehouse base**
- 🟢 Created **queryable, reusable SQL assets** for reporting
- 🟢 Segmented products and customers with real KPIs
- 🟢 Designed SQL modules to plug directly into dashboards

---

## 🔗 Related Projects

- 🔨 [Data Warehouse Project (Gold Schema Build)](#)
- 📊 [Power BI Dashboard (Connected to Output Queries)](#)

---

## 🙌 Author

**Nikhil Chauhan**  
🎓 Master's in Statistics | Aspiring Data Analyst  
🔗 GitHub: https://github.com/Nikhil-DA
📬 Email: chauhannikhil.email@gmail.com

---

