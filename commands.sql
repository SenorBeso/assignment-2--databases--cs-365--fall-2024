
--command 1 (the NOW sets timestamp to current time)
INSERT INTO account_info (account_username, account_password, comment, account_creation)
VALUES (
    "newUser123",
    AES_ENCRYPT("NewPassword123", @key_str, @init_vector),
    "New account to test command 1.",
    NOW()
);

--command 2
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
