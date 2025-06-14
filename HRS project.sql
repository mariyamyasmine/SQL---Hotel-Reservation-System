create database hotel_reservation_system;
use hotel_reservation_system;
show tables;
CREATE TABLE Bookings (
    Booking_ID varchar(10) PRIMARY KEY,
    no_of_adults INT,
    no_of_weekend_nights INT,
    no_of_week_nights INT,
    type_of_meal_plan VARCHAR(50),
    required_car_parking_space int,
    room_type_reserved VARCHAR(50),
    lead_time INT,
    arrival_year INT,
    arrival_month INT,
    arrival_date INT,
    market_segment_type VARCHAR(50),
    repeated_guest int,
    no_of_previous_cancellations INT,
    no_of_previous_bookings_not_canceled INT,
    avg_price_per_room DECIMAL(10, 2),
    no_of_special_requests INT,
    booking_status VARCHAR(50)
);
SELECT * FROM Bookings;

CREATE TABLE Guests (
    Booking_ID VARCHAR(10) PRIMARY KEY,
    no_of_adults INT,
    repeated_guest INT,
    no_of_previous_cancellations INT,
    no_of_previous_bookings_not_canceled INT,
    no_of_special_requests INT,
    FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID)
);
SELECT * FROM Guests;

CREATE TABLE Reservations (
    Booking_ID varchar(10) PRIMARY KEY,
    room_type_reserved VARCHAR(50),
    lead_time INT,
    arrival_year INT,
    arrival_month INT,
    arrival_date INT,
    avg_price_per_room DECIMAL(10, 2),
    booking_status VARCHAR(50),
    FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID)
);
SELECT * FROM Reservations;

-- TOTAL REVENUE IN BOOKING TABLE(1)
SELECT SUM(avg_price_per_room * (no_of_weekend_nights + no_of_week_nights)) AS total_revenue
FROM Bookings;

-- alter table(2)
select Booking_ID,customers_feedbacks from Reservations;
ALTER TABLE Reservations
ADD customers_feedbacks VARCHAR(250);


 -- update table(3)
UPDATE Reservations
SET booking_status = 'Confirmed'
WHERE booking_status = 'Not_canceled';
select * from Reservations;

-- update using case table(4)
UPDATE Reservations
SET customer_feedback = 
    CASE 
        WHEN booking_status = 'Confirmed' THEN 'Great stay'
        ELSE 'Not favorable'
    END;
    select * from Reservations;

-- Retrieve All Confirmed Bookings for a Specific Month(5)
select  distinct(booking_status) from bookings;
SELECT booking_id,arrival_month,booking_status FROM Bookings WHERE arrival_month = 5 and booking_status = 'Confirmed';

-- Find the Total Number of Guests Per Booking(6)
SELECT B.Booking_ID, G.no_of_adults 
FROM Bookings B JOIN Guests G ON B.Booking_ID = G.Booking_ID;

-- Calculate the Average Room Price for Each Room Type(7)
 SELECT room_type_reserved, AVG(avg_price_per_room) AS avg_price
FROM Reservations GROUP BY room_type_reserved;

select distinct(repeated_guest) from Guests;
-- Count the Number of Repeated Guests(8)
SELECT repeated_guest,COUNT(*) AS repeat_guests
FROM Guests WHERE repeated_guest = 1;

-- Get the Market Segment with the Most Bookings(9)
SELECT B.market_segment_type, COUNT(*) AS total_bookings
FROM Bookings B
GROUP BY B.market_segment_type
ORDER BY total_bookings DESC
LIMIT 1;

-- Retrieve Canceled Bookings with a Lead Time > 30 Days(10)
SELECT B.Booking_ID, R.lead_time, B.booking_status
FROM Bookings B
JOIN Reservations R ON B.Booking_ID = R.Booking_ID
WHERE R.lead_time > 30 AND B.booking_status = 'Canceled';

-- Identify Guests Who Have Canceled More Than Twice(11)
SELECT B.Booking_ID, G.no_of_previous_cancellations
FROM Bookings B
JOIN Guests G ON B.Booking_ID = G.Booking_ID
WHERE G.no_of_previous_cancellations > 2;

-- Count the Total Number of Bookings Per Year(12)
SELECT arrival_year, COUNT(*) AS total_bookings
FROM Bookings
GROUP BY arrival_year
ORDER BY arrival_year;


desc Reservations;
