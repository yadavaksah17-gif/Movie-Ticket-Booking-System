# Movie Ticket Booking System

**Project description:** Handles theatre schedules, seat reservations, pricing, and customer bookings with concurrent transaction management. Backend uses Oracle Database (PL/SQL). Includes a sample Java CLI client (JDBC) to demonstrate booking.

## Files
- `schema_oracle.sql` — DDL: tables, constraints, indexes, sequences.
- `sample_data.sql` — sample seed data.
- `booking_procedure.sql` — PL/SQL procedure `book_ticket` that safely reserves a seat.
- `sample_queries.sql` — useful report queries.
- `er_diagram.puml` — ER diagram (PlantUML).
- `AppBooking.java` — sample Java CLI.
- `.gitignore` — ignore rules.

## Setup Instructions
1. Create Oracle schema/user (e.g. movie_admin).
2. Run `schema_oracle.sql`, then `sample_data.sql`, then `booking_procedure.sql`.
3. Compile and run Java example using Oracle JDBC driver.
