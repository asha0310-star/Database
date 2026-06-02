--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-brm-dm.sql

--Student ID: 35174714
--Student Name: Abdul Hakim Shaon

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
*/

--3(a)
-- Recreate the Task 3 sequences for generated primary keys.
drop sequence employee_seq;

create sequence employee_seq start with 300 increment by 5;

drop sequence quote_seq;

create sequence quote_seq start with 300 increment by 5;

drop sequence job_seq;

create sequence job_seq start with 300 increment by 5;

--3(b)
-- Add Aurello Brown as a dispatcher managed by Sarah Mitchell.
insert into employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) values ( employee_seq.nextval,
           'Aurello',
           'Brown',
           '0431952053',
           null,
           'T',
           (
               select emp_no
                 from employee
                where upper(emp_gname) = 'SARAH'
                  and upper(emp_fname) = 'MITCHELL'
                  and upper(emp_role) = 'B'
           ) );

commit;

--3(c)
-- Record Victoria Ella's accepted quote prepared by Aurello Brown.
insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( quote_seq.nextval,
           to_date('17/05/2026','DD/MM/YYYY'),
           to_date('25/05/2026','DD/MM/YYYY'),
           '29 Kuranda Road, Adelaide SA 5030',
           '9 Albatros Drive, Mount Gambier SA 5270',
           1000,
           (
               select cust_no
                 from customer
                where upper(cust_gname) = 'VICTORIA'
                  and upper(cust_fname) = 'ELLA'
                  and upper(cust_bname) = 'FLINTSTONE STORE'
           ),
           (
               select emp_no
                 from employee
                where upper(emp_gname) = 'AURELLO'
                  and upper(emp_fname) = 'BROWN'
                  and upper(emp_role) = 'T'
           ) );

-- Schedule the accepted quote as a five-hour paid job.
insert into job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    trailer_code,
    truck_vin
) values ( job_seq.nextval,
           to_date('25/05/2026 09:00','DD/MM/YYYY HH24:MI'),
           to_date('25/05/2026 09:00','DD/MM/YYYY HH24:MI') + 5 / 24,
           null,
           'Y',
           quote_seq.currval,
           (
               select emp_no
                 from employee
                where upper(trim(emp_gname)) = 'AURELLO'
                  and upper(trim(emp_fname)) = 'BROWN'
                  and upper(trim(emp_role)) = 'T'
           ),
           (
               select emp_no
                 from employee
                where upper(trim(emp_gname)) = 'MICHAEL'
                  and upper(trim(emp_fname)) = 'JOHNSON'
                  and upper(trim(emp_role)) = 'D'
           ),
           'TRL08',
           '1HGBH41JXMN109186' );

commit;

--3(d)
-- Move Victoria Ella's job to 2 PM and apply the agreed 20% increase.
update job
   set job_pickup_dt = to_date('25/05/2026 14:00','DD/MM/YYYY HH24:MI'),
       job_intended_dropoff_dt = to_date('25/05/2026 14:00','DD/MM/YYYY HH24:MI') + 5 / 24
       ,
       job_cost = (
           select quote_cost * 1.2
             from quote
            where quote.quote_no = job.quote_no
       ),
       job_payment_made = 'Y'
 where quote_no = (
    select q.quote_no
      from quote q
      join customer c
    on q.cust_no = c.cust_no
     where upper(c.cust_gname) = 'VICTORIA'
       and upper(c.cust_fname) = 'ELLA'
       and upper(c.cust_bname) = 'FLINTSTONE STORE'
       and q.quote_prepared_date = to_date('17/05/2026','DD/MM/YYYY')
);

commit;

--3(e)
-- Remove the cancelled job while retaining Victoria Ella's quote.
delete from job
 where quote_no = (
    select q.quote_no
      from quote q
      join customer c
    on q.cust_no = c.cust_no
     where upper(c.cust_gname) = 'VICTORIA'
       and upper(c.cust_fname) = 'ELLA'
       and upper(c.cust_bname) = 'FLINTSTONE STORE'
       and q.quote_prepared_date = to_date('17/05/2026','DD/MM/YYYY')
);

commit;