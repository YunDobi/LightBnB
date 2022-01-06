select id, name, email, password
FROM users
WHERE email = 'tristanjacobs@gmail.com';

--Get the average duration of all reservations.
SELECT avg(end_date - start_date) as total_duration
FROM reservations;

--Show all details about properties located in Vancouver including their average rating.
SELECT properties.id, title, cost_per_night, avg(property_reviews.rating) as average_rating
FROM properties
JOIN property_reviews ON properties.id = property_id
WHERE city LIKE '%ancouv%'
GROUP BY properties.id
HAVING avg(property_reviews.rating) >= 4
ORDER BY cost_per_night
LIMIT 10;

--Get a list of the most visited cities.
select properties.city as city, count(reservations) as total_reservations
from properties
join reservations on properties.id = property_id
group by city
order by total_reservations desc;

--Show all reservations for a user.
SELECT properties.id, title, cost_per_night, start_date, avg(rating) as average_rating
from properties
join reservations on property_id = properties.id
join property_reviews on properties.id  = property_reviews.property_id
where reservations.guest_id = '1'
AND reservations.end_date < now() :: date
GROUP by properties.id, start_date
order by start_date
LIMIT 10;
