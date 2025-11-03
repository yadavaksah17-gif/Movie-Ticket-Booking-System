CREATE OR REPLACE PROCEDURE book_ticket(
  p_show_id IN NUMBER, p_seat_label IN VARCHAR2, p_customer_name IN VARCHAR2,
  p_customer_phone IN VARCHAR2, p_amount IN NUMBER, p_booking_id OUT NUMBER
) IS
  v_seat_id NUMBER; v_seat_avail_id NUMBER; v_status VARCHAR2(20);
BEGIN
  SELECT s.seat_id INTO v_seat_id FROM seats s JOIN shows sh ON sh.auditorium_id=s.auditorium_id
   WHERE sh.show_id=p_show_id AND s.seat_label=p_seat_label;
  SELECT sa.seat_avail_id, sa.status INTO v_seat_avail_id, v_status FROM seat_availability sa
   WHERE sa.show_id=p_show_id AND sa.seat_id=v_seat_id FOR UPDATE;
  IF v_status='VACANT' THEN
    UPDATE seat_availability SET status='BOOKED' WHERE seat_avail_id=v_seat_avail_id;
    SELECT seq_booking_id.NEXTVAL INTO p_booking_id FROM dual;
    INSERT INTO bookings VALUES(p_booking_id, p_show_id, v_seat_avail_id, p_customer_name, p_customer_phone, SYSTIMESTAMP, p_amount, 'CONFIRMED');
    COMMIT;
  ELSE
    ROLLBACK;
    RAISE_APPLICATION_ERROR(-20001,'Seat already booked');
  END IF;
END;
/
