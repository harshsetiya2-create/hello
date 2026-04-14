DELIMITER $$

CREATE PROCEDURE sp_register_user(
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_password VARCHAR(255),
    IN p_role VARCHAR(20)
)
BEGIN
    INSERT INTO users(name,email,password,role)
    VALUES(p_name,p_email,p_password,p_role);
END $$

CREATE PROCEDURE sp_login_user(
    IN p_email VARCHAR(100)
)
BEGIN
    SELECT * FROM users WHERE email=p_email;
END $$

CREATE PROCEDURE sp_get_user_by_id(
    IN p_id INT
)
BEGIN
    SELECT * FROM users WHERE id=p_id;
END $$

DELIMITER ;