--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-brm-mods.sql

--Student ID: 35174714
--Student Name: Abdul Hakim Shaon

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
*/

/***** Task 4(a) *****/
-- Add quote assignment tracking columns to the live QUOTE table.
-- The safe order is: add with a default so existing rows are not rejected,
-- update rows that already have a matching JOB row to 'Y', then make the
-- column NOT NULL and add a CHECK constraint.

-- Step 1: add both new columns; default 'N' prevents NOT NULL violation on existing rows.
alter table quote add (
    quote_assigned_status   char(1) default 'N',
    quote_unassigned_reason varchar2(200)
);

comment on column quote.quote_assigned_status is
    'Indicates whether the quote has been assigned to a job: Y = assigned, N = not assigned'
    ;

comment on column quote.quote_unassigned_reason is
    'Reason why the quote was not converted to a job by the preferred start date';

-- Step 2: mark every quote that already has a job row as assigned.
update quote q
   set
    quote_assigned_status = 'Y'
 where exists (
    select 1
      from job j
     where j.quote_no = q.quote_no
);

-- Step 3: now that all rows have a value, enforce NOT NULL.
alter table quote modify
    quote_assigned_status not null;

-- Step 4: restrict the column to the two valid flag values.
alter table quote
    add constraint quote_assigned_status_chk check ( quote_assigned_status in ( 'Y',
                                                                                'N' )
                                                                                );

commit;

-- Show the updated QUOTE structure and the new column values.
desc quote;

select quote_no,
       quote_assigned_status,
       quote_unassigned_reason
  from quote
 order by quote_no;


/***** Task 4(b) *****/
-- Create a three-table structure for recording truck service history.
-- TRUCK_SERVICE holds one row per service event for a truck.
-- SERVICE_TASK_TYPE is a lookup table for reusable task categories.
-- TRUCK_SERVICE_TASK links tasks to a service and records the mechanic and note.

-- Service event: one row per truck per service occasion.
create table truck_service (
    truck_vin     char(17) not null,
    serv_start_dt date not null,
    serv_end_dt   date,
    constraint truck_service_pk primary key ( truck_vin,
                                              serv_start_dt ),
    constraint truck_service_truck_fk foreign key ( truck_vin )
        references truck ( truck_vin ),
    constraint truck_service_dates_chk
        check ( serv_end_dt is null
            or serv_end_dt >= serv_start_dt )
);

comment on column truck_service.truck_vin is
    'VIN of the truck being serviced';

comment on column truck_service.serv_start_dt is
    'Date and time when the truck service starts';

comment on column truck_service.serv_end_dt is
    'Date and time when the truck service is completed (NULL if not yet finished)';

-- Lookup table: the catalogue of recognised service task types.
create table service_task_type (
    serv_task_code char(4) not null,
    serv_task_desc varchar2(50) not null,
    constraint service_task_type_pk primary key ( serv_task_code ),
    constraint service_task_type_desc_uq unique ( serv_task_desc )
);

comment on column service_task_type.serv_task_code is
    'Unique code for a type of service task';

comment on column service_task_type.serv_task_desc is
    'Description of the service task type, for example oil change or brake inspection'
    ;

-- Service task: one row per task completed during a truck service.
-- Each task has one mechanic and a free-text note up to 200 characters.
create table truck_service_task (
    truck_vin       char(17) not null,
    serv_start_dt   date not null,
    serv_task_code  char(4) not null,
    mechanic_emp_no number(3) not null,
    serv_task_note  varchar2(200) not null,
    constraint truck_service_task_pk primary key ( truck_vin,
                                                   serv_start_dt,
                                                   serv_task_code ),
    constraint truck_service_task_service_fk
        foreign key ( truck_vin,
                      serv_start_dt )
            references truck_service ( truck_vin,
                                       serv_start_dt ),
    constraint truck_service_task_type_fk foreign key ( serv_task_code )
        references service_task_type ( serv_task_code ),
    constraint truck_service_task_emp_fk foreign key ( mechanic_emp_no )
        references employee ( emp_no )
);

comment on column truck_service_task.truck_vin is
    'VIN of the truck being serviced';

comment on column truck_service_task.serv_start_dt is
    'Start date and time of the related truck service';

comment on column truck_service_task.serv_task_code is
    'Code identifying the type of task completed during the service';

comment on column truck_service_task.mechanic_emp_no is
    'Employee number of the mechanic assigned to this service task';

comment on column truck_service_task.serv_task_note is
    'Free text note explaining the service task, up to 200 characters';

commit;

-- Show the structure of all three new tables.
desc truck_service;

desc service_task_type;

desc truck_service_task;

-- Confirm the tables are empty and ready.
select *
  from truck_service;

select *
  from service_task_type;

select *
  from truck_service_task;