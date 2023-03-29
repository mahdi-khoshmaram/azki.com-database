
-- Create DATABASE
CREATE DATABASE Azki;
-- Entites


CREATE TABLE user (
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    PhoneNumber VARCHAR(10) NOT NULL,
    Fname VARCHAR(16) NOT NULL,
    Lname VARCHAR(32) NOT NULL,
    Pass VARCHAR(32) NOT NULL,
    Wallet BIGINT DEFAULT 0,
    UsedInvitation_code VARCHAR(20) NOT NULL,
    National_number VARCHAR(10) NOT NULL,
    Email VARCHAR(32) ,
    Job VARCHAR(32) ,
    City VARCHAR(32),
    Province VARCHAR(32),
    Address VARCHAR(256),
    Birthday DATE,
    
    Unique(PhoneNumber, National_number),
    PRIMARY KEY (Id)
);


CREATE TABLE customer_type (
    Customer_type_code VARCHAR(1) NOT NULL,
    Customer_type_name VARCHAR(32) NOT NULL,

    PRIMARY KEY (Customer_type_code),
    Unique (Customer_type_name)
);

INSERT INTO customer_type(Customer_type_code, Customer_type_name)
VALUES 
    ("L","Life insurance customer"),
    ("H", "Health insurance customer"),
    ("B", "Business insurance customer"),
    ("R", "Residental insurance customer");

CREATE TABLE customer (
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Customer_type_code VARCHAR(1) NOT NULL,
    National_number VARCHAR(10),
    Home_phone_number VARCHAR(10),
    Address VARCHAR(256) ,
    Dob DATE ,
    Post_code VARCHAR(10) ,   

    UNIQUE(National_number),
    PRIMARY KEY (Id),
    
    FOREIGN KEY (Customer_type_code) REFERENCES customer_type(Customer_type_code)
);


CREATE TABLE `business_customer`(
    Customer_id BIGINT(255) NOT NULL PRIMARY KEY,
    Full_name VARCHAR(64) NOT NULL,
    Phone_number VARCHAR(10) NOT NULL,
    Fire_or_earthquake VARCHAR(1) NOT NULL,
    Business_license_number VARCHAR(20) NOT NULL,
    Residence_status VARCHAR(1) NOT NULL,
    Possession_status VARCHAR(1) NOT NULL,
    Structure_type VARCHAR(1) NOT NULL,
    Building_age VARCHAR(2) NOT NULL,
    Warming_system VARCHAR(1) NOT NULL,
    Area_building VARCHAR(5) NOT NULL,

    FOREIGN KEY (Customer_id) REFERENCES customer(Id)

);

CREATE TABLE `residental_customer` (
    Customer_id BIGINT(255) NOT NULL PRIMARY KEY, 
    FullName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(10) NOT NULL,
    Fire_or_earthquake VARCHAR(1) NOT NULL,
    House_number VARCHAR(10) NOT NULL,
    Number_of_floors VARCHAR(2) NOT NULL DEFAULT "01",
    Floor_number VARCHAR(2) NOT NULL,
    Unit VARCHAR(1) NOT NULL,

    FOREIGN KEY (Customer_id) REFERENCES customer(Id)

    
);

CREATE TABLE `life_customer` (
    Customer_id BIGINT(255) NOT NULL PRIMARY KEY, 
    Full_name VARCHAR(50) NOT NULL,
    Identity_number VARCHAR(10) NOT NULL,
    Phone_number VARCHAR(10) NOT NULL,
    Job VARCHAR(32) NOT NULL,
    Martial_status BOOLEAN NOT NULL,

    Birth_place VARCHAR(30) NOT NULL,
    Issuance_place VARCHAR(30) NOT NULL,
    Father_name VARCHAR(15) NOT NULL,
    Weight VARCHAR(3) NOT NULL,
    Height VARCHAR(3) NOT NULL,

    Address_to_send VARCHAR(256) NOT NULL,
    National_image VARCHAR(256) NOT NULL,
    Identity_image VARCHAR(256) NOT NULL,

    UNIQUE(Identity_number),
    FOREIGN KEY (Customer_id) REFERENCES customer(Id)


);

CREATE TABLE `health_customer` (
    Customer_id BIGINT(255) NOT NULL PRIMARY KEY, 
    Full_name VARCHAR(50) NOT NULL,
    Phone_number VARCHAR(10) NOT NULL,
    Group_id VARCHAR(64) NOT NULL,

    Receive_phone_number VARCHAR(10) NOT NULL,
    Receive_house_phone_number VARCHAR(10) NOT NULL,
    Receive_address VARCHAR(256) NOT NULL,
    Receive_post_code VARCHAR(10) NOT NULL,
    Receive_province VARCHAR(32) NOT NULL,
    Receive_city VARCHAR(32) NOT NULL,
    Receive_cityzone VARCHAR(2) NOT NULL,
    Receive_time BIGINT(255) NOT NULL,

    FOREIGN KEY (Customer_id) REFERENCES customer(Id)

);

CREATE TABLE seller (
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Fname VARCHAR(16) NOT NULL,
    Lname VARCHAR(32) NOT NULL,
    Phone_number VARCHAR(10) NOT NULL,
    National_number VARCHAR(10) NOT NULL,
    Pass VARCHAR(32) NOT NULL,
    Name_cob VARCHAR(32) NOT NULL,
    Company_or_broker VARCHAR(1) NOT NULL,
    Branch_code VARCHAR(32) NOT NULL,
    Address VARCHAR(256) NOT NULL,
    Province VARCHAR(32) NOT NULL,
    City VARCHAR(32) NOT NULL,
    Post_code VARCHAR(10) NOT NULL,
    Shaba_code VARCHAR(26) NOT NULL,
    Bank_account_code VARCHAR(16),
    National_image VARCHAR(256) NOT NULL,
    Business_license_image VARCHAR(256) NOT NULL,

    UNIQUE(Phone_number, National_number),
    PRIMARY KEY (Id)
);

CREATE TABLE insurance (
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,

    PRIMARY KEY (Id)
);

CREATE TABLE life_insurance (
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Duration VARCHAR(2) NOT NULL,
    Age_range VARCHAR(1) NOT NULL,
    Purpose VARCHAR(1) NOT NULL,
    Payment_method VARCHAR(1) NOT NULL,

    PRIMARY KEY (Id)
);

-- family and individual merged
CREATE TABLE health_insurance(
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Primary_insurance VARCHAR(32) NOT NULL,
    Age_range VARCHAR(1) NOT NULL,
    Relation_to_householder VARCHAR(1) DEFAULT "0",

    PRIMARY KEY (Id)
);

CREATE TABLE business_insurance(
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Fire_or_earthquake VARCHAR(1) NOT NULL,
    Job VARCHAR(32) NOT NULL,
    Maximum_payment VARCHAR(8) NOT NULL,

    PRIMARY KEY (Id)
);

CREATE TABLE residental_insurance(
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Fire_or_earthquake VARCHAR(1) NOT NULL,
    Property_type VARCHAR(1) NOT NULL,
    Structure_type VARCHAR(1) NOT NULL,
    Province VARCHAR(32) NOT NULL,
    City VARCHAR(32) NOT NULL,
    Floor_number VARCHAR(2) NOT NULL DEFAULT "01",
    Building_age VARCHAR(2) NOT NULL,
    Meterage VARCHAR(4) NOT NULL,
    Cost_m2 VARCHAR(3) NOT NULL,
    Home_appliance_value VARCHAR(4) NOT NULL,

    PRIMARY KEY (Id)
);


-- OK



CREATE TABLE coverage_case (
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Cost_of_birthgiving VARCHAR(8) NOT NULL,
    Specialized_surgery VARCHAR(8) NOT NULL,
    Visit_medicine VARCHAR(8) NOT NULL,
    Dental_expenses VARCHAR(8) NOT NULL,
    Infertility VARCHAR(8) NOT NULL,
    Hospitalization_fee VARCHAR(8) NOT NULL,
    Refractive_defects_eyes VARCHAR(8) NOT NULL,
    Ultrasound_scans VARCHAR(8) NOT NULL,
    Hearing_aids VARCHAR(8) NOT NULL,
    EEG VARCHAR(8) NOT NULL,
    ambulence_fee VARCHAR(8) NOT NULL,
    fraction_dislocation VARCHAR(8) NOT NULL,
    laboratory_fee VARCHAR(8) NOT NULL,

    PRIMARY KEY (Id)
);

CREATE TABLE caring_benefit(
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Specific_disease VARCHAR(16) NOT NULL,
    Accidental_death_penalty VARCHAR(16) NOT NULL,
    Normal_death_penalty VARCHAR(16) NOT NULL,
    Accidental_disability VARCHAR(16) NOT NULL,
    Accidental_medical_expenses VARCHAR(16) NOT NULL,

    PRIMARY KEY (Id)
);


CREATE TABLE financial_benefit (
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Redemption_10y VARCHAR(16) NOT NULL,
    Redemption_20y VARCHAR(16) NOT NULL,
    Redemption_30y VARCHAR(16) NOT NULL,
    Loan_after VARCHAR(16) NOT NULL,

    PRIMARY KEY (Id)
);

CREATE TABLE invitation_code (
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Remained_invatations INT(255),
    Code VARCHAR(32) NOT NULL,
    Unique(Code),
    PRIMARY KEY (Id)
);

CREATE TABLE discount_code(
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Expiration DATE NOT NULL,
    Code VARCHAR(32) NOT NULL,
    Unique(Code),
    PRIMARY KEY (Id)
);

-- End of Entities

-- Relations


CREATE TABLE User_Invitation (
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    User_id BIGINT(255) NOT NULL,
    Invitation_id BIGINT(255) NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (User_id) REFERENCES user(Id),
    FOREIGN KEY (Invitation_id) REFERENCES invitation_code(Id)
);

CREATE TABLE discount_user(
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    User_id BIGINT(255) NOT NULL,
    Discount_id BIGINT(255) NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (User_id) REFERENCES user(Id),
    FOREIGN KEY (Discount_id) REFERENCES discount_code(Id)

);

CREATE TABLE user_customer (
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    User_id BIGINT(255) NOT NULL,
    Customer_id BIGINT(255) NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (User_id) REFERENCES user(Id),
    FOREIGN KEY (Customer_id) REFERENCES customer(Id)

);

CREATE TABLE `order` (
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Customer_id BIGINT(255) NOT NULL,
    Insurance_id BIGINT(255) NOT NULL,
    Time TIMESTAMP(2) NOT NULL,
    Tracking_code VARCHAR(32) NOT NULL,
    Cost VARCHAR(16) NOT NULL,
    status VARCHAR(1) NOT NULL,
    Explanation VARCHAR(256),
    email_address VARCHAR(32),

    Unique(Tracking_code),
    PRIMARY KEY (Id),
    FOREIGN KEY (Customer_id) REFERENCES customer(Id),
    FOREIGN KEY (Insurance_id) REFERENCES insurance(Id)
);


CREATE TABLE Sell(
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Seller_id BIGINT(255) NOT NULL,
    Insurance_id BIGINT(255) NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (Seller_id) REFERENCES seller(Id),
    FOREIGN KEY (Insurance_id) REFERENCES insurance(Id)
);

CREATE TABLE health_coverage(
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Health_id BIGINT(255) NOT NULL,
    Coverage_id BIGINT(255) NOT NULL,

    Coverage_percent VARCHAR(3) NOT NULL,
    Pregnancy_duration VARCHAR(2) NOT NULL,
    Chronic_disease_time VARCHAR(3) NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (Health_id) REFERENCES health_insurance(Id),
    FOREIGN KEY (Coverage_id) REFERENCES coverage_case(Id)

);

CREATE TABLE caring_life(
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Life_id BIGINT(255) NOT NULL,
    Caring_id BIGINT(255) NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (Life_id) REFERENCES life_insurance(Id),
    FOREIGN KEY (Caring_id) REFERENCES caring_benefit(Id)

);

CREATE TABLE financial_life(
    Id BIGINT(255) NOT NULL AUTO_INCREMENT,
    Life_id BIGINT(255) NOT NULL,
    Financial_id BIGINT(255) NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (Life_id) REFERENCES life_insurance(Id),
    FOREIGN KEY (Financial_id) REFERENCES financial_benefit(Id)

);

-- End of Relations


