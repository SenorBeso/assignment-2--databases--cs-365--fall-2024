
--command 1 (the NOW sets timestamp to current time)
INSERT INTO account_info (account_username, account_password, comment, account_creation)
VALUES (
    "newUser123",
    AES_ENCRYPT("NewPassword123", @key_str, @init_vector),
    "New account to test command 1.",
    NOW()
);

