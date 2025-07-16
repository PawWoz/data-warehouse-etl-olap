# 📊 Data Warehouse Project – Finance and Time Tracking

This project involves extending a source database and designing, implementing, and populating a data warehouse for analyzing financial and time-related data.  

---

## 📋 Project Overview

The project is based on the source relational database **"Baza Finanse i Czas.accdb"** (MS Access), which was extended to track time spent on various activities alongside financial data such as income and expenses. The data warehouse enables comprehensive analysis and supports business decision-making.

> 📄 **Full project documentation available here:**  
> [DOKUMENTACJA.docx](https://github.com/PawWoz/data-warehouse-etl-olap/blob/main/DOKUMENTACJA.docx)

<div align="center">

[![Data Warehouse](https://img.shields.io/badge/Data_Warehouse-4B8BBE?style=for-the-badge&logo=data&logoColor=white)](https://en.wikipedia.org/wiki/Data_warehouse)
[![OLAP](https://img.shields.io/badge/OLAP-008080?style=for-the-badge&logo=databricks&logoColor=white)](https://en.wikipedia.org/wiki/Online_analytical_processing)
[![ETL](https://img.shields.io/badge/ETL-6A1B9A?style=for-the-badge&logo=airbyte&logoColor=white)](https://en.wikipedia.org/wiki/Extract,_transform,_load)
[![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=sqlite&logoColor=white)](https://en.wikipedia.org/wiki/SQL)
[![SQL Server](https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)](https://www.microsoft.com/en-us/sql-server)
[![Microsoft Access](https://img.shields.io/badge/Microsoft_Access-A4373A?style=for-the-badge&logo=microsoft-access&logoColor=white)](https://www.microsoft.com/en-us/microsoft-365/access)
[![SSIS](https://img.shields.io/badge/SSIS-0078D7?style=for-the-badge&logo=windows&logoColor=white)](https://learn.microsoft.com/en-us/sql/integration-services/)
[![SSAS](https://img.shields.io/badge/SSAS-003B57?style=for-the-badge&logo=microsoft&logoColor=white)](https://learn.microsoft.com/en-us/sql/analysis-services/)

</div>


---

## 🎯 Project Requirements

1. Extend the source database to record time tracking data.
2. Populate the source database with sample data on expenses, income, and time spent for multiple users.
3. Create a conceptual data warehouse model using these data dimensions.
4. Develop logical data warehouse models in both star and snowflake schemas.
5. Implement the star schema data warehouse in SQL Server.
6. Design and implement an ETL process to load data from the source database into the warehouse.
7. Populate the data warehouse using ETL processes.
8. Define and publish OLAP cubes based on the loaded data warehouse.
9. Perform sample analyses based on the published OLAP cubes.

---

## 📚 Documentation and Deliverables

- **Source Database**  
  - MS Access file with extended schema  
  - Strategy for populating source data (who entered data and for what period)  
- **Data Warehouse**  
  - Conceptual model (key concepts, supported decisions, planned analyses, fact and dimension tables)  
  - Logical models in star and snowflake schemas (ER diagrams)  
  - SQL scripts to create data warehouse structures  
- **ETL Process**  
  - Data mapping and transformation descriptions  
  - SQL scripts and SSIS projects used for loading data  
  - Screenshots demonstrating successful ETL execution and data loading  
- **OLAP Cubes**  
  - SSAS project files  
  - Screenshots of published OLAP cubes  
- **Sample Data Analysis**  
  - Excel analyses based on OLAP cubes  

---

## 🔍 Key Concepts in Conceptual Model

- **Income Types:** Salaries, bonuses, and other earnings  
- **Expense Categories:** Purchases, services, and miscellaneous costs  
- **Time Dimension:** Days, months, years, weekdays  
- **Location:** Towns, cities, villages  
- **Payment Methods:** Cash, credit card, etc.  
- **Person:** Users associated with financial and time records  

---

## ⚙️ ETL Process Overview

- **Dimensions Loading:**  
  - Extract data from Excel files exported from the Access database  
  - Use similarity matching to identify new vs. existing dimension records  
  - Load matched records into mapping tables; unmatched as new entries  

- **Facts Loading:**  
  - Extract transactional data (expenses, income, time spent) from Excel  
  - Use lookup transformations to associate facts with dimension keys  
  - Load facts into fact tables (`fWydatek`, `fPrzychod`, `fCzasSpedzony`)  

---

## 🎯 Supported Analyses and Business Decisions

- Income and expense trends over time  
- Purchasing preferences by location and community type  
- Payment method usage across demographic groups  
- Seasonal trends in income, expenses, and activities  
- Investment decisions, such as feasibility of building a shopping center based on customer behavior analysis  

---
