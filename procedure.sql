DROP PROCEDURE IF EXISTS sp_add_student ;

DELIMITER $$

CREATE PROCEDURE 	sp_add_student(
	IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_branch VARCHAR(50),
    IN p_year INT
)
BEGIN
	IF p_year < 1 OR p_YEAR > 4 THEN
		SIGNAL SQLSTATE '45000'  -- This means "General Error"
		SET MESSAGE_TEXT = 'Error: Year must be between 1 and 4' ;
	END IF ;

	INSERT INTO STUDENT (student_id, name, email, branch, year)
	VALUES (p_id, p_name, p_email, p_branch, p_year) ;

	SELECT 'Student added successfully' AS STATUS ;
    
END$$

DELIMITER ;