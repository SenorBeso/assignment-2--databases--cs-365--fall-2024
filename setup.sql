DROP DATABASE IF EXISTS passwords;

CREATE DATABASE 'passwords' DEFAULT CHARCTER SET utf8mb44 COLLATE utf8mb4_bin;

USE passwords;

SET block encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('secret password', 256));
SET @init_vector = RANDOM_BYTES(16);

CREATE TABLE IF NOT EXISTS user (
  id          SMALLINT        NOT NULL AUTO_INCREMENT,
  email       VARCHAR(64)     NOT NULL,
  first_name  VARCHAR(64)     NOT NULL,
  last_name   VARCHAR(64)     NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS website (
  id          SMALLINT        NOT NULL AUTO_INCREMENT,
  website     VARCHAR(64)     NOT NULL,
  site_url    VARCHAR(256)    NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS account_info (
  id                  SMALLINT        NOT NULL AUTO_INCREMENT,
  account_username    VARCHAR(64)     NOT NULL,
  account_password    VARCHAR(128)    NOT NULL,
  comment             VARCHAR(1024)   NOT NULL,
  account_creation    DATETIME        NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO user
(0,"aidenkiss@gmail.com", "Aiden", "Kiss"),
(0,"aidenkiss@gmail.com", "Aiden", "Kiss"),
(0,"aidenkiss@gmail.com", "Aiden", "Kiss"),
(0,"aidenkiss@gmail.com", "Aiden", "Kiss"),
(0,"aidenkiss@gmail.com", "Aiden", "Kiss"),
(0,"aidenkiss@gmail.com", "Aiden", "Kiss"),
(0,"aidenkiss@gmail.com", "Aiden", "Kiss"),
(0,"aidenkiss@gmail.com", "Aiden", "Kiss"),
(0,"aidenkiss@gmail.com", "Aiden", "Kiss"),
(0,"kiss@hartford.edu", "Aiden", "Kiss");

INSERT INTO website
(0,"Google", "https://google.com"),
(0,"Steam","https://store.steampowered.com"),
(0,"Spotify","https://open.spotify.com"),
(0,"Microsoft","https://www.microsoft.com/en-us/"),
(0,"LinkedIn","https://www.linkedin.com"),
(0,"Key Bank","https://www.key.com/personal/index.html"),
(0,"Snapchat","https://www.snapchat.com"),
(0,"Instagram","https://www.instagram.com"),
(0,"Github",:"https://www.instagram.com"),
(0,"UHart Blackboard","https://blackboard.hartford.edu/ultra/course");

INSERT INTO account_info
(0,"aidenk7",AES_ENCRYPT("G00Gl3", @key_str, @init_vector), "My School Account", '2008-07-24 0:00:00'),
(0,"kissAiden",AES_ENCRYPT("RGBisOverated", @key_str, @init_vector), "My Steam gaming account", '2010-05-24 0:00:00'),
(0,"aidenk7",AES_ENCRYPT("metalHead4Life", @key_str, @init_vector), "My music account", '2017-01-12 0:00:00'),
(0,"AK77",AES_ENCRYPT("imswitchingtolinux", @key_str, @init_vector), "My microsoft account", '2008-12-12 0:00:00'),
(0,"aidenk7",AES_ENCRYPT("iwannajob", @key_str, @init_vector), "My LinkedIn profile", '2023-11-10 1:00:00'),
(0,"AidenKiss",AES_ENCRYPT("$money$", @key_str, @init_vector), "My Bank Account", '2016-10-04 4:00:00'),
(0,"aidenk7",AES_ENCRYPT("idontusethisapp", @key_str, @init_vector), "My Snap Account", '2020-07-30 0:00:00'),
(0,"SenorBeso",AES_ENCRYPT("code", @key_str, @init_vector), "My Github Account", '2022-10-14 0:00:00'),
(0,"aidenk7",AES_ENCRYPT("aidenUHART", @key_str, @init_vector), "My School Account", '2022-08-24 0:00:00');
