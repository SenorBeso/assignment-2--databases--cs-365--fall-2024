
--command 1 - create a new entry (the NOW sets timestamp to current time)
INSERT INTO user
VALUES
  (0,"jkiss@gmail.com", "Jonas", "Kiss");
INSERT INTO website
VALUES
  (0,"Sweetwater", "https://www.sweetwater.com");
INSERT INTO account_info
VALUES
  (0,"jonasKissGuitars", AES_ENCRYPT("guitarHero", @key_str, @init_vector), "His Music Store Account", NOW());


--command 2 - get password associated with one of the urls
SELECT CAST(AES_DECRYPT(account_info.account_password, @key_str, @init_vector) AS CHAR) AS decrypted_password
FROM account_info
JOIN website
ON account_info.id = website.id
WHERE website.site_url = "https://www.microsoft.com/en-us/";

--command 3 - get all password related data with urls with https (all of mine are https so theres more than 2)
SELECT
  website.website AS website_name,
  website.site_url,
  account_info.account_username,
  CAST(AES_DECRYPT(account_info.account_password, @key_str, @init_vector) AS CHAR) AS decrypted_password,
  account_info.comment,
  account_info.account_creation
FROM account_info
JOIN website
ON account_info.id = website.id
WHERE website.site_url LIKE '%https%';

--command 4 - change a url, matching password
UPDATE website
JOIN account_info
ON website.id = account_info.id
SET website.site_url = 'https://www.command4-newgoogle-url.com'
WHERE CAST(AES_DECRYPT(account_info.account_password, @key_str, @init_vector) AS CHAR) = 'G00Gl3';

--command 5 - change any password
UPDATE account_info
SET account_password = AES_ENCRYPT('newPasswordCommand5', @key_str, @init_vector)
WHERE CAST(AES_DECRYPT(account_password, @key_str, @init_vector) AS CHAR) = 'G00Gl3';

--command 6 - remove a tuple based on a url
DELETE account_info, website
FROM account_info
JOIN website ON account_info.id = website.id
WHERE website.site_url = 'https://www.github.com';

--command 7 - remove a tuple based on a password
DELETE account_info, website
FROM account_info
JOIN website ON account_info.id = website.id
WHERE CAST(AES_DECRYPT(account_info.account_password, @key_str, @init_vector) AS CHAR) = 'metalHead4Life';
