-- Sample data for Movie Ticket Booking System

-- Movies
INSERT INTO Movies VALUES (1,'The Great Adventure',120,'English',TO_DATE('2025-09-01','YYYY-MM-DD'));
INSERT INTO Movies VALUES (2,'Romance in City',105,'Hindi',TO_DATE('2025-08-15','YYYY-MM-DD'));

-- Theatres and Screens
INSERT INTO Theatres VALUES (1,'Galaxy Cinemas','Mumbai');
INSERT INTO Theatres VALUES (2,'Sunrise Multiplex','Pune');

INSERT INTO Screens VALUES (10,1,'Screen 1',100);
INSERT INTO Screens VALUES (11,1,'Screen 2',80);
INSERT INTO Screens VALUES (20,2,'Main Hall',120);

-- Seats (sample few seats for screen 1)
INSERT INTO Seats VALUES (1001,10,'A1','A',1,'Regular');
INSERT INTO Seats VALUES (1002,10,'A2','A',2,'Regular');
INSERT INTO Seats VALUES (1003,10,'A3','A',3,'Premium');

-- Shows
INSERT INTO Shows VALUES (5001,1,10,TO_DATE('2025-11-15 18:00','YYYY-MM-DD HH24:MI'),200,'Scheduled');
INSERT INTO Shows VALUES (5002,2,11,TO_DATE('2025-11-15 20:00','YYYY-MM-DD HH24:MI'),180,'Scheduled');

-- Seat assignments for show 5001 (map seats to show)
INSERT INTO Seat_Assignments VALUES (9001,5001,1001,0);
INSERT INTO Seat_Assignments VALUES (9002,5001,1002,0);
INSERT INTO Seat_Assignments VALUES (9003,5001,1003,0);

-- Pricing classes
INSERT INTO Pricing_Classes VALUES (1,'Regular',1.0);
INSERT INTO Pricing_Classes VALUES (2,'Premium',1.5);
INSERT INTO Pricing_Classes VALUES (3,'VIP',2.0);

-- Customers
INSERT INTO Customers VALUES (7001,'Vandana Tanwar','vandana@example.com','+911234567890',TO_DATE('2024-01-01','YYYY-MM-DD'));
INSERT INTO Customers VALUES (7002,'Alice Sharma','alice@example.com','+911234567891',TO_DATE('2025-02-10','YYYY-MM-DD'));

-- Booking (sample confirmed booking for seat A1)
INSERT INTO Bookings VALUES (8001,'BK10001',7001,5001,TO_DATE('2025-11-01 10:00','YYYY-MM-DD HH24:MI'),200,'Confirmed');
INSERT INTO Booking_Seats VALUES (8001,9001,200);

-- Payments
INSERT INTO Payments VALUES (6001,8001,200,TO_DATE('2025-11-01','YYYY-MM-DD'),'Credit Card','TXN5001');

-- Audit log
INSERT INTO Audit_Log VALUES (1,'Bookings','8001','Created',TO_DATE('2025-11-01','YYYY-MM-DD'),'System','Booking created and paid');
