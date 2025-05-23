create table client(
client_id varchar(20) ,
name varchar(100),
primary key(client_id)
);


CREATE TABLE C_phone (
  client_id varchar(20),
  ph_no numeric(11,0) CHECK (ph_no >= 1000000000) NOT NULL,
  FOREIGN KEY (client_id) REFERENCES client ON DELETE CASCADE,
  PRIMARY KEY (client_id, ph_no)
);

drop table c_phone
create table booking(
booking_id varchar(10),
booking_date date,
payment_type varchar(15),
status varchar(15),
primary key(booking_id)
);
ALTER TABLE booking ADD CONSTRAINT valid_payment_type CHECK (payment_type in ('Cash', 'Card', 'Credit','Debit','PayPal'));
ALTER TABLE booking ADD CONSTRAINT valid_status CHECK (status in ('Complete', 'Pending','Confirm','Cancel'));

create table service(
service_id varchar(10),
service_type varchar(30),
primary key(service_id)
);


CREATE TABLE boat (
  boat_id INT PRIMARY KEY,
  boat_name VARCHAR(20),
  route_id INT,
  owner_id INT,
  o_name VARCHAR(20),
  boat_type VARCHAR(30)
);

CREATE TABLE owner (
  owner_id INT PRIMARY KEY,
  o_name VARCHAR(20)
);


create table client_booking(
client_id varchar(20) ,
booking_id varchar(10)  ,
boat_id int   ,
service_id varchar(10) ,
foreign key(client_id) references client ON DELETE CASCADE,
foreign key(booking_id) references booking ON DELETE CASCADE,
foreign key(boat_id) references boat ON DELETE CASCADE,
foreign key(service_id ) references service ON DELETE CASCADE,	
primary key (client_id,booking_id ,boat_id,service_id)
);








insert into client(client_id, name) values
('2A1', 'John'),
('2A2', 'Jane'),
('2A3', 'Alex'),
('2A4', 'Sarah'),
('2A5', 'Mike'),
('2A6', 'Jake'),
('2A7', 'Kate'),
('2A8', 'Nick');

insert into C_phone(client_id, ph_no) values
('2A1', 1234509876),
('2A1', 987654321),
('2A2', 5678956789),
('2A2', 5678956783),
('2A3', 2468912320),
('2A3', 2468912324),
('2A4', 9876522216),
('2A4', 9876522215),
('2A5', 1357900237),
('2A5', 1357900234),
('2A5', 3838202299),
('2A6', 2468009876),
('2A6', 8829267271),
('2A7', 6543209209),
('2A7', 5356866487),
('2A8', 1234223121),
('2A8', 8731687348);

INSERT INTO booking (booking_id, booking_date, payment_type, status)
VALUES 
('1001', '2023-05-20', 'Credit', 'Confirm'),
('1002', '2023-02-21', 'Debit', 'Pending'),
('1003', '2023-02-24', 'PayPal', 'Cancel'),
('1004', '2023-03-13', 'Cash', 'Complete'),
('1005', '2023-03-07', 'Credit', 'Confirm'),
('1006', '2023-03-18', 'Debit', 'Pending'),
('1007', '2023-02-28', 'PayPal', 'Cancel'),
('1008', '2023-03-20', 'Cash', 'Complete');

INSERT INTO service (service_id, service_type)
VALUES 
('401', 'Fishing'),
('402', 'Sightseeing'),
('403', 'Kayaking'),
('404', 'Snorkeling'),
('406', 'Cruising'),
('407', 'ScubaDiving'),
('408', 'Surfing'),
('409', 'Catering');

INSERT INTO boat (boat_id, boat_name, route_id, owner_id, o_name, boat_type)
VALUES
  (101, 'SeaStar', 201, 301, 'Bob', 'House Boat Luxury'),
  (102, 'Oceanic', 202, 302, 'Alice', 'House Boat Regular'),
  (103, 'BlueWave', 203, 303, 'Eve', 'Canoe'),
  (104, 'SeaSpray', 204, 304, 'David', 'Catamaran'),
  (105, 'DeepBlue', 205, 305, 'Rachel', 'House Boat Luxury'),
  (106, 'OceanRider', 206, 306, 'Lucy', 'House Boat Regular'),
  (107, 'SeaBreeze', 207, 307, 'Tom', 'House Boat Party'),
  (108, 'WaveRider', 208, 308, 'Julie', 'Motorboat');
  
  
 INSERT INTO owner (owner_id, o_name)
VALUES
  (301, 'Bob'),
  (302, 'Alice'),
  (303, 'Eve'),
  (304, 'David'),
  (305, 'Rachel'),
  (306, 'Lucy');
 
insert into client_booking (client_id, booking_id, boat_id, service_id) values
('2A1', '1001', '101', '401'),
('2A1', '1001', '101', '402'),
('2A1', '1001', '101', '406'),
('2A2', '1002', '102', '402'),
('2A2', '1002', '102', '406'),
('2A3', '1003', '103', '403'),
('2A3', '1003', '103', '406'),
('2A4', '1004', '104', '404'),
('2A4', '1004', '104', '407'),
('2A4', '1004', '104', '408'),
('2A5', '1005', '105', '401'),
('2A5', '1005', '105', '402'),
('2A5', '1005', '105', '406'),
('2A6', '1006', '106', '402'),
('2A6', '1006', '106', '406'),
('2A7', '1007', '107', '402'),
('2A7', '1007', '107', '406'),
('2A7', '1007', '107', '409'),
('2A8', '1008', '108', '404'),
('2A8', '1008', '108', '407');



SELECT payment_type, COUNT(booking_id) FROM booking
GROUP BY payment_type
HAVING COUNT(booking_id) >= 2;

SELECT name, ph_no FROM C_phone
JOIN client ON C_phone.client_id = client.client_id
ORDER BY name DESC;

SELECT client.name, ph_no 
FROM C_phone
JOIN client ON C_phone.client_id = client.client_id;

fdfdfdffdfdfd
SELECT client.name, ph_no, service_type
FROM C_phone
LEFT OUTER JOIN client ON C_phone.client_id = client.client_id
LEFT OUTER JOIN client_booking ON client.client_id = client_booking.client_id
LEFT OUTER JOIN service ON client_booking.service_id = service.service_id;


SELECT name, booking_date, payment_type, status
FROM client
natural join client_booking 
natural join booking 
WHERE status = 'Complete' OR status = 'Confirm';

SELECT client.name, ph_no /100 
FROM C_phone
natural join client ;

SELECT name
FROM client
WHERE name LIKE '%a%';

SELECT name, to_char(booking_date, 'Month DD, YYYY') as formatted_date, extract(month from booking_date) as month
FROM client
natural join client_booking
natural join booking ;

SELECT name, ph_no
FROM C_phone natural join client
WHERE ph_no BETWEEN 6500000000 AND 9999999999
AND client_id NOT IN ('2A5','2A7');

SELECT name, ph_no
FROM C_phone natural join client
WHERE ph_no NOT BETWEEN 6500000000 AND 9999999999
AND client_id IN ('2A5','2A7');

SELECT service_type
FROM service
UNION 
SELECT boat_type as service_type
FROM boat;

SELECT service_type
FROM service
UNION ALL
SELECT boat_type as service_type
FROM boat;

SELECT service_type
FROM service
EXCEPT
SELECT boat_type as service_type
FROM boat;



SELECT name, booking_date
FROM client
NATURAL JOIN client_booking NATURAL JOIN booking
WHERE payment_type = ALL (SELECT payment_type FROM booking WHERE status = 'Confirm');

SELECT name, booking_date
FROM client
NATURAL JOIN client_booking NATURAL JOIN booking
WHERE payment_type = ANY (SELECT payment_type FROM booking WHERE status = 'Pending');