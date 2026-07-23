
# 📊 SQL Data Warehouse Project

## Overview

This project demonstrates the design and implementation of a modern data warehouse using **Microsoft SQL Server**. It follows the **Medallion Architecture** (Bronze, Silver, and Gold layers) to transform raw business data into a clean, analytics-ready data model.

The solution integrates data from multiple operational systems, applies ETL processes for data cleansing and transformation, and delivers a star schema optimized for business intelligence and reporting.

This project was built as part of my data engineering portfolio to showcase practical skills in SQL development, data modeling, ETL design, and analytical reporting.

---

# 🏛️ Data Architecture

### Data Lineage 
<img width="995" height="535" alt="image" src="https://github.com/user-attachments/assets/00d76f9f-23ea-4af2-b0ff-6b98616d58c9" />


# 🚀 Project Objectives

The primary objective of this project is to build an end-to-end analytical data warehouse that enables efficient reporting and business insights.

The project covers:

- Designing a scalable data warehouse architecture
- Building ETL pipelines using SQL
- Cleaning and transforming raw business data
- Creating analytical data models
- Developing reusable SQL views for reporting
- Generating business insights through SQL queries

### Silver Layer Transformations
<img width="987" height="606" alt="image" src="https://github.com/user-attachments/assets/f503402f-822d-431b-98cf-d97b54ef4863" />

---

# ⚙️ Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- Git & GitHub
- Draw.io (Architecture & Data Modeling)

---

# 📂 Data Sources

The warehouse integrates data from two business systems:

- **CRM System**
  - Customer information
  - Product information
  - Sales transactions

- **ERP System**
  - Customer demographics
  - Product categories
  - Geographic information

Both datasets are provided as CSV files and loaded into SQL Server.

---

# 📁 Repository Structure

```text
sql-data-warehouse/
│
├── datasets/                  # Raw ERP & CRM CSV files
│
├── docs/                      # Documentation and diagrams
│   ├── data_architecture.drawio
│   ├── data_models.drawio
│   ├── data_flow.drawio
│   ├── etl.drawio
│   ├── data_catalog.md
│   └── naming_conventions.md
│
├── scripts/
│   ├── bronze/                # Raw data loading
│   ├── silver/                # Data cleansing & transformations
│   └── gold/                  # Analytical views
│
├── tests/                     # Data validation scripts
│
├── README.md
├── LICENSE
└── .gitignore
```

---

# ⭐ Data Model

The Gold layer follows a **Star Schema** consisting of:

### Gold Layer tables
<img width="1097" height="652" alt="image" src="https://github.com/user-attachments/assets/9b609a5e-6905-4af0-802f-80ba93cd7e4e" />

---

# 🎯 Skills Demonstrated

This project demonstrates practical experience in:

- SQL Development
- Data Warehousing
- ETL Pipeline Design
- Data Cleansing
- Data Modeling
- Star Schema Design
- SQL Server
- Business Intelligence
- Data Analytics
- Query Optimization




