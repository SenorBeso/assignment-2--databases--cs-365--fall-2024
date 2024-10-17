DROP DATABASE IF EXISTS passwords;

CREATE DATABASE 'passwords' DEFAULT CHARCTER SET utf8mb44 COLLATE utf8mb4_bin;

USE passwords;

SET block encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('secret password', 256));
SET @init_vector = RANDOM_BYTES(16);
