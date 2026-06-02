# FIT2094 Assignment 2 BRM Checklists

## Submission checklist
- Submit exactly seven independent files to Moodle; do not submit a zip.
- Files: T1-brm-schema.sql, T2-brm-insert.sql, T3-brm-dm.sql, T4-brm-mods.sql, T5-brm-select.sql, T6-brm-json.sql, T6-brm-mongo.mongodb.js.
- Keep brm-schema-insert.sql in the repo for testing but do not submit it unless specifically required.
- Maintain at least two GitLab pushes per submitted file.
- Download Moodle submission to an empty folder and verify the contents.

## Global forbidden features
- No PL/SQL / anonymous BEGIN-END blocks.
- No WITH.
- No views.
- No SPOOL or ECHO.
- No disabling constraints.
- No hardcoded new numeric PKs after Task 2.
- No manual database lookup/calculation after Task 2.

## Task 2 minimum data checklist
- [ ] 10 employees.
- [ ] >= 2 managers.
- [ ] >= 2 truck dispatchers.
- [ ] >= 1 mechanic.
- [ ] >= 2 drivers.
- [ ] Sarah Mitchell exists as manager.
- [ ] Michael Johnson exists as driver.
- [ ] 30 quotes.
- [ ] >= 5 different customers in quotes.
- [ ] >= 2 truck dispatchers in quotes.
- [ ] >= 2 customers with >= 2 quotes.
- [ ] 20 jobs.
- [ ] >= 10 truck/trailer combinations used.
- [ ] >= 5 combinations used in >= 2 jobs.
- [ ] >= 2 quotes never assigned to jobs.
- [ ] >= 5 jobs with job_cost different from quote_cost.
- [ ] >= 5 jobs with same cost as quote; if convention is same = quote cost, store job_cost as NULL.
- [ ] All inserted dates from 1 May 2026 to 31 July 2026.
- [ ] All numeric hardcoded PKs below 100.
- [ ] One transaction.

## Task 3 checklist
- [ ] Drop/create exactly three sequences.
- [ ] Sequences start 300 increment 5.
- [ ] Insert Aurello Brown via sequence.
- [ ] Assign Aurello to Sarah Mitchell using a subquery.
- [ ] Insert Victoria quote/job using subqueries.
- [ ] Use date arithmetic for 5-hour trip.
- [ ] Update pickup to 2 PM and job cost to quote * 1.2.
- [ ] Delete/cancel the job while keeping required relational integrity.
- [ ] Commit transaction boundaries appropriately.

## Task 4 checklist
- [ ] Add quote assigned status and reason attributes.
- [ ] Initialise assigned status correctly from existing job rows.
- [ ] Add comments for new columns.
- [ ] Include SELECT and DESC proof statements.
- [ ] Model truck service and expandable service tasks.
- [ ] Include mechanic per service task and note up to 200 chars.

## Task 5 checklist
- [ ] One SELECT per question.
- [ ] Match headings and ordering.
- [ ] Use aliases for all expressions.
- [ ] No extra spaces in full names.
- [ ] Format currency exactly as required.
- [ ] Include never-used combinations in 5c.

## Task 6 checklist
- [ ] SQL produces exact JSON shape.
- [ ] Customers included only if they have at least one quote.
- [ ] Business/name/address/stats formatted correctly.
- [ ] `job_cost` falls back to quote cost when null for assigned job.
- [ ] Mongo marker comments not moved.
- [ ] Collection dropped before insert.
- [ ] Melbourne + >=2 quote query returns output.
- [ ] Patrick Bosse inserted and then updated with quote 2002.
- [ ] Mongo fields/predicates use double quotes.
