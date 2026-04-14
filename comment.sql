DELIMITER $$

CREATE PROCEDURE sp_add_comment(
    IN p_post_id INT,
    IN p_user_id INT,
    IN p_comment TEXT
)
BEGIN
    INSERT INTO comments(post_id,user_id,comment)
    VALUES(p_post_id,p_user_id,p_comment);
END $$

CREATE PROCEDURE sp_get_comments_by_post(
    IN p_post_id INT
)
BEGIN
    SELECT c.*,u.name
    FROM comments c
    JOIN users u ON c.user_id=u.id
    WHERE post_id=p_post_id;
END $$

DELIMITER ;