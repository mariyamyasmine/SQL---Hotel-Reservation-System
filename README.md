# 🏨 Hotel Reservation System – SQL Project

## 📘 Overview
This project simulates a database-driven Hotel Reservation System using MySQL. It is designed to manage hotel bookings, guest details, and reservation statuses, and includes analytical queries to extract business insights such as revenue tracking, cancellation analysis, and guest behavior trends.

---

## 🧱 Database Structure
The system includes the following tables:

- **Bookings:** Stores core booking information including room type, dates, lead time, and booking status.
- **Guests:** Captures guest-specific details such as cancellations, repeat bookings, and special requests.
- **Reservations:** Holds reservation metadata like arrival dates, average price per room, and customer feedback.

---

## 🔍 Key SQL Features & Queries
- **Schema Design:** Created normalized relational tables with primary and foreign key constraints.
- **Revenue Analysis:**  
  `→` Calculates total revenue based on room prices and length of stay.
- **Booking Trends:**  
  `→` Identifies popular room types and segments with the highest bookings.
- **Guest Analysis:**  
  `→` Tracks repeat guests and high-cancellation customers.
- **Advanced SQL Logic:**  
  `→` Used `JOIN`, `GROUP BY`, `CASE`, `UPDATE`, `ALTER TABLE`, and subqueries.

---

## 📊 Sample Use Cases
- Hotel manager can view **confirmed bookings for a given month**.
- Analysts can extract **revenue insights** and **identify peak seasons**.
- Customer service can track **frequent cancellers or repeat guests** for better engagement.

---

## 💡 Technologies Used
- **MySQL** – Core database engine
- **SQL Workbench** – Query execution and schema management
- **(Optional)** Excel or Power BI – For visualizing exported query results

---

## 🚀 How to Use
1. Import the `.sql` file into your MySQL environment.
2. Run the table creation and data population scripts.
3. Execute the queries for analytics and reporting.

---

## 📌 Folder Structure
