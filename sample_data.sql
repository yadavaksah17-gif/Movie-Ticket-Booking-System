INSERT INTO theatres(name, city, address) VALUES ('PVR Plaza', 'Mumbai', 'MG Road');
INSERT INTO auditoriums(theatre_id, name, capacity) VALUES (1, 'Hall 1', 120);
INSERT INTO movies(title, duration_minutes, rating, language) VALUES ('The Great Escape', 125, 'U/A', 'English');
INSERT INTO shows(movie_id, auditorium_id, show_time, price) VALUES (1, 1, TO_TIMESTAMP('2025-11-10 18:30', 'YYYY-MM-DD HH24:MI'), 250);
