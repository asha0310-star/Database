--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-brm-select.sql

--Student ID: 35174714
--Student Name: Abdul Hakim Shaon

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
*/

/* (a) */
-- Inner join is used because only customers who requested quotes can satisfy the
-- grouped quote-count and average quoted-cost conditions.
select c.cust_no,
       case
           when trim(c.cust_bname) is not null then
               trim(c.cust_bname)
           else
               trim(trim(c.cust_gname)
                    || ' ' || trim(c.cust_fname))
       end as customer_name,
       count(q.quote_no) as quote_count,
       to_char(
           avg(q.quote_cost),
           'FM$999G999G990D00'
       ) as average_quote_cost
  from customer c
  join quote q
on c.cust_no = q.cust_no
 group by c.cust_no,
          c.cust_bname,
          c.cust_gname,
          c.cust_fname
having count(q.quote_no) > 1
   and avg(q.quote_cost) > (
    select avg(quote_cost)
      from quote
)
 order by avg(q.quote_cost) desc,
          c.cust_no;



/* (b) */
-- Outer joins keep employees lacking a manager and employees lacking scheduled jobs,
-- CASE returns dispatcher job counts only for Truck Dispatchers.
select e.emp_no,
       trim(trim(e.emp_gname)
            || ' ' || trim(e.emp_fname)) as employee_name,
       case upper(trim(e.emp_role))
           when 'B' then
               'Manager'
           when 'T' then
               'Truck Dispatcher'
           when 'M' then
               'Mechanic'
           when 'D' then
               'Driver'
           else
               'Unknown'
       end as role_name,
       case
           when m.emp_no is null then
               'No Manager'
           else
               trim(trim(m.emp_gname)
                    || ' ' || trim(m.emp_fname))
       end as manager_name,
       case
           when upper(trim(e.emp_role)) = 'T' then
               count(j.job_no)
           else
               null
       end as scheduled_jobs
  from employee e
  left outer join employee m
on e.emp_no_manager = m.emp_no
  left outer join job j
on e.emp_no = j.sched_emp_no
 group by e.emp_no,
          e.emp_gname,
          e.emp_fname,
          e.emp_role,
          m.emp_no,
          m.emp_gname,
          m.emp_fname
 order by e.emp_no;



/* (c) */
-- The combination table is the base so unused combinations remain in the
-- output, and CASE classifies use from the grouped job counts.
select c.truck_vin,
       t.truck_rego,
       c.trailer_code,
       lpad(
           to_char(
               tr.trailer_purchase_cost,
               'FM$999G999G990D00'
           ),
           21
       ) as trailer_purchase_cost,
       count(j.job_no) as job_count,
       case
           when count(j.job_no) = 0 then
               lpad(
                   'No jobs',
                   17
               )
           else
               lpad(
                   to_char(
                       sum(q.quote_cost),
                       'FM$999G999G990D00'
                   ),
                   17
               )
       end as total_quote_cost,
       case
           when count(j.job_no) = 0 then
               'Never Used'
           when count(j.job_no) > (
               select avg(used_combo.job_count)
                 from (
                   select count(job_no) as job_count
                     from job
                    group by truck_vin,
                             trailer_code
               ) used_combo
           )                   then
               'High Use'
           else
               'Standard Use'
       end as usage_classification
  from combination c
  join truck t
on c.truck_vin = t.truck_vin
  join trailer tr
on c.trailer_code = tr.trailer_code
  left outer join job j
on c.truck_vin = j.truck_vin
   and c.trailer_code = j.trailer_code
  left outer join quote q
on j.quote_no = q.quote_no
 group by c.truck_vin,
          t.truck_rego,
          c.trailer_code,
          tr.trailer_purchase_cost
 order by count(j.job_no) desc,
          c.truck_vin,
          c.trailer_code;