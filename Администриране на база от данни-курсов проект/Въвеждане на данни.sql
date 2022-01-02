USE BakeryBusiness

-- Table: Countries
SET IDENTITY_INSERT Countries ON

INSERT INTO Countries (Id, Name) VALUES
(1,'Turkey'),
(2,'Bulgaria'),
(3,'Japan'),
(4,'Venezuela'),
(5,'Serbia'),
(6,'Zimbabwe'),
(7,'Cambodia'),
(8,'Cape Verde'),
(9,'Thailand'),
(10,'Costa Rika')
SET IDENTITY_INSERT Countries OFF


-- Table: Customers
SET IDENTITY_INSERT Customers ON

INSERT INTO Customers (Id, FirstName, LastName, Gender, Age,PhoneNumber, CountryId) VALUES
(1,'Betty','Wallace','F',14,'0995421800',1),
(2,'Rachel','Bishop','F',10,'0779574407',3),
(3,'Joan','Peters','F',37,'0983157959',5),
(4,'Jean','Pierce','F',67,'0994780345',8),
(5,'Irene','Peters','F',69,'0995086966',5),
(6,'Carol','Miller','F',20,'0891119508',10),
(7,'Jason','Hamilton','M',36,'0980206055',8),
(8,'Brenda','Wallace','F',38,'0997026449',10),
(9,'Theresa','Riley','F',59,'0794768295',2),
(10,'Harry','Jones','M',16,'0971528030',4),
(11,'Jerry','Andrews','M',72,'0992688483',6),
(12,'Jennifer','Cunningham','F',62,'0871809337',6),
(13,'Antonio','Lynch','M',49,'0781375797',7),
(14,'Lisa','Green','F',37,'0972568702',7),
(15,'Randy','Ramirez','M',54,'0792944075',9)

SET IDENTITY_INSERT Customers OFF


-- Table: Distributors
SET IDENTITY_INSERT Distributors ON

INSERT INTO Distributors (Id,Name,Summary,AddressText, CountryId) VALUES
(1,'Loride','Zero defect delivering','1 Rieder Avenue',5),
(2,'Frova','Configurable clear-thinking delivery','47450 Forster Place',6),
(3,'Oxygen','Triple-buffered stable delivery','386 Monica Lane',8),
(4,'Aceoline oride','Transport support','5254 Drewry Drive',8),
(5,'Hydroce Anhydrous','User-friendly transport portal','332 Havey Circle',2),
(6,'Capex','Robust 24 hour transport','555 Caliangt Parkway',3),
(7,'Honey 4 Kids','Customer-focused zero defect','249 Dexter Plaza',1),
(8,'Levetiracetam','Enhanced attitude-oriented business','15 Arkansas Center',4),
(9,'Rabbitbush','Seamless interactive transport parallelism','1 Northfield Court',9),
(10,'SUSTIVA','Right-sized content-based transport methodology','96636 Fieldstone Circle',7)

SET IDENTITY_INSERT Distributors OFF


-- Table: Products
SET IDENTITY_INSERT Products ON

INSERT INTO Products(Id, Name,Price) VALUES
(1,'Octinoxate',13),
(2,'Tobacco Cake',14.39),
(3,'Musaka',15.05),
(4,'Fondu bread',3.83),
(5,'Fried Eggs bread',26.61),
(6,'Salad', 3.31),
(7,'Panetone',8.67),
(8,'Lisinopril',3.37),
(9,'Banitsa',21.77),
(10,'Caffeine passion',7)

SET IDENTITY_INSERT Products OFF


-- Table: Feedbacks
SET IDENTITY_INSERT Feedbacks ON

INSERT INTO Feedbacks(Id,Description, Rate, ProductId, CustomerId) VALUES
(1,'I did not like the product',2.04,3,3),
(2,'Meh..',4.16,5,5),
(3,'Really delicious.',5.78,7,8),
(4,'Well cooked and well served. Would like to recommend new furniture.',7.49,7,10),
(5,'First food was not ok. Second I do not like sombreros. Third the music was bad.',3.6,1,2),
(6,'One of the best things I have ever eaten. Really enjoyed it.',9.57,3,15),
(7,'The best thing for breakfast!!!',9.65,5,14),
(8,'Intermediate food.',5.26,3,2),
(9,'Hmm. It''s that good that it''s suspicious',9.92,2,1),
(10,'Ingredients are the keys',8.0,2,8),
(11,'Worst food EVER!!!!1!.',1.67,6,8)

SET IDENTITY_INSERT Feedbacks OFF


-- Table: Ingredients
SET IDENTITY_INSERT Ingredients ON

INSERT INTO Ingredients (Id, Name, Description, OriginCountryId, DistributorId) VALUES
(1,'Parsley','Curly leaf and Italian (flat-leaf) parsley are two of the more popular spices that exist.',5,4),
(2,'Peppercorn','Berries from the pepper plant. Black white and green peppercorns are three kinds processed from the this plant.',3,3),
(3,'Bay Leaf','Leaves from the evergreen bay laurel tree. Also called laurel leaf.',4,10),
(4,'Bouket','Small bundle of herbs wrapped in a cheesecloth bag or tied together and added in soups to add flavor (parsley thyme and bay leaves is the classic combination).',10,6),
(5,'Rosemary','Silver-green leaves; member of the mint family',3,2),
(6,'Ginger','The root from the ginger plant',10,1),
(7,'Nutmeg','Oval seeds from the nutmeg tree. Dark grey color. Mace is the spice obtained from the membrane of the seeds.',5,3),
(8,'Peppercorn','Berries from the pepper plant. Black white and green peppercorns are three kinds processed from the this plant.',10,2),
(9,'Cilantro','Bright-green stems and leaves from the coriander plant.',7,4),
(10,'Turmeric','Yellow-orange root of a plant related to ginger; used to flavor and color food.',8,1)

SET IDENTITY_INSERT Ingredients OFF


-- Table: ProductsIngredients
INSERT INTO ProductsIngredients (ProductId, IngredientId) VALUES
(8,6),
(3,1),
(8,2),
(10,8),
(6,5),
(7,4),
(2,4),
(2,6),
(1,7),
(8,9),
(7,8),
(10,10)
