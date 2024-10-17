
--command 1 - create a new entry (the NOW sets timestamp to current time)
INSERT INTO account_info (account_username, account_password, comment, account_creation)
VALUES (
    "newUser",
    AES_ENCRYPT("NewPassword123", @key_str, @init_vector),
    "New account to test command 1.",
    NOW()
);

--command 2 - get password associated with one of the urls
SELECT
    CAST(AES_DECRYPT(account_info.account_password, @key_str, @init_vector) AS CHAR) AS decrypted_password
FROM
    account_info
JOIN
    website
ON
    account_info.id = website.id
WHERE
    website.site_url = "https://www.microsoft.com/en-us/";

--command 3 - get all password related data with urls with https (all of mine are https so theres more than 2)
SELECT
    website.website AS website_name,
    website.site_url,
    account_info.account_username,
    CAST(AES_DECRYPT(account_info.account_password, @key_str, @init_vector) AS CHAR) AS decrypted_password,
    account_info.comment,
    account_info.account_creation
FROM
    account_info
JOIN
    website
ON
    account_info.id = website.id
WHERE
    website.site_url LIKE '%https%';

--command 4 - change a url, matching password
UPDATE website
JOIN account_info ON website.id = account_info.id
SET website.site_url = 'https://www.command4-google-url.com'
WHERE CAST(AES_DECRYPT(account_info.account_password, @key_str, @init_vector) AS CHAR) = 'G00Gl3';

--command 5 - change any password
UPDATE account_info
SET account_password = AES_ENCRYPT('newPasswordCommand5', @key_str, @init_vector)
WHERE CAST(AES_DECRYPT(account_password, @key_str, @init_vector) AS CHAR) = 'G00Gl3';

--command 6 - remove a tuple based on a url

--command 7 - remove a tuple based on a password
