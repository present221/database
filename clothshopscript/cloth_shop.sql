CREATE DATABASE if not exists cloth_shop;

use cloth_shop;

CREATE TABLE brand (
    brandid    INTEGER NOT NULL,
    brandname  VARCHAR(20) NOT NULL
);

ALTER TABLE brand ADD CONSTRAINT brand_pk PRIMARY KEY ( brandid );

CREATE TABLE color (
    colorcode  CHAR(7) NOT NULL,
    colorname  VARCHAR(20) NOT NULL
);

ALTER TABLE color ADD CONSTRAINT color_pk PRIMARY KEY ( colorcode );

CREATE TABLE product (
    productid           INTEGER NOT NULL,
    productname         VARCHAR(200) NOT NULL,
    productdescription  VARCHAR(100) NOT NULL,
    price               FLOAT(6, 2) NOT NULL,
    image               VARCHAR(250) NOT NULL,
    manufacturedate     DATE NOT NULL,
    brandid             INTEGER NOT NULL
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( productid );

CREATE TABLE spec (
    colorcode  CHAR(7) NOT NULL,
    productid  INTEGER NOT NULL
);

ALTER TABLE spec ADD CONSTRAINT spec_pk PRIMARY KEY ( colorcode,
                                                      productid );

ALTER TABLE product
    ADD CONSTRAINT product_brand_fk FOREIGN KEY ( brandid )
        REFERENCES brand ( brandid );

ALTER TABLE spec
    ADD CONSTRAINT spec_color_fk FOREIGN KEY ( colorcode )
        REFERENCES color ( colorcode );

ALTER TABLE spec
    ADD CONSTRAINT spec_product_fk FOREIGN KEY ( productid )
        REFERENCES product ( productid );
        

-- -------------------------------
-- insert query
-- -------------------------------
Insert into `brand`(`brandid`,`brandname`) values
('1','uniqlo'),
('2','h&m'),
('3','zara'),
('4','ccoo');

Insert into `color`(`colorcode`,`colorname`) values
('#ffffff', 'white'),
('#000000', 'black'),
('#598baf','blue'),
('#2c3539', 'navy'),
('#565051','gray'),
('#b3672b','brown'),
('#fc6600', 'orange'),
('#ffe128', 'yellow'),
('#ffe5b4', 'cream'),
('#d30000', 'red'),
('#9dc183', 'green'),
('#af69ee', 'purple'),
('#fdb9c8', 'pink'),
('#dac6a3', 'beige'); 

Insert into `product`(`productid`,`productname`,`productdescription`,`price`,`image`,`manufacturedate`,`brandid`) values
('1','Uniqlo U Short', 'Oversized T-shirt with a more elevated feel. Enjoy playing with the sophisticated, yet casual look.'
,'590.00','sleev.jpg', '2021-04-20','1'),
('2','JW ANDERSON Flower','On-trend relaxed fit. Floral embroidery adds a vintage touch.','790.00','flower.jpg', '2021-04-20','1'),
('3','Tie Dye Smile Shirt', 'Oversized Logo-Print Tie-Dyed Cotton-Jersey T-Shirt','490.00','tiedry.jpg', '2021-03-12','4'),
('4','Printed T-shirt', 'Straight-cut T-shirt in soft, printed cotton jersey with dropped shoulders. ','499.00','printed.jpg', '2021-03-08','2');

Insert into spec(colorcode,productid) values
('#ffffff', '1'),
('#000000', '1'),
('#598baf','1'),
('#2c3539', '1'),
('#565051','1'),
('#fc6600', '1'),
('#ffe128', '1'),
('#dac6a3', '1'),
('#9dc183', '1'),
('#ffffff','2'),
('#000000','2'),
('#9dc183','2'),
('#598baf','2'),
('#d30000','2'),
('#598baf','3'),
('#af69ee','3'),
('#fdb9c8','3'),
('#ffe128','3'),
('#ffffff', '4'),
('#000000', '4'),
('#565051','4'),
('#fc6600', '4'),
('#ffe128', '4'),
('#dac6a3', '4'),
('#d30000', '4'),
('#9dc183', '4'),
('#af69ee', '4'),
('#fdb9c8', '4'); 

-- ------------------
-- create user
-- ------------------
DROP USER IF EXISTS 'clothshop1'@'%';

create user 'clothshop1'@'%' identified by 'ClothShop069096126';
GRANT select,update,delete,create,insert on cloth_shop.product TO 'clothshop1'@'%';
GRANT select,update,delete,insert on cloth_shop.spec TO 'clothshop1'@'%';
GRANT select on cloth_shop.brand TO 'clothshop1'@'%';
GRANT select on cloth_shop.color TO 'clothshop1'@'%';

FLUSH PRIVILEGES;







