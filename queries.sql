-- Useful queries for Movie Ticket Booking System

-- 1. Available seats for a show (show_id = 5001)
SELECT sa.assignment_id, s.seat_label, s.seat_class
FROM Seat_Assignments sa
JOIN Seats s ON sa.seat_id = s.seat_id
WHERE sa.show_id = 5001 AND sa.is_booked = 0
ORDER BY s.seat_row, s.seat_col;

-- 2. Bookings and customers for a show
SELECT b.booking_id, b.booking_reference, c.full_name, b.total_amount, b.status
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
WHERE b.show_id = 5001;

-- 3. Revenue per show
SELECT sh.show_id, m.title, SUM(b.total_amount) AS revenue
FROM Shows sh
JOIN Movies m ON sh.movie_id = m.movie_id
LEFT JOIN Bookings b ON sh.show_id = b.show_id
GROUP BY sh.show_id, m.title;

-- 4. Occupancy rate for a show
SELECT sh.show_id, (NVL(COUNT(bs.assignment_id),0) / (SELECT COUNT(*) FROM Seat_Assignments sa WHERE sa.show_id = sh.show_id)) * 100 AS occupancy_percentage
FROM Shows sh
LEFT JOIN Booking_Seats bs ON sh.show_id = (SELECT show_id FROM Bookings WHERE booking_id = bs.booking_id)
WHERE sh.show_id = 5001
GROUP BY sh.show_id;

-- 5. Mark seat as booked (example transaction pseudocode)
-- BEGIN TRANSACTION;
-- SELECT is_booked FROM Seat_Assignments WHERE assignment_id = :assignment_id FOR UPDATE;
-- IF is_booked = 0 THEN
--   UPDATE Seat_Assignments SET is_booked = 1 WHERE assignment_id = :assignment_id;
--   INSERT INTO Booking_Seats (booking_id, assignment_id, price) VALUES (:booking_id, :assignment_id, :price);
--   COMMIT;
-- ELSE
--   ROLLBACK; -- seat already booked
-- END IF;
