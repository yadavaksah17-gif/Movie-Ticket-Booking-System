# 🎬 Movie Ticket Booking System

**Author:** Vandana Tanwar  
**Project Type:** DBMS / Oracle SQL  
**Date Generated:** 2025-11-03

## 📖 Project Description
The Movie Ticket Booking System manages theatre schedules, seat reservations, pricing, and customer bookings with concurrent transaction management.  
This Oracle SQL DBMS design supports movies, theatres, screens, show schedules, seat inventory per show, bookings, payments, and reporting features.

## 🎯 System Features
- Manage movies, theatres, screens, and show schedules.  
- Seat map per screen and seat availability per show instance.  
- Booking transactions with seat reservation and concurrency considerations.  
- Pricing by seat class and show (base fare, taxes, fees).  
- Customer profiles and payment tracking.  
- Reports: available seats, revenue per show, occupancy rates.  
- Audit logs for booking actions and payment events.

## 📁 Database Tables (suggested)
- Movies
- Theatres, Screens
- Seats (seat template per screen)
- Shows (scheduled instances)
- Seat_Inventory / Seat_Assignments (per show)
- Customers
- Bookings, Booking_Seats
- Payments
- Pricing_Classes
- Audit_Log

## ⚙️ How to Run
1. Install Oracle Database or use [Oracle Live SQL](https://livesql.oracle.com/).  
2. Execute the scripts in the following order:
   ```sql
   tables.sql
   insert_data.sql
   queries.sql
   ```
3. To handle concurrent bookings in production, use transactions with appropriate isolation (e.g., SERIALIZABLE) or SELECT ... FOR UPDATE on seat rows during booking.

## 🧾 Files in this package
- `README.md` — Project documentation (this file)  
- `tables.sql` — Oracle-compatible table creation script  
- `insert_data.sql` — Sample data to populate the schema  
- `queries.sql` — Useful queries and reports  
- `er_diagram.png` — ER diagram placeholder image

---
