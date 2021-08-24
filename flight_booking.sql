a. List each aircraft type, a separate list of seats is supported.

select aircrafts_data.aircraft_code,
       aircrafts_data.model ->> 'en' as aircraft_model,
       s.seat_no,
       s.fare_conditions
from aircrafts_data
         inner join
     seats s on aircrafts_data.aircraft_code = s.aircraft_code
group by model, aircrafts_data.aircraft_code, s.seat_no,
         s.fare_conditions
order by aircrafts_data.aircraft_code, s.seat_no;


b. Which type of aircraft has the most travel class?

select ad.model ->> 'en' as aircraft_model, tf.fare_conditions, count(distinct tf.ticket_no)
from aircrafts_data ad
         inner join flights f on ad.aircraft_code = f.aircraft_code
         inner join ticket_flights tf on f.flight_id = tf.flight_id
group by ad.model, tf.fare_conditions
order by aircraft_model, count(distinct tf.ticket_no) desc;

c. Which cities have more than one airport?

select city, count(airport_name)
from airports
group by city
order by count(airport_name) desc;

d. Find the next flight from Yekaterinburg to Moscow.

select *
from flights
where departure_airport = 'SVX'
  and arrival_airport = 'SVO'
  and scheduled_departure > bookings.now()
order by scheduled_departure desc;

e. Find top 5-spending customers.

select passenger_name, b.book_ref, sum(b.total_amount)
from tickets
         inner join bookings b on b.book_ref = tickets.book_ref
group by passenger_name, b.book_ref
order by sum(total_amount) desc
limit 5;
