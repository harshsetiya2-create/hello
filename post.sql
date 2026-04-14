DELIMITER $$

CREATE PROCEDURE sp_create_post(
    IN p_user_id INT,
    IN p_title VARCHAR(255),
    IN p_content TEXT
)
BEGIN
    INSERT INTO posts(user_id,title,content)
    VALUES(p_user_id,p_title,p_content);
END $$

CREATE PROCEDURE sp_update_post(
    IN p_id INT,
    IN p_title VARCHAR(255),
    IN p_content TEXT
)
BEGIN
    UPDATE posts
    SET title=p_title, content=p_content
    WHERE id=p_id;
END $$

CREATE PROCEDURE sp_delete_post(
    IN p_id INT
)
BEGIN
    DELETE FROM posts WHERE id=p_id;
END $$

CREATE PROCEDURE sp_get_all_posts()
BEGIN
    SELECT p.*,u.name
    FROM posts p
    JOIN users u ON p.user_id=u.id
    WHERE status='approved'
    ORDER BY created_at DESC;
END $$

CREATE PROCEDURE sp_get_post_by_id(
    IN p_id INT
)
BEGIN
    SELECT * FROM posts WHERE id=p_id;
END $$

CREATE PROCEDURE sp_approve_post(
    IN p_id INT
)
BEGIN
    UPDATE posts SET status='approved'
    WHERE id=p_id;
END $$

DELIMITER ;