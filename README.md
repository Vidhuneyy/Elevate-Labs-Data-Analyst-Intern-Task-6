# 🧾  Sales Trend Analysis Using Aggregations

## 📌 Objective

The goal of this task is to analyze **monthly revenue** and **order volume** based on customer transaction data from an online shop. The results help in understanding sales trends over time.

---

## 🧰 Tools Used

- Microsoft SQL Server Management Studio (SSMS)
- CSV dataset: [Online Shop Customer Sales Data.csv](https://github.com/user-attachments/files/19954411/Online.Shop.Customer.Sales.Data.csv)


---

## 📁 Dataset Description

The dataset contains anonymized customer sales records with the following key attributes:

- Customer demographics (ID, age, gender)
- Purchase behavior (purchase date, value, number of purchases)
- Marketing & platform usage (newsletter subscription, browser type, voucher use)

---

## ✅  Requirements

- Extract the **month** and **year** from the purchase date.
- Group data by **year/month**.
- Use **SUM** to calculate total revenue.
- Use **COUNT(DISTINCT order)** to calculate total order volume.
- Apply **ORDER BY** for chronological sorting.
- Filter the results to a **specific time period** (e.g., 2021).

---

## 🛠️ Steps Followed

1. **Created a new database** for the analysis.
2. **Created a table** matching the dataset structure.
3. **Imported** the CSV data using the SSMS Import Wizard.
4. Executed an SQL **aggregation query** to group sales by month and year.
5. **Filtered** the data to show only results from the year 2021.
6. **Displayed** monthly trends including total revenue and number of orders.

---

## 📊 Output Summary

The query generated a summary table showing:

- `order_year`: Year of transaction
- `order_month`: Month of transaction
- `total_revenue`: Total revenue generated in that month
- `total_orders`: Count of unique orders in that month

---

## 📦 Deliverables

- [x] SQL Script
- [x] Result Table


---

## 🧠 Output 
![Screenshot 2025-04-29 122526](https://github.com/user-attachments/assets/ee01bacf-939f-475e-a0c4-0fc91af8a992)



---


