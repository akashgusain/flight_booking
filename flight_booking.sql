a. List each aircraft type, a separate list of seats is supported.


select aircrafts_data.aircraft_code,aircrafts_data.model, s.fare_conditions from aircrafts_data inner join
    seats s on aircrafts_data.aircraft_code = s.aircraft_code group by model, aircrafts_data.aircraft_code
, s.fare_conditions order by aircrafts_data.aircraft_code;


b. Which type of aircraft has the most travel class?

select ad.model,count(flights.flight_id) from flights inner join
    aircrafts_data ad on ad.aircraft_code = flights.aircraft_code
group by ad.model order by count(flights.flight_id) desc;

c. Which cities have more than one airport?

select timezone, count(timezone) from airports_data group by timezone
order by count(timezone) desc;

d. Find the next flight from Yekaterinburg to Moscow.

select scheduled_departure,status  from flights
where departure_airport='SVX' and arrival_airport = 'SVO'
and status='Scheduled' order by scheduled_departure;

e. Find top 5-spending customers.

select passenger_name, count(ticket_no) from tickets group by passenger_name
order by count(ticket_no) desc limit 5;