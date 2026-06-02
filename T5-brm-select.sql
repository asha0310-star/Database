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
SELECT c.cust_no,
       CASE
           WHEN c.cust_bname IS NOT NULL THEN c.cust_bname
           ELSE TRIM(TRIM(c.cust_gname)
                     || ' '
                     || TRIM(c.cust_fname))
       END AS customer_name,
       COUNT(q.quote_no) AS quote_count,
       TO_CHAR(AVG(q.quote_cost),'$999G990D00') AS average_quote_cost
  FROM customer c
  JOIN quote q
ON c.cust_no = q.cust_no
 GROUP BY c.cust_no,
          c.cust_bname,
          c.cust_gname,
          c.cust_fname
HAVING COUNT(q.quote_no) > 1
   AND AVG(q.quote_cost) > (
    SELECT AVG(quote_cost)
      FROM quote
)
 ORDER BY AVG(q.quote_cost) DESC,
          c.cust_no;



/* (b) */
-- Outer joins keep employees lacking a manager and employees lacking scheduled jobs,
-- CASE returns dispatcher job counts only for Truck Dispatchers.
SELECT e.emp_no,
       TRIM(TRIM(e.emp_gname)
            || ' '
            || TRIM(e.emp_fname)) AS employee_name,
       CASE UPPER(TRIM(e.emp_role))
           WHEN 'B' THEN 'Manager'
           WHEN 'T' THEN 'Truck Dispatcher'
           WHEN 'M' THEN 'Mechanic'
           WHEN 'D' THEN 'Driver'
       END AS role_name,
       CASE
           WHEN m.emp_no IS NULL THEN 'No Manager'
           ELSE TRIM(TRIM(m.emp_gname)
                     || ' '
                     || TRIM(m.emp_fname))
       END AS manager_name,
       CASE
           WHEN UPPER(TRIM(e.emp_role)) = 'T' THEN COUNT(j.job_no)
           ELSE NULL
       END AS scheduled_jobs
  FROM employee e
  LEFT OUTER JOIN employee m
ON e.emp_no_manager = m.emp_no
  LEFT OUTER JOIN job j
ON e.emp_no = j.sched_emp_no
 GROUP BY e.emp_no,
          e.emp_gname,
          e.emp_fname,
          e.emp_role,
          m.emp_no,
          m.emp_gname,
          m.emp_fname
 ORDER BY e.emp_no;



/* (c) */
-- The combination table is the base so unused combinations remain in the
-- output, and CASE classifies use from the grouped job counts.
SELECT c.truck_vin,
       t.truck_rego,
       c.trailer_code,
       LPAD(TO_CHAR(tr.trailer_purchase_cost,'FM$999G999G990D00'),21) AS trailer_purchase_cost,
       COUNT(j.job_no) AS job_count,
       CASE
           WHEN COUNT(j.job_no) = 0 THEN LPAD('No jobs',17)
           ELSE LPAD(TO_CHAR(SUM(q.quote_cost),'FM$999G999G990D00'),17)
       END AS total_quote_cost,
       CASE
           WHEN COUNT(j.job_no) = 0 THEN 'Never Used'
           WHEN COUNT(j.job_no) > (
               SELECT AVG(used_combo.job_count)
                 FROM (
                   SELECT COUNT(job_no) AS job_count
                     FROM job
                    GROUP BY truck_vin,
                             trailer_code
               ) used_combo
           ) THEN 'High Use'
           ELSE 'Standard Use'
       END AS usage_classification
  FROM combination c
  JOIN truck t
ON c.truck_vin = t.truck_vin
  JOIN trailer tr
ON c.trailer_code = tr.trailer_code
  LEFT OUTER JOIN job j
ON c.truck_vin = j.truck_vin
   AND c.trailer_code = j.trailer_code
  LEFT OUTER JOIN quote q
ON j.quote_no = q.quote_no
 GROUP BY c.truck_vin,
          t.truck_rego,
          c.trailer_code,
          tr.trailer_purchase_cost
 ORDER BY COUNT(j.job_no) DESC,
          c.truck_vin,
          c.trailer_code;
