billingCREATE DATABASE  IF NOT EXISTS `hotel_z0` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel_z0`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_z0
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `Billing_ID` int NOT NULL,
  `Total amount` varchar(45) NOT NULL,
  `Check_In` varchar(45) NOT NULL,
  `Check_out` varchar(45) NOT NULL,
  `Guest_ID` int NOT NULL,
  `Reservation_ID` int NOT NULL,
  PRIMARY KEY (`Billing_ID`),
  KEY `Guest_ID_idx` (`Guest_ID`),
  CONSTRAINT `Guest_ID` FOREIGN KEY (`Guest_ID`) REFERENCES `guest` (`Guest_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,'565','2021-10-05','2021-10-08',1,1),(2,'473','2021-10-07','2021-10-10',2,2),(3,'675','2021-10-11','2021-10-14',3,3),(4,'574','2021-10-13','2021-10-15',4,4),(5,'678','2021-10-15','2021-10-18',5,5),(6,'795','2021-10-19','2021-10-21',6,6);
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_store`
--

DROP TABLE IF EXISTS `cafe_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_store` (
  `Cafe_items_ID` int NOT NULL,
  `Cafe_items_Quantity` int NOT NULL,
  `Supply_ID` int NOT NULL,
  `Employee_ID` int NOT NULL,
  `Position_ID` int NOT NULL,
  PRIMARY KEY (`Cafe_items_ID`),
  KEY `Position_ID_idx` (`Position_ID`),
  KEY `Supply_ID_idx` (`Supply_ID`),
  CONSTRAINT `Position_ID` FOREIGN KEY (`Position_ID`) REFERENCES `employees` (`Position_ID`),
  CONSTRAINT `Supply_ID` FOREIGN KEY (`Supply_ID`) REFERENCES `supplies` (`Supply_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_store`
--

LOCK TABLES `cafe_store` WRITE;
/*!40000 ALTER TABLE `cafe_store` DISABLE KEYS */;
INSERT INTO `cafe_store` VALUES (1,10,11,5,6),(2,15,12,5,6),(3,2,13,5,6),(4,14,14,5,6),(5,30,15,5,6),(6,7,16,8,8),(7,0,17,8,8),(8,30,18,8,8),(9,17,19,8,8),(10,25,20,8,8),(11,500,21,8,8),(12,350,22,8,8),(13,340,23,8,8),(14,370,24,8,8),(15,150,25,8,8);
/*!40000 ALTER TABLE `cafe_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `Employee_ID` int NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Position` varchar(45) NOT NULL,
  `Reward_Sign_up` varchar(45) NOT NULL,
  `Position_ID` int NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Position_ID_UNIQUE` (`Position_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Christine','Gomez','Female','Help_Desk','2',9),(2,'Jordan','Mackie','Male','Manager','7',2),(3,'Woody','Mallone','Male','Maintenance','1',5),(4,'Shay','Reader','Non-Binary','Room_Attendant','0',4),(5,'Jules','Mejia','Female','Executive_Chef','0',6),(6,'Mark','Hoffman','Non-Binary','Hotel Manager','8',1),(7,'Mathilda','Kendall','Non-Binary','Concierge','20',7),(8,'Rita','Gonzales','Female','Barista','0',8),(9,'Simone','Lee','Female','Spa','4',3),(10,'Julius','Foldman','Male','Maintenance','1',11),(11,'Corey','Lupus','Male','Room_Attendant','0',10);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `Equipment_ID` int NOT NULL,
  `Equipment_Quantity` smallint NOT NULL,
  `Purchase_Date` date NOT NULL,
  `Purchase_Price` decimal(10,2) NOT NULL,
  `Product_Code` varchar(45) NOT NULL,
  PRIMARY KEY (`Equipment_ID`),
  KEY `Product_Code_idx` (`Product_Code`),
  CONSTRAINT `Product_Code` FOREIGN KEY (`Product_Code`) REFERENCES `supplies` (`Product_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,10,'2020-01-04',250.00,'5MW'),(2,10,'2020-01-04',200.00,'6RD'),(3,15,'2020-01-08',300.00,'7RD'),(4,20,'2020-01-03',400.00,'8RU'),(5,5,'2020-01-01',500.00,'9MH'),(6,10,'2020-01-01',300.00,'10MM');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `Guest_ID` int NOT NULL,
  `First_Name` varchar(80) NOT NULL,
  `Last_Name` varchar(80) NOT NULL,
  `Member_Since` date NOT NULL,
  `Email` varchar(80) NOT NULL,
  `Room_Number` int NOT NULL,
  `Check_In` date NOT NULL,
  `Reward_ID` int NOT NULL,
  `Reservation_ID` int NOT NULL,
  `Billing_ID` int NOT NULL,
  `Spa_Room` int NOT NULL,
  PRIMARY KEY (`Guest_ID`),
  KEY `Reservation_ID_idx` (`Reservation_ID`),
  KEY `Reward_ID_idx` (`Reward_ID`),
  KEY `Room_Number_idx` (`Room_Number`),
  KEY `Spa_Room_idx` (`Spa_Room`),
  CONSTRAINT `Reservation_ID` FOREIGN KEY (`Reservation_ID`) REFERENCES `reservation` (`Reservation_ID`),
  CONSTRAINT `Reward_ID` FOREIGN KEY (`Reward_ID`) REFERENCES `rewards` (`Reward_ID`),
  CONSTRAINT `Room_Number` FOREIGN KEY (`Room_Number`) REFERENCES `room` (`Room_Number`),
  CONSTRAINT `Spa_Room` FOREIGN KEY (`Spa_Room`) REFERENCES `spa` (`Spa_Room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (1,'Uzma','England','2020-02-15','Uzma.England@yahoo.com',1,'2021-10-05',0,1,1,5),(2,'Kohen','Cairns','2020-03-05','Kohen.Cairns@gmail.com',2,'2021-10-07',0,2,2,1),(3,'Dwayne','Cantrell','2020-04-13','Dwayne.Cantrell@yahoo.com',3,'2021-10-11',0,3,3,4),(4,'Shamima','Knights','2020-05-07','Shamima.Knights@gmail.com',4,'2021-10-13',0,4,4,8),(5,'Darcie','Mann','2020-06-11','Darcie.Mann@yahoo.com',5,'2021-10-15',0,5,5,2),(6,'Humayra','Alston','2020-07-23','Humayra.Alston@gmail.com',6,'2021-10-19',0,6,6,7);
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `Reservation_ID` int NOT NULL,
  `Check_In` date NOT NULL,
  `Check_Out` date NOT NULL,
  `Occupied_Rooms` varchar(80) NOT NULL,
  `Rooms_Available` varchar(80) NOT NULL,
  `Cleaing_In_Process_Rooms` varchar(80) NOT NULL,
  `Guest_ID` int NOT NULL,
  `Billing_ID` int NOT NULL,
  PRIMARY KEY (`Reservation_ID`),
  KEY `Billing_ID_idx` (`Billing_ID`),
  CONSTRAINT `Billing_ID` FOREIGN KEY (`Billing_ID`) REFERENCES `billing` (`Billing_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2021-10-05','2021-10-08','1','229','70',1,1),(2,'2021-10-07','2021-10-10','2','228','70',2,2),(3,'2021-10-11','2021-10-14','3','227','70',3,3),(4,'2021-10-13','2021-10-15','4','226','70',4,4),(5,'2021-10-15','2021-10-18','5','225','70',5,5),(6,'2021-10-19','2021-10-21','6','224','70',6,6);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewards`
--

DROP TABLE IF EXISTS `rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rewards` (
  `Reward_ID` int NOT NULL,
  `Reward_Name` varchar(45) NOT NULL,
  `Reward_Points` varchar(45) NOT NULL,
  `Free_Breakfast` varchar(45) NOT NULL,
  `Free_Room` varchar(45) NOT NULL,
  `Spa` varchar(45) NOT NULL,
  `Room` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Reward_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewards`
--

LOCK TABLES `rewards` WRITE;
/*!40000 ALTER TABLE `rewards` DISABLE KEYS */;
INSERT INTO `rewards` VALUES (10,'Bronze','100','yes','no','no',NULL),(20,'Silver','1000','yes','yes','no',NULL),(30,'Gold','10000','yes','yes','Yes',NULL);
/*!40000 ALTER TABLE `rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `Room_Number` int NOT NULL,
  `Guest_ID` int NOT NULL,
  `Check_In` date NOT NULL,
  `Check_Out` date NOT NULL,
  `Room_Type` varchar(45) NOT NULL,
  `Floor_lvl` varchar(45) NOT NULL,
  PRIMARY KEY (`Room_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,1,'2021-10-05','2021-10-08','K','3'),(2,2,'2021-10-07','2021-10-10','Q','2'),(3,3,'2021-10-11','2021-10-14','2T','1'),(4,4,'2021-10-13','2021-10-15','Q','2'),(5,5,'2021-10-15','2021-10-18','K','3'),(6,6,'2021-10-17','2021-10-21','K','3');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spa`
--

DROP TABLE IF EXISTS `spa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spa` (
  `Spa_Room` int NOT NULL,
  `Employee_ID` int NOT NULL,
  `Equipment_ID` int NOT NULL,
  `Equipment_Quantity` varchar(45) NOT NULL,
  `Recent_Maintenance` varchar(45) NOT NULL,
  `Guest_ID` int NOT NULL,
  `Guest_Visits` varchar(45) NOT NULL,
  `Position_ID` int NOT NULL,
  PRIMARY KEY (`Spa_Room`),
  KEY `Employee_ID_idx` (`Employee_ID`),
  KEY `Equipment_ID_idx` (`Equipment_ID`),
  KEY `Guest_ID_idx` (`Guest_ID`),
  CONSTRAINT `Employee_ID` FOREIGN KEY (`Employee_ID`) REFERENCES `employees` (`Employee_ID`),
  CONSTRAINT `Equipment_ID` FOREIGN KEY (`Equipment_ID`) REFERENCES `equipment` (`Equipment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa`
--

LOCK TABLES `spa` WRITE;
/*!40000 ALTER TABLE `spa` DISABLE KEYS */;
INSERT INTO `spa` VALUES (1,9,5,'1','none',2,'0',3),(2,9,5,'1','repaint',5,'2',3),(3,9,5,'1','Out of Order',8,'0',3),(4,9,6,'2','none',3,'5',3),(5,9,6,'1','none',1,'3',3),(6,9,6,'1','none',7,'3',3),(7,9,5,'1','none',6,'3',3),(8,9,6,'1','none',4,'0',3);
/*!40000 ALTER TABLE `spa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplies` (
  `Supply_ID` int NOT NULL,
  `Supplier` varchar(45) NOT NULL,
  `Supplier_Product` varchar(45) NOT NULL,
  `Product_Quantity` smallint NOT NULL,
  `Product_Price` decimal(10,2) NOT NULL,
  `Product_Code` varchar(45) NOT NULL,
  PRIMARY KEY (`Supply_ID`),
  UNIQUE KEY `Product_Code_UNIQUE` (`Product_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,'Mayfair','Pillows',100,245.00,'1MP'),(2,'Ram','Sheets',50,200.00,'2RS'),(3,'Ramayan','Shampoo',288,55.00,'3RS'),(4,'Solar','Towels',50,100.00,'4ST'),(5,'Mayfair','Washing Machine',10,250.00,'5MW'),(6,'Ramayan','Dryer',10,200.00,'6RD'),(7,'Ramayan','Dishwasher',15,300.00,'7RD'),(8,'Ramayan','Utility Cart',20,400.00,'8RU'),(9,'Mayfair','Hot Tub',5,500.00,'9MH'),(10,'Mayfair','Masseuse Table',10,300.00,'10MM'),(11,'Sysco','Hot Dog',20,30.00,'11SH'),(12,'Sysco','Corn Dog',30,30.00,'12SC'),(13,'Sysco','Pizza',20,40.00,'13SP'),(14,'Sysco','Taco',30,35.00,'14ST'),(15,'Sysco','Burrito',40,25.00,'15SB'),(16,'Sysco','Pepto Bismol',20,15.00,'16SP'),(17,'Sysco','Alka Seltzet',5,10.00,'17SA'),(18,'Sysco','Tic-Tac',50,5.00,'18ST'),(19,'Sysco','Band-Aid',30,10.00,'19SB'),(20,'Sysco','Aspirin',30,17.00,'20SA'),(21,'Sysco','Napkin',500,15.00,'21SN'),(22,'Sysco','Plastic Knife',350,7.00,'22SP'),(23,'Sysco','Plastic Spoon',400,5.00,'23SP'),(24,'Sysco','Plastic Fork',400,6.00,'24SP'),(25,'Sysco','Straw',200,8.00,'25SS');
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-30 21:39:53



-- Easy Queries -- 

-- A guest at the hotel lost her rewards card, she says her card gets her free room and free spa. She also says that her card had 10000 reward points. What card does she have using that information?

Select *
from rewards
where reward_points like '10000';

-- The manager wants to hire more room attendants but isn’t sure how many in total they have hired in the hotel. How many room attendants does the Hotel have? 

SELECT count(*) as NumberOfRAs
from employees
where Position like "Room_Attendant";

-- There was a rumor that the concierge hit their 20th reward sign up, can you pull up the name of the person who this is? 

Select *
From employees
where Reward_sign_up = 20;

-- We want to know which equipment id has a quantity below 15?

SELECT Equipment_Id
from equipment
where Equipment_Quantity < 15;


-- Our manager wants us to find the supply id and price of products that begin between A and M, and have a price between 300 and 500. 

Select Supply_ID, Product_Price
From supplies
where Supplier_Product between "A%" and "M%"
having Product_Price between 300 and 500;

-- Our manager wants a list of suppliers that aren’t named Sysco. 
Select *
From supplies
where Supplier not in ("Sysco");

-- The manager forgot how many are rooms are currently filled by guests and would like to know the amount. 
 
Select count(Occupied_Rooms) as Number_of_rooms_occupied
From reservation ;
 
-- The manager forgot how many remaining rooms we have left and would like to know how many total rooms are available? 
 
Select Rooms_Available 
From reservation 
group by Rooms_Available
order by  Rooms_Available asc
limit 1;
 
-- The manager forgot what spa rooms are being occupied by guests 1 through 3 and want to know the names of those guests that are assigned which of these spa rooms? 
 
Select Guest_ID, Spa_Room, First_Name, Last_Name
from guest
Where Guest_ID between 1 and 3 
order by Guest_ID;
 
-- What is the average price of a room? 
SELECT AVG(Total_amount) 
FROM billing;
 
-- How many different guests have made bookings for October?
SELECT COUNT(DISTINCT guest_id)
FROM billing
WHERE (check_in >= '2021-10-01' AND check_in<= '2021-10-31');
 
-- What is the total amount of equipment purchased in the last month?
SELECT SUM(Purchase_Price) 
FROM equipment
WHERE Purchase_Date >= '2020-01-01’ AND purchase_type>= ‘2020-01-31';

-- List ALL guest details for guest_ID is  1.
SELECT * 
FROM guest
 WHERE guest_ID  LIKE '%1%';

-- How many visits has Spa Room 5 had?

select sum(Guest_Visits)
from spa
where Spa_Room = 5;

-- Find out which Spa rooms need Maintenance.

select Spa_Room,Recent_Maintenance
from spa
where not Recent_Maintenance='none';


-- Intermediate Queries -- 

-- The manager wants to find the employees who have more than 3 reward sign ups to reward them for their success.

Select *
From employees
Where Reward_sign_up > 3 
order by Reward_sign_up asc;

-- The manager wants to find out which employees have not had at least 1 reward sign up.

Select *
From employees
Where Reward_sign_up < 1
order by Reward_sign_up asc;

-- Our maintenance department was working on a piece of equipment in the spa. They later called and asked for the name of the employee in charge of cleaning the piece of equipment in spa room 3.

select concat(employees.first_name," ", employees.last_name)
from employees
inner join spa on spa.employee_id = employees.employee_id
where spa_room = "3";

-- Our hotel manager wants to know the product code of the cafe items that have a supply id between 1 and 5. As well as the employee who is in charge of ordering those items. 

select product_code, concat(employees.first_name," ", employees.last_name)
from supplies
inner join cafe_store on cafe_store.supply_id = supplies.supply_id
inner join employees on employees.employee_id = cafe_store.employee_id
where cafe_items_id between "1" and "5";


-- The hotel manager wants us to find the cafe item id, supply id, and employee id of the item in row number 5. 

SELECT *
FROM (
          SELECT ROW_NUMBER() OVER (ORDER BY cafe_items_id) AS row_num
                , cafe_items_id
                 , supply_id
                 , employee_id
  FROM cafe_store
) AS sub
WHERE row_num = 5
 
-- The manager wants to see the average product price spent on supplies having to do with food, cutlery, and medicine aka supplier Sysco -- 
Select supplies.Supplier, avg(supplies.Product_Price)
From supplies
where supplies.Supplier in ("Sysco")
Group by supplies.Supplier
Having avg(supplies.Product_Price) ;
 
-- The manager wants to see which guests that did not visit the spa at all? 
 
Select Guest_ID, Guest_Visits
From spa
Where Guest_Visits = 0
Group by Guest_ID
order by Guest_ID asc;

-- List the rooms that are currently being cleaned at Hotel Zo.
SELECT * 
FROM reservation
WHERE cleaning_in_process_rooms != '100';
 
 -- List the room types of the hotel.

SELECT Room_Type, 
COUNT(room_number) AS count 
FROM room
GROUP BY room_type;

 
-- Find out how many days guests not on the first floor stayed at the hotel.
 
Select First_Name,Last_Name,(DATEDIFF(reservation.Check_Out,reservation.Check_In ) ),room.Floor_lvl
From guest 
INNER JOIN reservation ON  guest.Guest_ID = reservation.Guest_ID
INNER JOIN room ON room.Room_Number = reservation.Occupied_Rooms
where room.Floor_lvl > 1;
 
 

-- Advanced Queries --

-- The manager needs to audit the database to see if Jules, the executive chef whose employee number is 5, is properly pulling the right items to her kitchen. Using the inner join and the cafe store items, how can they figure out if the right items are being picked by the right employees? 

SELECT supplier_product as product, Cafe_Items_Quantity as Quantity
from cafe_store
inner join supplies on supplies.supply_id = cafe_store.supply_id
inner join employees on employees.Employee_ID = cafe_store.Employee_ID
Where cafe_store.employee_ID = 5
Order by Quantity desc;

-- Can you also audit that the barista, whose employee # is 8, is doing the same? 

SELECT supplier_product as product, Cafe_Items_Quantity as Quantity
from cafe_store
inner join supplies on supplies.supply_id = cafe_store.supply_id
inner join employees on employees.Employee_ID = cafe_store.Employee_ID
Where cafe_store.employee_ID = 8
Order by Quantity desc;

-- Our hotel manager notified us of an upcoming inspection that is about to take place. They are looking to make sure everyone is recording everything accordingly. To test us, the hotel manager wants to know the name of an equipment that has the equipment id 6, who the supplier is, when it was purchased, in what spa rooms it is being used, if it has had any maintenance done, and which employee is responsible for that piece of equipment. To group it by spa room in a descending order. 

Select supplies.supplier, supplies.supplier_product, equipment.purchase_date, spa.spa_room, spa.recent_maintenance, concat(employees.first_name," ", employees.last_name)
from equipment
inner join supplies on supplies.product_code = equipment.product_code
inner join spa on spa.equipment_id = equipment.equipment_id
inner join employees on employees.position_id = spa.position_id
where equipment.equipment_id = "6"
order by spa_room desc;


-- The manager would like to be provided the first and last names of the guests, their Reservation_ID’s and Billing_ID’s? 
 
Select guest.First_Name, guest.Last_Name, reservation.Reservation_ID, billing.Billing_ID
From guest
Inner join reservation on reservation.Guest_ID = guest.Guest_ID
Inner join billing on reservation.Guest_ID = billing.Guest_ID
order by guest.last_name ;
 
 
-- Create a separate table with the same structure as reservation to hold archive records. Using the INSERT statement, copy the records from the reservation table to the archive table relating to reservations before 1st October 2021. Delete all reservations before 1st October 2021 from the reservation table.
 
CREATE TABLE reservation_old(
Reservation_ID INT NOT NULL,
Check_In DATE NOT NULL,
Check_Out DATE NOT NULL,
Occupied_Rooms VARCHAR (80)  NOT  NULL,
Rooms_Availble VARCHAR (80) NOT NULL,
Cleaning_In_Process_Rooms VARCHAR (80) NOT NULL,
Guest_id INT NOT NULL,
Billing_id INT NOT NULL
);
 
 
INSERT INTO reservation_old(
SELECT * 
FROM reservation
WHERE check_in >'2021-10-01');
DELETE FROM reservation
WHERE check_in >'2021-10-01';
 
-- What equipment does spa room 3,4,5,6 have and how much does each product cost (greater than $200). 
 
select Spa_Room,equipment.Equipment_ID,equipment.Equipment_Quantity,Supplier_Product,Product_Price
from spa 
inner join equipment on  spa.Equipment_ID= equipment.Equipment_ID
inner join supplies on equipment.Product_Code = supplies.Product_Code
where Spa_Room >=3 and Product_Price >200
order by Spa_Room
limit 4;
 
-- Which employee is assigned to which spa room and which customer is assigned to which spa room.
 
select spa.Spa_Room,spa.Employee_ID,guest.First_Name,guest.Last_Name
from guest
INNER JOIN spa ON  guest.Spa_Room = spa.Spa_Room
INNER JOIN employees ON spa.Employee_ID = employees.Employee_ID
order by spa.Spa_Room,spa.Employee_ID asc;

