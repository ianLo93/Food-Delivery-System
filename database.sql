


CREATE TABLE restaurant(
  id INT,
  name VARCHAR(255),
  password VARCHAR(255),
  deliver_fee FLOAT,
  PRIMARY KEY (id)
);
CREATE TABLE dishes(
  id INT,
  name VARCHAR(225),
  restaurant_id INT,
  price FLOAT,
  description TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE customer(
  id INT,
  username VARCHAR(255),
  password VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE order_info(
  order_num INT,
  customer_id VARCHAR,
  restaurant_id VARCHAR,
  state VARCHAR(255),
  PRIMARY KEY(order_num)
);

CREATE TABLE order_item(
  order_num INT,
  dish_id INT,
  restaurant_id INT,
  amount INT
);

CREATE TABLE cart(
  customer_id INT,
  dish_id INT,
  restaurant_id INT,
  amount INT
);

INSERT INTO restaurant VALUES(362, 'Red and Blue', 'red_and_blue', 1.0);

INSERT INTO restaurant VALUES(811, 'Manory', 'manory', 0.5);

INSERT INTO restaurant VALUES(742, 'Lucky Cornor', 'lucky_cornor', 0.0);

INSERT INTO customer VALUES(6141, 'Weiran', 'susan0827');

INSERT INTO dishes VALUES(672562, 'cheese omelette', 811, 11.5, 'Home-made omelette with American cheese');

INSERT INTO dishes VALUES(632514, 'chicken sandwich', 811, 9.5, 'Fried chicken with fresh vegetables');

INSERT INTO dishes VALUES(245724, 'green pepper with pork belly', 362, 18, 'spicy green papper with fresh pork belly');

INSERT INTO dishes VALUES(937301, 'beef noodle', 811, 8.25, 'special beefstew with noodle made of wheat');

INSERT INTO dishes VALUES(529024, 'beef with broccoli', 742, 9.55, 'fresh beef and broccoli with chinese rice');
