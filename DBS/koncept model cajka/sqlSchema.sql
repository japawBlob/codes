DROP TABLE if exists preparedBy, contains, "order", employee, suppliedBy, supplier, tea, meal, product, promo, customer, loyaltyCard;

CREATE TABLE loyaltyCard (
    ID INTEGER PRIMARY KEY,
    discount INTEGER NOT NULL
);

CREATE TABLE customer (
    email VARCHAR(100) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    card INTEGER NOT NULL CONSTRAINT customer_fk_card REFERENCES loyaltyCard (ID),
    CONSTRAINT customer_ch_email CHECK (email LIKE '_%@_%.__%')
);

CREATE TABLE promo (
    newComer INTEGER PRIMARY KEY CONSTRAINT promo_fk_newComer REFERENCES loyaltyCard(ID),
    promoter INTEGER NOT NULL CONSTRAINT promo_fk_promoter REFERENCES loyaltyCard(ID)
);

CREATE TABLE product (
    ID INTEGER PRIMARY KEY,
    price INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE meal (
    ID INTEGER PRIMARY KEY CONSTRAINT meal_fk_ID REFERENCES product(ID),
    allergens VARCHAR(50)
);

CREATE TABLE tea (
    ID INTEGER PRIMARY KEY CONSTRAINT tea_fk_ID REFERENCES product(ID),
    numberOfInfusions SMALLINT NOT NULL,
    countryOfOrigin VARCHAR(50) NOT NULL,
    type VARCHAR(50)
);

CREATE TABLE supplier (
    IC CHAR(8) PRIMARY KEY,
    DIC VARCHAR(20) UNIQUE,
    street VARCHAR(100) NOT NULL,
    town VARCHAR(100) NOT NULL,
    postalCode INTEGER NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE suppliedBy (
    product INTEGER NOT NULL,
    supplier CHAR(8) NOT NULL,
    PRIMARY KEY (product, supplier),
    CONSTRAINT suppliedBy_fk_product FOREIGN KEY (product) REFERENCES product(ID),
    CONSTRAINT suppliedBy_fk_supplier FOREIGN KEY (supplier) REFERENCES supplier(IC)
);

CREATE TABLE employee (
    identityCard VARCHAR(20) PRIMARY KEY
);

CREATE TABLE "order" (
    card INTEGER NOT NULL,
    timeOfOrder TIMESTAMP NOT NULL,
    product INTEGER NOT NULL,
    PRIMARY KEY (card, timeOfOrder, product),
    CONSTRAINT order_fk_product FOREIGN KEY (product) REFERENCES product(ID),
    CONSTRAINT order_fk_card FOREIGN KEY (card) REFERENCES loyaltyCard(ID)
);

CREATE TABLE contains (
    card INTEGER NOT NULL,
    timeOfOrder TIMESTAMP NOT NULL,
    product INTEGER NOT NULL,
    price INTEGER NOT NULL,
    PRIMARY KEY (card, timeOfOrder, product),
    CONSTRAINT contains_fk_card FOREIGN KEY (card) REFERENCES loyaltyCard(ID),
    CONSTRAINT contains_fk_timeOfOrder FOREIGN KEY (timeOfOrder) REFERENCES "order"(timeOfOrder),
    CONSTRAINT contains_fk_product FOREIGN KEY (product, price) REFERENCES product(ID, price)
);

CREATE TABLE preparedBy (
    employee VARCHAR(20) NOT NULL,
    card INTEGER NOT NULL,
    timeOfOrder TIMESTAMP NOT NULL,
    product INTEGER NOT NULL,
    PRIMARY KEY (employee, card, timeOfOrder, product),
    CONSTRAINT preparedBy_fk_employee FOREIGN KEY (employee) REFERENCES employee(identityCard),
    CONSTRAINT preparedBy_fk_card FOREIGN KEY (card) REFERENCES loyaltyCard(ID),
    CONSTRAINT preparedBy_fk_timeOfOrder FOREIGN KEY (timeOfOrder) REFERENCES "order"(timeOfOrder),
    CONSTRAINT preparedBy_fk_product FOREIGN KEY (product) REFERENCES product(ID)
);


