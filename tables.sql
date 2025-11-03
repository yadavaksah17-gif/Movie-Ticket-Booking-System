-- Movie Ticket Booking System Tables (Oracle SQL compatible)

-- Movies
CREATE TABLE Movies (
    movie_id NUMBER PRIMARY KEY,
    title VARCHAR2(300),
    duration_minutes NUMBER,
    language VARCHAR2(50),
    release_date DATE
);

-- Theatres and Screens
CREATE TABLE Theatres (
    theatre_id NUMBER PRIMARY KEY,
    theatre_name VARCHAR2(200),
    location VARCHAR2(300)
);

CREATE TABLE Screens (
    screen_id NUMBER PRIMARY KEY,
    theatre_id NUMBER REFERENCES Theatres(theatre_id),
    screen_name VARCHAR2(100),
    seat_capacity NUMBER
);

-- Seats (template per screen)
CREATE TABLE Seats (
    seat_id NUMBER PRIMARY KEY,
    screen_id NUMBER REFERENCES Screens(screen_id),
    seat_label VARCHAR2(10),
    seat_row VARCHAR2(10),
    seat_col NUMBER,
    seat_class VARCHAR2(50) -- e.g., Regular, Premium, VIP
);

-- Shows (scheduled instances)
CREATE TABLE Shows (
    show_id NUMBER PRIMARY KEY,
    movie_id NUMBER REFERENCES Movies(movie_id),
    screen_id NUMBER REFERENCES Screens(screen_id),
    show_time DATE,
    base_fare NUMBER,
    status VARCHAR2(30) -- Scheduled, Cancelled, Completed
);

-- Seat inventory / assignments per show
CREATE TABLE Seat_Assignments (
    assignment_id NUMBER PRIMARY KEY,
    show_id NUMBER REFERENCES Shows(show_id),
    seat_id NUMBER REFERENCES Seats(seat_id),
    is_booked NUMBER(1) DEFAULT 0 -- 0 = available, 1 = booked
);

-- Pricing classes
CREATE TABLE Pricing_Classes (
    class_id NUMBER PRIMARY KEY,
    class_name VARCHAR2(50),
    multiplier NUMBER -- multiplier over base fare
);

-- Customers
CREATE TABLE Customers (
    customer_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(200),
    email VARCHAR2(200),
    phone VARCHAR2(30),
    created_at DATE
);

-- Bookings
CREATE TABLE Bookings (
    booking_id NUMBER PRIMARY KEY,
    booking_reference VARCHAR2(20) UNIQUE,
    customer_id NUMBER REFERENCES Customers(customer_id),
    show_id NUMBER REFERENCES Shows(show_id),
    booking_time DATE,
    total_amount NUMBER,
    status VARCHAR2(30) -- Confirmed, Cancelled, Pending
);

-- Booking seats (which seats are reserved in a booking)
CREATE TABLE Booking_Seats (
    booking_id NUMBER REFERENCES Bookings(booking_id),
    assignment_id NUMBER REFERENCES Seat_Assignments(assignment_id),
    price NUMBER,
    PRIMARY KEY (booking_id, assignment_id)
);

-- Payments
CREATE TABLE Payments (
    payment_id NUMBER PRIMARY KEY,
    booking_id NUMBER REFERENCES Bookings(booking_id),
    amount NUMBER,
    payment_date DATE,
    payment_method VARCHAR2(50),
    transaction_reference VARCHAR2(200)
);

-- Audit Log
CREATE TABLE Audit_Log (
    audit_id NUMBER PRIMARY KEY,
    entity VARCHAR2(100),
    entity_id VARCHAR2(100),
    action VARCHAR2(100),
    action_time DATE,
    performed_by VARCHAR2(200),
    details VARCHAR2(1000)
);
