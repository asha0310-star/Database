/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-brm-json.sql

--Student ID: 35174714
--Student Name: Abdul Hakim Shaon

/*
-- Submission Declaration - must not be removed - removal will result in no marks being awarded --
In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

SET PAGESIZE 100
SET WRAP OFF
SET HEADING OFF
SET LONG 200000
SET LONGCHUNKSIZE 200000
SET LINESIZE 32767

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

select json_arrayagg(
           json_object(
           '_id' value c.cust_no,
           'customer_name' value trim(trim(c.cust_gname)
                                      || ' ' || trim(c.cust_fname)),
           'customer_business' value nvl(trim(c.cust_bname),'-'),
           'customer_address' value trim(c.cust_street)
                                      || ', ' || trim(c.cust_town)
                                      || ', ' || trim(c.cust_pcode),
           'customer_phone' value trim(c.cust_contact_no),
           'customer_stats' value (
               select json_object(
                          'number_of_quotes' value count(q.quote_no),
                          'number_of_jobs' value count(j.job_no),
                          'total_paid_jobcost' value case
                              when sum(
                                  case
                                      when j.job_payment_made = 'Y' then
                                          nvl(j.job_cost,q.quote_cost)
                                  end
                              ) is null then
                                  '-'
                              else
                                  to_char(
                                      sum(
                                          case
                                              when j.job_payment_made = 'Y' then
                                                  nvl(j.job_cost,q.quote_cost)
                                          end
                                      ),
                                      'FM$999G999G990D00'
                                  )
                          end,
                          'total_unpaid_jobcost' value case
                              when sum(
                                  case
                                      when j.job_payment_made = 'N' then
                                          nvl(j.job_cost,q.quote_cost)
                                  end
                              ) is null then
                                  '-'
                              else
                                  to_char(
                                      sum(
                                          case
                                              when j.job_payment_made = 'N' then
                                                  nvl(j.job_cost,q.quote_cost)
                                          end
                                      ),
                                      'FM$999G999G990D00'
                                  )
                          end
                          returning clob
                      )
                 from quote q
                 left outer join job j
               on q.quote_no = j.quote_no
                where q.cust_no = c.cust_no
           ) format json,
           'quotes' value (
               select json_arrayagg(
                          json_object(
                              'quote_no' value q.quote_no,
                              'quote_prepared_on' value to_char(q.quote_prepared_date,'DD-Mon-YYYY'),
                              'preferred_start_date' value to_char(q.quote_pref_start_date,'DD-Mon-YYYY'),
                              'start_location' value trim(q.quote_start_location),
                              'end_location' value trim(q.quote_end_location),
                              'quote_cost' value to_char(q.quote_cost,'FM$999G999G990D00'),
                              'assigned_to_job' value case
                                  when j.job_no is null then
                                      'N'
                                  else
                                      'Y'
                              end,
                              'job_cost' value case
                                  when j.job_no is null then
                                      '-'
                                  else
                                      to_char(nvl(j.job_cost,q.quote_cost),'FM$999G999G990D00')
                              end
                              returning clob
                          )
                          order by q.quote_no
                          returning clob
                      )
                 from quote q
                 left outer join job j
               on q.quote_no = j.quote_no
                where q.cust_no = c.cust_no
           ) format json
           returning clob
       )
       order by c.cust_no
       returning clob
   )
  from customer c
 where exists (
           select 1
             from quote q
            where q.cust_no = c.cust_no
       );
