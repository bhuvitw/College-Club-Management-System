-- 1. Change delimiter so we can write multiple lines
DELIMITER $$

-- 2. Name the trigger and set the timing
CREATE TRIGGER trg_update_budget
AFTER INSERT ON EVENT_SPONSORSHIP
FOR EACH ROW
BEGIN
    -- 3. The Action
    UPDATE CLUB
    SET club_budget = club_budget + NEW.amount_contributed
    WHERE club_id = (
        SELECT club_id 
        FROM EVENT 
        WHERE event_id = NEW.event_id
    );
END$$

-- 4. Change delimiter back to normal
DELIMITER ;