/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-brm-insert.sql

--Student ID: 35174714
--Student Name: Abdul Hakim Shaon

/*
Indicate if AI was used (Yes/No): Yes

If AI was used:
I used Gemini pro and ChatGPT to assist with generating and checking sensible sample data for Task 2 only, including employee, quote and job insert statements. The output was manually reviewed, edited and tested against the assignment business rules.
I used these prompts: 
1. Generate Oracle SQL INSERT statements for EMPLOYEE, QUOTE and JOB that satisfy the FIT2094 Assignment 2 Task 2 minimum data requirements.
2. Check that the data includes the required number of employees, quotes, jobs, truck/trailer combinations, assigned and unassigned quotes, and same/different job costs.
3. Check that all dates are between 1 May 2026 and 31 July 2026 and that all data follows the business rules.
*/

--------------------------------------
--INSERT INTO employee
--------------------------------------
-- Satisfies: 10 employees, 2 managers ('B'), 3 dispatchers ('T'), 1 mechanic ('M'), 4 drivers ('D')
-- Includes Sarah Mitchell as Manager and Michael Johnson as Driver
-- Managers manage non-manager employees
insert into employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) values ( 1,
           'Sarah',
           'Mitchell',
           '0411111111',
           null,
           'B',
           null );

insert into employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) values ( 2,
           'Robert',
           'Smith',
           '0422222222',
           null,
           'B',
           null );

insert into employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) values ( 3,
           'John',
           'Doe',
           '0433333333',
           null,
           'T',
           1 );

insert into employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) values ( 4,
           'Jane',
           'Lyons',
           '0444444444',
           null,
           'T',
           1 );

insert into employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) values ( 5,
           'David',
           'Miller',
           '0455555555',
           null,
           'M',
           2 );

insert into employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) values ( 6,
           'Michael',
           'Johnson',
           '0466666666',
           'D1234567890',
           'D',
           2 );

insert into employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) values ( 7,
           'Chris',
           'Evans',
           '0477777777',
           'D1234567891',
           'D',
           1 );

insert into employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) values ( 8,
           'Emma',
           'Watson',
           '0488888888',
           'D1234567892',
           'D',
           2 );

insert into employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) values ( 9,
           'Tom',
           'Hardy',
           '0499999999',
           'D1234567893',
           'D',
           1 );

insert into employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) values ( 10,
           'Alice',
           'Cooper',
           '0400000000',
           null,
           'T',
           2 );

--------------------------------------
--INSERT INTO quote
--------------------------------------
-- Satisfies: 30 quotes, 5 different customers (cust_no 1 to 5), 2 dispatchers involved (emp 3, 4)
-- Multiple quotes per customer, prepared by valid dispatchers
-- Dates between 1 May 2026 and 31 July 2026
insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 1,
           to_date('02-May-2026','DD-Mon-YYYY'),
           to_date('10-May-2026','DD-Mon-YYYY'),
           'Melbourne',
           'Sydney',
           1500.00,
           1,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 2,
           to_date('03-May-2026','DD-Mon-YYYY'),
           to_date('12-May-2026','DD-Mon-YYYY'),
           'Melbourne',
           'Geelong',
           2000.00,
           1,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 3,
           to_date('04-May-2026','DD-Mon-YYYY'),
           to_date('14-May-2026','DD-Mon-YYYY'),
           'Sydney',
           'Newcastle',
           2500.00,
           1,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 4,
           to_date('05-May-2026','DD-Mon-YYYY'),
           to_date('16-May-2026','DD-Mon-YYYY'),
           'Brisbane',
           'Gold Coast',
           1800.00,
           1,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 5,
           to_date('06-May-2026','DD-Mon-YYYY'),
           to_date('18-May-2026','DD-Mon-YYYY'),
           'Adelaide',
           'Port Augusta',
           2200.00,
           1,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 6,
           to_date('07-May-2026','DD-Mon-YYYY'),
           to_date('20-May-2026','DD-Mon-YYYY'),
           'Perth',
           'Fremantle',
           3000.00,
           1,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 7,
           to_date('02-May-2026','DD-Mon-YYYY'),
           to_date('11-May-2026','DD-Mon-YYYY'),
           'Sydney',
           'Melbourne',
           1200.00,
           2,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 8,
           to_date('03-May-2026','DD-Mon-YYYY'),
           to_date('13-May-2026','DD-Mon-YYYY'),
           'Melbourne',
           'Ballarat',
           2100.00,
           2,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 9,
           to_date('04-May-2026','DD-Mon-YYYY'),
           to_date('15-May-2026','DD-Mon-YYYY'),
           'Brisbane',
           'Toowoomba',
           1600.00,
           2,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 10,
           to_date('05-May-2026','DD-Mon-YYYY'),
           to_date('17-May-2026','DD-Mon-YYYY'),
           'Adelaide',
           'Victor Harbor',
           2400.00,
           2,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 11,
           to_date('06-May-2026','DD-Mon-YYYY'),
           to_date('19-May-2026','DD-Mon-YYYY'),
           'Perth',
           'Bunbury',
           1900.00,
           2,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 12,
           to_date('07-May-2026','DD-Mon-YYYY'),
           to_date('21-May-2026','DD-Mon-YYYY'),
           'Melbourne',
           'Albury',
           2700.00,
           2,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 13,
           to_date('08-May-2026','DD-Mon-YYYY'),
           to_date('22-May-2026','DD-Mon-YYYY'),
           'Sydney',
           'Wollongong',
           1350.00,
           3,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 14,
           to_date('09-May-2026','DD-Mon-YYYY'),
           to_date('23-May-2026','DD-Mon-YYYY'),
           'Brisbane',
           'Cairns',
           3100.00,
           3,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 15,
           to_date('10-May-2026','DD-Mon-YYYY'),
           to_date('24-May-2026','DD-Mon-YYYY'),
           'Melbourne',
           'Bendigo',
           1750.00,
           3,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 16,
           to_date('11-May-2026','DD-Mon-YYYY'),
           to_date('25-May-2026','DD-Mon-YYYY'),
           'Adelaide',
           'Mount Gambier',
           2250.00,
           3,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 17,
           to_date('12-May-2026','DD-Mon-YYYY'),
           to_date('26-May-2026','DD-Mon-YYYY'),
           'Perth',
           'Geraldton',
           1400.00,
           3,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 18,
           to_date('13-May-2026','DD-Mon-YYYY'),
           to_date('27-May-2026','DD-Mon-YYYY'),
           'Sydney',
           'Canberra',
           2850.00,
           3,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 19,
           to_date('14-May-2026','DD-Mon-YYYY'),
           to_date('28-May-2026','DD-Mon-YYYY'),
           'Melbourne',
           'Mildura',
           1650.00,
           4,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 20,
           to_date('15-May-2026','DD-Mon-YYYY'),
           to_date('29-May-2026','DD-Mon-YYYY'),
           'Brisbane',
           'Mackay',
           3200.00,
           4,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 21,
           to_date('16-May-2026','DD-Mon-YYYY'),
           to_date('30-May-2026','DD-Mon-YYYY'),
           'Sydney',
           'Tamworth',
           1850.00,
           4,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 22,
           to_date('17-May-2026','DD-Mon-YYYY'),
           to_date('01-Jun-2026','DD-Mon-YYYY'),
           'Adelaide',
           'Whyalla',
           2350.00,
           4,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 23,
           to_date('18-May-2026','DD-Mon-YYYY'),
           to_date('02-Jun-2026','DD-Mon-YYYY'),
           'Perth',
           'Kalgoorlie',
           1250.00,
           4,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 24,
           to_date('19-May-2026','DD-Mon-YYYY'),
           to_date('03-Jun-2026','DD-Mon-YYYY'),
           'Melbourne',
           'Shepparton',
           2950.00,
           4,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 25,
           to_date('20-May-2026','DD-Mon-YYYY'),
           to_date('04-Jun-2026','DD-Mon-YYYY'),
           'Brisbane',
           'Rockhampton',
           1550.00,
           5,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 26,
           to_date('21-May-2026','DD-Mon-YYYY'),
           to_date('05-Jun-2026','DD-Mon-YYYY'),
           'Sydney',
           'Dubbo',
           3300.00,
           5,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 27,
           to_date('22-May-2026','DD-Mon-YYYY'),
           to_date('06-Jun-2026','DD-Mon-YYYY'),
           'Adelaide',
           'Renmark',
           1950.00,
           5,
           3 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 28,
           to_date('23-May-2026','DD-Mon-YYYY'),
           to_date('07-Jun-2026','DD-Mon-YYYY'),
           'Perth',
           'Albany',
           2450.00,
           5,
           3 );

-- Quotes 29 and 30 will intentionally never be assigned to jobs
insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 29,
           to_date('24-May-2026','DD-Mon-YYYY'),
           to_date('08-Jun-2026','DD-Mon-YYYY'),
           'Melbourne',
           'Warrnambool',
           1150.00,
           5,
           4 );

insert into quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) values ( 30,
           to_date('25-May-2026','DD-Mon-YYYY'),
           to_date('09-Jun-2026','DD-Mon-YYYY'),
           'Brisbane',
           'Bundaberg',
           3050.00,
           5,
           4 );

--------------------------------------
--INSERT INTO job
--------------------------------------
-- Satisfies: 20 jobs, scheduled by dispatchers (emp 3,4), driven by drivers (emp 6,7,8,9)
-- 10 truck/trailer combinations are used in total.
-- All 10 combinations are used in at least 2 jobs, exceeding the minimum of 5.
-- Jobs 1-5 and 11-20 have the same actual cost as the quote, represented by NULL job_cost.
-- Jobs 6-10 have a slightly higher/lower actual cost than the quote.
-- Sensible dates: pickup on or after preferred start, dropoff after pickup.
-- Jobs 1-5: same actual cost as quote, so job_cost is NULL
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
) values ( 1,
           to_date('11-May-2026 08:00','DD-Mon-YYYY HH24:MI'),
           to_date('13-May-2026 17:00','DD-Mon-YYYY HH24:MI'),
           null,
           'Y',
           1,
           3,
           6,
           'TRL03',
           '3VWFE21C04M000001' );

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
) values ( 2,
           to_date('13-May-2026 09:00','DD-Mon-YYYY HH24:MI'),
           to_date('15-May-2026 16:00','DD-Mon-YYYY HH24:MI'),
           null,
           'N',
           2,
           4,
           7,
           'TRL04',
           '4T1BF1FK5CU123456' );

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
) values ( 3,
           to_date('15-May-2026 10:00','DD-Mon-YYYY HH24:MI'),
           to_date('17-May-2026 15:00','DD-Mon-YYYY HH24:MI'),
           null,
           'Y',
           3,
           3,
           8,
           'TRL05',
           '5FNRL5H40BB098765' );

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
) values ( 4,
           to_date('17-May-2026 07:00','DD-Mon-YYYY HH24:MI'),
           to_date('19-May-2026 18:00','DD-Mon-YYYY HH24:MI'),
           null,
           'Y',
           4,
           4,
           9,
           'TRL06',
           '1FTFW1ET5DFC10112' );

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
) values ( 5,
           to_date('19-May-2026 08:30','DD-Mon-YYYY HH24:MI'),
           to_date('21-May-2026 16:30','DD-Mon-YYYY HH24:MI'),
           null,
           'N',
           5,
           3,
           6,
           'TRL07',
           '2C4RDGCG8ER123789' );

-- Jobs 6-10: actual cost is slightly different from the quote cost
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
) values ( 6,
           to_date('21-May-2026 09:15','DD-Mon-YYYY HH24:MI'),
           to_date('24-May-2026 14:00','DD-Mon-YYYY HH24:MI'),
           3200.00,
           'Y',
           6,
           4,
           7,
           'TRL08',
           '5XYKT3A69CG234567' );

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
) values ( 7,
           to_date('12-May-2026 08:00','DD-Mon-YYYY HH24:MI'),
           to_date('14-May-2026 17:00','DD-Mon-YYYY HH24:MI'),
           1400.00,
           'Y',
           7,
           3,
           8,
           'TRL05',
           '1HGBH41JXMN109186' );

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
) values ( 8,
           to_date('14-May-2026 11:00','DD-Mon-YYYY HH24:MI'),
           to_date('16-May-2026 13:00','DD-Mon-YYYY HH24:MI'),
           2200.00,
           'N',
           8,
           4,
           9,
           'TRL08',
           '2FMDK3GC8BBA12345' );

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
) values ( 9,
           to_date('16-May-2026 06:00','DD-Mon-YYYY HH24:MI'),
           to_date('18-May-2026 12:00','DD-Mon-YYYY HH24:MI'),
           1750.00,
           'Y',
           9,
           3,
           6,
           'TRL01',
           '3VWFE21C04M000001' );

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
) values ( 10,
           to_date('18-May-2026 07:30','DD-Mon-YYYY HH24:MI'),
           to_date('20-May-2026 15:30','DD-Mon-YYYY HH24:MI'),
           2600.00,
           'Y',
           10,
           4,
           7,
           'TRL02',
           '2FMDK3GC8BBA12345' );

-- Jobs 11-20: same actual cost as quote, so job_cost is NULL.
-- Re-use the first 10 truck/trailer combinations so each combination appears in 2 jobs.
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
) values ( 11,
           to_date('20-May-2026 08:00','DD-Mon-YYYY HH24:MI'),
           to_date('22-May-2026 17:00','DD-Mon-YYYY HH24:MI'),
           null,
           'N',
           11,
           3,
           8,
           'TRL03',
           '3VWFE21C04M000001' );

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
) values ( 12,
           to_date('22-May-2026 09:00','DD-Mon-YYYY HH24:MI'),
           to_date('24-May-2026 16:00','DD-Mon-YYYY HH24:MI'),
           null,
           'Y',
           12,
           4,
           9,
           'TRL04',
           '4T1BF1FK5CU123456' );

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
) values ( 13,
           to_date('24-May-2026 10:00','DD-Mon-YYYY HH24:MI'),
           to_date('26-May-2026 15:00','DD-Mon-YYYY HH24:MI'),
           null,
           'Y',
           13,
           3,
           6,
           'TRL05',
           '5FNRL5H40BB098765' );

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
) values ( 14,
           to_date('25-May-2026 07:00','DD-Mon-YYYY HH24:MI'),
           to_date('28-May-2026 18:00','DD-Mon-YYYY HH24:MI'),
           null,
           'N',
           14,
           4,
           7,
           'TRL06',
           '1FTFW1ET5DFC10112' );

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
) values ( 15,
           to_date('27-May-2026 08:30','DD-Mon-YYYY HH24:MI'),
           to_date('29-May-2026 16:30','DD-Mon-YYYY HH24:MI'),
           null,
           'Y',
           15,
           3,
           8,
           'TRL07',
           '2C4RDGCG8ER123789' );

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
) values ( 16,
           to_date('28-May-2026 09:15','DD-Mon-YYYY HH24:MI'),
           to_date('31-May-2026 14:00','DD-Mon-YYYY HH24:MI'),
           null,
           'Y',
           16,
           4,
           9,
           'TRL08',
           '5XYKT3A69CG234567' );

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
) values ( 17,
           to_date('30-May-2026 08:00','DD-Mon-YYYY HH24:MI'),
           to_date('02-Jun-2026 17:00','DD-Mon-YYYY HH24:MI'),
           null,
           'N',
           17,
           3,
           6,
           'TRL05',
           '1HGBH41JXMN109186' );

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
) values ( 18,
           to_date('01-Jun-2026 11:00','DD-Mon-YYYY HH24:MI'),
           to_date('03-Jun-2026 13:00','DD-Mon-YYYY HH24:MI'),
           null,
           'Y',
           18,
           4,
           7,
           'TRL08',
           '2FMDK3GC8BBA12345' );

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
) values ( 19,
           to_date('03-Jun-2026 06:00','DD-Mon-YYYY HH24:MI'),
           to_date('05-Jun-2026 12:00','DD-Mon-YYYY HH24:MI'),
           null,
           'Y',
           19,
           3,
           8,
           'TRL01',
           '3VWFE21C04M000001' );

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
) values ( 20,
           to_date('05-Jun-2026 07:30','DD-Mon-YYYY HH24:MI'),
           to_date('07-Jun-2026 15:30','DD-Mon-YYYY HH24:MI'),
           null,
           'N',
           20,
           4,
           9,
           'TRL02',
           '2FMDK3GC8BBA12345' );

-- Commit transaction as required
commit;