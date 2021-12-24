CREATE SCHEMA `likitless` ;

CREATE TABLE `likitless`.`products_eliquid` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `size_ml` INT NOT NULL,
  `nicotine_strength_g` VARCHAR(5) NULL,
  `flavour_type` VARCHAR(45) NULL,
  `flavour_ratio_%` VARCHAR(7) NULL,
  `throat_hit` VARCHAR(7) NULL,
  `sweetness` VARCHAR(7) NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);
  
  INSERT INTO `likitless`.`products_eliquid`
(`product_id`,
`name`,
`price`,
`size_ml`,
`nicotine_strength_g`,
`flavour_type`,
`flavour_ratio_%`,
`throat_hit`,
`sweetness`
)
VALUES
(1, "Berry Theory", 12.99, 50, 3, "Blackberry, Papaya, Sour", "18%", "4/10", "7/10"),
(2, "Blue Theory", 12.99, 50, 3, "Absinth, Passion Fruit, Sweet Mint", "16%", "5/10", "4/10"),
(3, "Brain Drain", 12.99, 50, 3, "Coconat, Peanut, Chocolate", "14%", "5/10", "7.5/10"),
(4, "Fondue", 12.99, 50, 3, "Strawberry, Whipped Cream, Milk", "16%", "4/10", "7/10"),
(5, "Ice Theory", 12.99, 50, 3, "Egzotic Fruits, Ice, Energy", "15%", "5/10", "5/10"),
(6, "Loong Island", 12.99, 50, 3, "Pomegranate Liqueur, Red Berries", "15%", "5/10", "6.5/10"),
(7, "Nikotic", 12.99, 50, 3, "Tobacco, Vanilla, Brown Sugar", "18%", "7/10", "2/10"),
(8, "Petite Bar", 12.99, 50, 3, "Cinnamon, Vanilla, Biscuit", "16%", "5/10", "6/10"),
(9, "Red Buzz", 12.99, 50, 3, "Watermelon, Honeydew, Energy", "18%", "7/10", "5/10"),
(10, "Vanilla Sky", 12.99, 50, 3, "Vanilla, Peanut Butter, Caramel", "17%", "5/10", "4/10")
;


--  Table registered users
CREATE TABLE `likitless`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(15) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(8) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);
  
INSERT INTO `likitless`.`users`
(
`first_name`,
`last_name`,
`email`,
`password`
)
VALUES
("Aysel", "Isik", "baharaysel@yahoo.com", "123456");




--  Table Addreses
CREATE TABLE `likitless`.`addresses` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NOT NULL,
  `address2` VARCHAR(45) NULL,
  `district` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `post_code` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `last_update` DATE NULL,
  PRIMARY KEY (`address_id`));

INSERT INTO `likitless`.`addresses` VALUES (
1, '2 Spencer', 'Mews', 'London', 'London', 'W6 8PB', 'UK', '07728755727', NOW()); 
-- SELECT * FROM `likitless`.`addresses`;












  

