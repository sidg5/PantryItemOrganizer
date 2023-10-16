;             
CREATE USER IF NOT EXISTS "SA" SALT 'b982941737c09cee' HASH 'f5abb210c856ff660e87b79ff52b346d638403b884ab8e70aff1de7e9b402a99' ADMIN;         
CREATE SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_869C9A72_1AD8_4916_93C9_A01CA4193255" START WITH 112 BELONGS_TO_TABLE;              
CREATE CACHED TABLE "PUBLIC"."BOX"(
    "BOX_ID" INTEGER NOT NULL,
    "BOX_NAME" VARCHAR(255),
    "PHOTO_URL" VARCHAR(255),
    "SHELF_ID" INTEGER NOT NULL
);         
ALTER TABLE "PUBLIC"."BOX" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_1" PRIMARY KEY("BOX_ID");      
-- 26 +/- SELECT COUNT(*) FROM PUBLIC.BOX;    
INSERT INTO "PUBLIC"."BOX" VALUES
(1, 'Box PL2', '/assets/BoxPL2.jpg', 5),
(2, 'Box BL2', '/assets/BoxBL2.png', 5),
(3, 'Box BL3', '/assets/BoxBL3.png', 5),
(4, 'Box PL1', '/assets/BoxPL1.jpg', 5),
(5, 'Box GL3', '/assets/BoxGL3.jpg', 5),
(6, 'Box Blue', '/assets/BoxBlue.jpg', 5),
(7, 'Box GL4', '/assets/BoxGL4.jpg', 5),
(8, 'Box KSL1', '/assets/BoxKSL1.jpg', 3),
(9, 'Box ICC', '/assets/BoxICC.jpg', 5),
(10, 'Box GL2(lg)', '/assets/BoxGL2.jpg', 5),
(11, 'Box GL5', '/assets/BoxGL5.jpg', 3),
(12, 'Box BL1', '/assets/BoxBL1.png', 3),
(13, 'Box RL1', '/assets/BoxRL1.jpg', 4),
(14, 'Box PP2', '/assets/BoxPP2.jpg', 4),
(15, 'Box PL3', '/assets/BoxPL3.jpg', 4),
(16, 'Box PP1', '/assets/BoxPP1.jpg', 3),
(17, 'Box YL1', '/assets/BoxYL1.png', 5),
(18, 'Box GL1 sm', '/assets/BoxGL1.jpg', 4),
(19, 'Box WL1', '/assets/BoxWL1.jpg', 4),
(20, 'Box BrL1 sm', '/assets/BoxBrL1.jpg', 4),
(21, 'Box BL4', '/assets/BoxBL4.jpg', 3),
(22, 'Box BL5', '/assets/BoxBL5.jpg', 3),
(23, 'Box HmN1', '/assets/BoxHmN1.jpg', 3),
(24, 'Box TL1', '/assets/BoxTL1.jpg', 3),
(25, 'Box YL2', '/assets/BoxYL2.jpg', 3),
(26, 'Box BL2', '/assets/BoxBL2.jpg', 3);      
CREATE CACHED TABLE "PUBLIC"."ITEM"(
    "ITEM_ID" INTEGER DEFAULT NEXT VALUE FOR "PUBLIC"."SYSTEM_SEQUENCE_869C9A72_1AD8_4916_93C9_A01CA4193255" NOT NULL NULL_TO_DEFAULT SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_869C9A72_1AD8_4916_93C9_A01CA4193255",
    "ITEM_CATEGORY" VARCHAR(255),
    "ITEM_IMG" VARCHAR(255),
    "ITEM_NAME" VARCHAR(255),
    "BOX_ID" INTEGER,
    "SHELF_ID" INTEGER NOT NULL
);             
ALTER TABLE "PUBLIC"."ITEM" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_2" PRIMARY KEY("ITEM_ID");    
-- 103 +/- SELECT COUNT(*) FROM PUBLIC.ITEM;  
INSERT INTO "PUBLIC"."ITEM" VALUES
(6, 'BREAKFAST', NULL, 'Maggi Noodle 70g', NULL, 5),
(7, 'SNACKS', NULL, 'Nachos Red', NULL, 4),
(8, 'SNACKS', NULL, 'Nachos Red', NULL, 4),
(9, 'SNACKS', NULL, 'Nachos Green', NULL, 4),
(10, 'SNACKS', NULL, 'Nachos Green', NULL, 4),
(11, 'BREAKFAST', NULL, 'Poha 500g', NULL, 5),
(12, 'BREAKFAST', NULL, 'Poha 500g', NULL, 5),
(13, 'OILS', NULL, 'Mustard Oil 1L', NULL, 5),
(14, 'OILS', NULL, 'Mustard Oil 1L', NULL, 5),
(15, 'OILS', NULL, 'Mustard Oil 1L', NULL, 5),
(16, 'OILS', NULL, 'Groundnut Oil 1L', NULL, 5),
(17, 'OILS', NULL, 'Refined Oil', NULL, 5),
(18, 'BREAKFAST', NULL, 'Noodles', NULL, 5),
(19, 'BREAKFAST', NULL, 'Noodles', NULL, 5),
(20, 'FLOUR', NULL, 'Rice Flour 100g', 1, 5),
(21, 'FLOUR', NULL, 'Jau Flour 500g', 1, 5),
(22, 'FLOUR', NULL, 'Bajra Flour 500g', 1, 5),
(23, 'BREAKFAST', NULL, 'Muesli+', 3, 5),
(24, 'BREAKFAST', NULL, 'Corn Flakes sm', 3, 5),
(25, 'BREAKFAST', NULL, 'Choco Fills', 3, 5),
(26, 'BREAKFAST', NULL, 'Vermicelli Aata', 9, 5),
(27, 'GRAINS', NULL, 'Peanuts', 6, 5),
(28, 'BREAKFAST', NULL, 'Pazzta', NULL, 5),
(29, 'BREAKFAST', NULL, 'Saffola Oats 1kg', NULL, 5),
(30, 'OTHER', NULL, 'White Papad', NULL, 5),
(31, 'OTHER', NULL, 'Color Papad', NULL, 5),
(32, 'OTHER', NULL, 'Sabudana Papad', 2, 5),
(33, 'OTHER', NULL, 'Moong Spl Papad', 12, 5),
(34, 'BREAKFAST', NULL, 'Vermicelli', 4, 5),
(35, 'PULSES', NULL, 'Chana Dal', 5, 5),
(36, 'SPICES', NULL, 'Maggi Masala', 10, 5),
(37, 'SPICES', NULL, 'Sambhar Powder', 10, 5),
(38, 'SPICES', NULL, 'Chhole Masala', 10, 5),
(39, 'SPICES', NULL, 'Kasuri Methi', 10, 5),
(40, 'SPICES', NULL, 'Jal Jeera Masala', 10, 5),
(41, 'SPICES', NULL, 'Kalonji', 10, 5),
(42, 'SPICES', NULL, 'Mustard Seeds (Sarson)', 10, 5),
(43, 'OTHER', NULL, 'Masala Boondi', 17, 5),
(44, 'FLOUR', NULL, 'Besan 500g', 8, 5),
(45, 'SPICES', NULL, 'Chilli Bedgi', 7, 5),
(46, 'SPICES', NULL, 'Chilli Guntur', 7, 5),
(47, 'GRAINS', NULL, 'Idli Rawa', NULL, 5),
(48, 'SNACKS', NULL, 'Chana Jor Garam', 15, 4),
(49, 'SNACKS', NULL, 'Aaloo Bhujia', 15, 4),
(50, 'SNACKS', NULL, 'Moong Dal Namkeen', 15, 4),
(51, 'SNACKS', NULL, 'Bhelpuri Mixture', 15, 4),
(52, 'SNACKS', NULL, 'Masala Fen', 13, 4),
(53, 'SNACKS', NULL, 'Jim Jam', 12, 4),
(54, 'SNACKS', NULL, 'Good Day Cashew', 12, 4),
(55, 'SNACKS', NULL, 'Oreo Biscuit', 12, 4),
(56, 'SNACKS', NULL, '50-50 Masala Chaska', 12, 4),
(57, 'SNACKS', NULL, 'Duke Cream Biscuit', 12, 4),
(58, 'SAUCES', NULL, 'Kissan Tomato Ketchup', 2, 4),
(59, 'SAUCES', NULL, 'Kissan Sweet Spicy Ketchup', 2, 4),
(60, 'OTHER', NULL, 'Dabur Honey Squeezy', 2, 4),
(61, 'OTHER', NULL, 'Kashmiri Honey', 2, 4),
(62, 'OTHER', NULL, 'NCTR Cinnamon Honey', 2, 4),
(63, 'SAUCES', NULL, 'Hellmann''s Mayonnaise', 2, 4),
(67, 'SNACKS', NULL, 'Murku Namkeen', 18, 4),
(68, 'SNACKS', NULL, 'Good Day Pista Badam', NULL, 4),
(69, 'SNACKS', NULL, 'Parle-G Biscuit', NULL, 4),
(70, 'SNACKS', NULL, 'Patanjali Doodh Biscuit', NULL, 4),
(71, 'SNACKS', NULL, 'Cremica Butter Cookies', NULL, 4),
(72, 'SNACKS', NULL, 'Good Day Cashew', 19, 4),
(73, 'SNACKS', NULL, 'Good Day Cashew', 20, 4),
(74, 'SNACKS', NULL, 'South Indian Mixture Namkeen', 12, 4),
(75, 'SNACKS', NULL, 'Kurkure Puffcorn', 2, 4),
(76, 'SNACKS', NULL, 'Ratlami Sev', 2, 4),
(77, 'SNACKS', NULL, 'Lays Classic Salted', 2, 4),
(78, 'SNACKS', NULL, 'Cripsy Crunchy Peanuts', 2, 4),
(79, 'SNACKS', NULL, 'Banana Chips', 2, 4),
(80, 'SNACKS', NULL, 'Marie Gold Biscuit', 2, 4),
(81, 'SNACKS', NULL, 'Little Hearts Biscuit', NULL, 4),
(82, 'SNACKS', NULL, 'McVities Digestive Biscuit', NULL, 4),
(83, 'OTHER', NULL, 'Dates', 21, 3),
(84, 'OTHER', NULL, 'Pooja Mishri', 21, 3),
(85, 'OTHER', NULL, 'Khand Sugar', 21, 3),
(86, 'OTHER', NULL, 'Fig(Anjeer)', 21, 3),
(87, 'GRAINS', NULL, 'Soy Bean Wadi', 11, 3),
(88, 'OTHER', NULL, 'Cashew (Kaju)', 22, 3),
(89, 'OTHER', NULL, 'Almond (Badam)', 24, 3),
(90, 'BREAKFAST', NULL, 'Pan Cake Mix', 16, 3),
(91, 'SPICES', NULL, 'Bay Leaf', 8, 3),
(92, 'GRAINS', NULL, 'Pop Corn', 23, 3),
(93, 'OTHER', NULL, 'Wagh Bakri Tea', NULL, 3),
(94, 'OTHER', NULL, 'Taj Mahal Tea', NULL, 3);   
INSERT INTO "PUBLIC"."ITEM" VALUES
(95, 'BEVERAGES', NULL, 'Sleepy Owl Coffee', 25, 3),
(96, 'BEVERAGES', NULL, 'Sleepy Owl Coffee', 25, 3),
(97, 'BEVERAGES', NULL, 'Hatti Kaapi Filter Coffee', 25, 3),
(98, 'BEVERAGES', NULL, 'Bru Instant Coffee', 25, 3),
(99, 'OTHER', NULL, 'Golden Raisins (Kishmish)', NULL, 3),
(100, 'OTHER', NULL, 'Peanut butter', NULL, 3),
(101, 'OTHER', NULL, 'Flax seeds', NULL, 3),
(102, 'OTHER', NULL, 'Imli laddoo', NULL, 3),
(103, 'OTHER', NULL, 'Walnut', NULL, 3),
(104, 'BREAKFAST', NULL, 'Nutella', NULL, 3),
(105, 'OTHER', NULL, 'Hajmola', NULL, 3),
(106, 'GRAINS', NULL, 'Kabuli channa 500g', NULL, 3),
(107, 'OTHER', NULL, 'Masala Boondi Packet', 26, 3),
(108, 'SNACKS', NULL, 'Roasted Peanuts', 14, 4),
(109, 'SNACKS', NULL, 'Kaju Mixture Namkeen', 2, 4),
(110, 'OTHER', NULL, 'Knorr Tomato Soup', NULL, 3),
(111, 'OTHER', NULL, 'Knorr Tomato Soup', NULL, 3);              
CREATE CACHED TABLE "PUBLIC"."SHELF"(
    "SHELF_ID" INTEGER NOT NULL,
    "SHELF_NAME" VARCHAR(255)
);    
ALTER TABLE "PUBLIC"."SHELF" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_4" PRIMARY KEY("SHELF_ID");  
-- 5 +/- SELECT COUNT(*) FROM PUBLIC.SHELF;   
INSERT INTO "PUBLIC"."SHELF" VALUES
(1, 'Pantry Shelf 1'),
(2, 'Pantry Shelf 2'),
(3, 'Pantry Shelf 3'),
(4, 'Pantry Shelf 4'),
(5, 'Pantry Shelf 5');   
CREATE CACHED TABLE "PUBLIC"."STUDENT"(
    "ID" INTEGER NOT NULL,
    "AGE" INTEGER,
    "EMAIL" VARCHAR(255),
    "NAME" VARCHAR(255)
);               
ALTER TABLE "PUBLIC"."STUDENT" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_B" PRIMARY KEY("ID");      
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.STUDENT; 
ALTER TABLE "PUBLIC"."BOX" ADD CONSTRAINT "PUBLIC"."FK2AN781FWYKV21TSBCP60C6311" FOREIGN KEY("SHELF_ID") REFERENCES "PUBLIC"."SHELF"("SHELF_ID") NOCHECK;     
ALTER TABLE "PUBLIC"."ITEM" ADD CONSTRAINT "PUBLIC"."FK2EU1B1VIW48CNC2EI5PRORDQ5" FOREIGN KEY("SHELF_ID") REFERENCES "PUBLIC"."SHELF"("SHELF_ID") NOCHECK;    
ALTER TABLE "PUBLIC"."ITEM" ADD CONSTRAINT "PUBLIC"."FKOPXUIAAV40QV8RS7CK0PIDWX1" FOREIGN KEY("BOX_ID") REFERENCES "PUBLIC"."BOX"("BOX_ID") NOCHECK;          