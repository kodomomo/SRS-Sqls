SET GLOBAL event_scheduler = ON;
DROP EVENT IF EXISTS reset_reservation;
DELIMITER $$
CREATE EVENT IF NOT EXISTS reset_reservation
    ON SCHEDULE
        EVERY 1 DAY STARTS CONCAT(CURDATE(), ' ', '15:00:00')
    ON COMPLETION PRESERVE ENABLE
        COMMENT 'Reset reservation'
    DO
    BEGIN
        DELETE FROM tbl_member;
        DELETE FROM tbl_reservation;
    END $$
DELIMITER ;
