/*
    Cleanup for testing Task 4.
    Run this before rerunning T1, T2, T3, T4 in order.
*/

DROP TABLE truck_service_task CASCADE CONSTRAINTS PURGE;
DROP TABLE service_task_type CASCADE CONSTRAINTS PURGE;
DROP TABLE truck_service CASCADE CONSTRAINTS PURGE;

ALTER TABLE quote
    DROP CONSTRAINT quote_assigned_status_chk;

ALTER TABLE quote
    DROP COLUMN quote_assigned_status;

ALTER TABLE quote
    DROP COLUMN quote_unassigned_reason;

COMMIT;