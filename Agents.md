# FIT2094 Assignment 2 BRM Coding Agent Instructions

These instructions apply to all Codex work in this repository.

You are helping with FIT2094 Assignment 2 for the BRM case study. You must prioritise assignment compliance over clever code. Do not invent schema details. Always inspect the provided assignment brief, starter files, schema, and existing SQL/MongoDB files before editing.

Important:
- Do not use PL/SQL.
- Do not use WITH.
- Do not create views.
- Do not use triggers.
- Do not use procedures.
- Do not disable constraints.
- Use Oracle SQL syntax suitable for SQL Developer Extension in VS Code.
- Use TO_DATE and TO_CHAR when working with Oracle DATE values.
- Use subqueries instead of manually looking up primary keys.
- For Task 3, use only three sequences: employee, quote, job.
- Sequences must start at 300 and increment by 5.
- Do not rewrite the whole assignment unless explicitly asked.
- Prefer small, targeted patches.
- After every change, explain exactly what changed and why.
Also read `agent_resources/assignment_checklists.md` before editing any SQL or MongoDB file.
---
name: fit2094-brm-assignment-2-oracle-mongodb
version: 1.0.0
description: >
  A Claude/Claude Code skill for FIT2094 Assignment 2 BigRig Movers. Helps produce, review, test,
  and patch Oracle SQL and MongoDB scripts while enforcing the assignment brief, supplied starter
  files, class-note syntax limits, transaction rules, formatting requirements, and submission checks.
---

# FIT2094 Assignment 2 — BigRig Movers Claude Skill

## When to use this skill
Use this skill whenever the user is working on FIT2094 Assignment 2 for BigRig Movers, especially these files:

- `T1-brm-schema.sql`
- `T2-brm-insert.sql`
- `T3-brm-dm.sql`
- `T4-brm-mods.sql`
- `T5-brm-select.sql`
- `T6-brm-json.sql`
- `T6-brm-mongo.mongodb.js`
- `brm-schema-insert.sql` as the supplied setup file, which must not be edited

Primary goal: help the user get scripts that execute correctly in Monash Oracle SQL Developer Extension and MongoDB Playground, match the brief exactly, and are easy to defend in an interview.

## Academic integrity and AI-use guardrail
Before generating large final code, ask the user to confirm the current official AI rule if it matters. The provided assignment/FAQ material says AI/GenAI is permitted for Task 2 data generation and must be acknowledged in the top acknowledgement section of `T2-brm-insert.sql`. If the user provides updated official permission allowing wider AI use, proceed under that permission, but still encourage them to understand every line and keep development history.

Never encourage hiding AI use. Never remove required acknowledgement comments. Prefer code review, small patches, testing queries, and explanations over unexplained full-file dumps.

## Global assignment constraints

### Required final submission files
The final Moodle submission must be seven independent files, not a zip:

1. `T1-brm-schema.sql`
2. `T2-brm-insert.sql`
3. `T3-brm-dm.sql`
4. `T4-brm-mods.sql`
5. `T5-brm-select.sql`
6. `T6-brm-json.sql`
7. `T6-brm-mongo.mongodb.js`

The GitLab repo must also contain these files with clear development history, at least two pushes per file.

### Do not edit
Do not edit `brm-schema-insert.sql`.

### Environment assumptions
All work is to be done in Visual Studio Code using the SQL Developer Extension and MongoDB Playground. Oracle DATE values should use `TO_DATE` when inserted or compared. MongoDB field names and predicates should use double quotes.

### Avoid forbidden features unless the brief explicitly permits them
Do not use:

- PL/SQL or anonymous blocks such as `BEGIN ... END`
- `WITH`
- views
- `SPOOL`
- `ECHO`
- `ALTER TABLE ... DISABLE CONSTRAINT`
- hardcoded new numeric primary keys in Task 3 and later
- manual lookup of database IDs for Task 3 and later
- manual calculations outside Oracle for Task 3 and later
- assumptions that the database contains only the sample rows

Use only syntax covered in the unit notes: basic SELECT, predicates, joins, outer joins, self joins, aggregates, GROUP BY, HAVING, subqueries, inline subqueries, CASE, DECODE where appropriate, date/number formatting functions, sequences, DML, DDL, JSON_OBJECT/JSON_ARRAYAGG, and MongoDB CRUD/query/update operators covered in Applied 12.

## Expected workflow

When asked to create or fix code, use this workflow:

1. Identify the exact task and file.
2. Read the relevant starter file and existing user code.
3. Compare against the assignment checklist in `resources/assignment_checklists.md`.
4. Check class-note compatibility:
   - Topic 8: basic SELECT, predicates, NULL handling, aliases, ORDER BY, DISTINCT, `TO_DATE`, `TO_CHAR`, `NVL`.
   - Topic 9: aggregate functions, `GROUP BY`, `HAVING`, subqueries.
   - Topic 10: `CASE`, nested/correlated/inline subqueries, self join, outer join, set operators, Oracle functions, and no views in Assignment 2.
   - Topic 11 / Applied 12: NoSQL document model, JSON/BSON, MongoDB collections, `find`, `insertOne`, `insertMany`, `updateOne`, `$set`, `$push`, `$pull`, `$or`, regex, and projection.
5. Prefer a minimal patch if the user already has code.
6. Make sure every script is rerunnable where required.
7. Include short comments above meaningful blocks, not long essays.
8. Include explicit validation SQL/Mongo checks when useful.
9. Explain exactly what changed and why.

## Task-by-task behaviour

### Task 1 — `T1-brm-schema.sql`
Purpose: create the missing BRM tables from the supplied logical model.

Check for:

- Correct table names and attribute names exactly as in the supplied model.
- Attribute order exactly as in the model.
- Correct Oracle datatypes and sizes.
- Primary keys.
- Foreign keys.
- Required non-PK constraints that are simple and taught in the unit.
- Column comments for all newly created columns.
- No generated schema that changes names/order.
- No unsupported complex CHECK constraints.

Patch style:

- Do not rewrite the entire file unless the user asks.
- Return precise issues and small replacement blocks.
- Keep constraints named consistently with the supplied naming pattern.

### Task 2 — `T2-brm-insert.sql`
Purpose: insert the user’s own sample data into `EMPLOYEE`, `QUOTE`, and `JOB`.

Minimum data rules:

- 10 employees.
- At least 2 managers, 2 truck dispatchers, 1 mechanic, and 2 drivers.
- 30 quotes.
- Quotes involve at least 5 different customers and 2 truck dispatchers.
- At least 2 customers have at least 2 quotes.
- 20 jobs.
- Jobs involve at least 10 truck/trailer combinations.
- At least 5 truck/trailer combinations are used in at least 2 jobs.
- At least 2 quotes are never placed as jobs.
- At least 5 jobs have actual cost slightly higher or lower than quote cost.
- At least 5 jobs have same cost as the quote; represent same-cost jobs by storing `job_cost` as `NULL` if that is the intended assignment convention.
- All inserted dates are from 1 May 2026 to 31 July 2026 inclusive.
- Numeric primary key values are hardcoded and below 100.
- Treat all Task 2 inserts as one transaction.
- Data must be sensible: drop-off after pickup, driver role only for assigned driver, job matches quote, valid combination, realistic contacts/addresses/VINs.
- Include manager Sarah Mitchell and driver Michael Johnson so Task 3 can work.
- Do not modify supplied purple-table data.

Validation queries to generate when reviewing Task 2:

```sql
SELECT COUNT(*) AS employee_count FROM employee;
SELECT emp_role, COUNT(*) AS role_count FROM employee GROUP BY emp_role ORDER BY emp_role;
SELECT COUNT(*) AS quote_count FROM quote;
SELECT COUNT(DISTINCT cust_no) AS quote_customer_count FROM quote;
SELECT COUNT(DISTINCT emp_no) AS quote_dispatcher_count FROM quote;
SELECT cust_no, COUNT(*) AS quote_count FROM quote GROUP BY cust_no HAVING COUNT(*) >= 2;
SELECT COUNT(*) AS job_count FROM job;
SELECT COUNT(DISTINCT truck_vin || ':' || trailer_code) AS combo_count FROM job;
SELECT truck_vin, trailer_code, COUNT(*) AS job_count FROM job GROUP BY truck_vin, trailer_code HAVING COUNT(*) >= 2;
SELECT COUNT(*) AS quotes_not_in_jobs FROM quote q WHERE NOT EXISTS (SELECT 1 FROM job j WHERE j.quote_no = q.quote_no);
SELECT COUNT(*) AS different_cost_jobs FROM job j JOIN quote q ON q.quote_no = j.quote_no WHERE j.job_cost IS NOT NULL AND j.job_cost <> q.quote_cost;
SELECT COUNT(*) AS same_cost_jobs FROM job j JOIN quote q ON q.quote_no = j.quote_no WHERE j.job_cost IS NULL OR j.job_cost = q.quote_cost;
SELECT MIN(quote_prepared_dt), MAX(quote_prepared_dt), MIN(quote_preferred_dt), MAX(quote_preferred_dt) FROM quote;
SELECT MIN(job_pickup_dt), MAX(job_pickup_dt), MIN(job_intended_dropoff_dt), MAX(job_intended_dropoff_dt) FROM job;
SELECT * FROM employee WHERE UPPER(emp_gname) = 'SARAH' AND UPPER(emp_fname) = 'MITCHELL' AND UPPER(emp_role) = 'B';
SELECT * FROM employee WHERE UPPER(emp_gname) = 'MICHAEL' AND UPPER(emp_fname) = 'JOHNSON' AND UPPER(emp_role) = 'D';
```

Adjust column names if the supplied schema uses slightly different names, but do not invent names.

### Task 3 — `T3-brm-dm.sql`
Purpose: DML against a live database.

General rules:

- Use exactly three sequences for EMPLOYEE, QUOTE, and JOB.
- Drop each sequence before creating it.
- Sequences start at 300 and increment by 5.
- Use sequences for new numeric primary keys.
- Do not hardcode new PKs.
- Do not manually look up PK values.
- Use subqueries to find Sarah Mitchell, Aurello Brown, VICTORIA ELLA, Flintstone Store, Michael Johnson, truck VIN `1HGBH41JXMN109186`, and trailer code `TRL08`.
- Use `UPPER()`/case-insensitive comparisons where the brief hints at possible string inconsistency, while preserving supplied literal case in code.
- Treat Task 3(c) related quote/job inserts as one transaction.
- Use Oracle date arithmetic for adding hours, e.g. `pickup_date + 5/24` for five hours.
- Correctly `COMMIT` or `ROLLBACK` based on transaction boundaries in the starter file conventions.

Subtasks:

- 3a: Drop/create sequences.
- 3b: Insert Aurello Brown as Truck Dispatcher assigned to Sarah Mitchell.
- 3c: Insert Victoria’s quote and job using only supplied data and database lookups.
- 3d: Update pickup time to 2 PM and set actual job cost to 20% higher than quote.
- 3e: Cancel by removing the job, not the original quote unless the brief explicitly asks otherwise.

### Task 4 — `T4-brm-mods.sql`
Purpose: alter the live database after Tasks 1–3.

Rules:

- Do not rerun/edit schema file.
- Preserve existing data and integrity.
- Add comments for new columns.
- Use appropriate constraints.
- Include `DESC` and `SELECT` statements showing structural/data changes.
- Manage transactions correctly.

Subtasks:

- 4a: Add quote status fields for assigned-to-job Y/N and reason not assigned. Initialise status from current data using `EXISTS`/subquery logic.
- 4b: Add truck service structure. Likely requires service and service-task tables so the list of task types can expand over time. Model service start/end date/time, truck, mechanic per task, and free-text note up to 200 chars.

### Task 5 — `T5-brm-select.sql`
Purpose: three single SELECT statements.

Rules:

- One SELECT statement per question only.
- The statement begins with `SELECT` and ends with `;`.
- No `WITH`, views, or PL/SQL.
- Use column aliases whenever using arithmetic, concatenation, functions, or output manipulation.
- Match the output headings and ordering exactly.
- Full names must not have leading/trailing/double spaces; use `TRIM` and conditional concatenation.

Subtask hints:

- 5a: group customers, count quotes, average quote cost, compare to overall average using subquery, show business name if present otherwise full name, format average with dollar sign/comma/two decimals.
- 5b: self join employee to manager with outer join so managers show `No Manager`; use CASE/DECODE to show role names; scheduled jobs count only for Truck Dispatchers, blank for others.
- 5c: list every truck/trailer combination, including never-used; use outer joins and grouped/inline subqueries; classify with CASE; format fixed-width costs using `TO_CHAR`/`LPAD`; calculate average jobs per used combination without `WITH`.

### Task 6 — `T6-brm-json.sql` and `T6-brm-mongo.mongodb.js`
Purpose: generate relational data as JSON, then create/query/update MongoDB collection.

SQL JSON rules:

- Use `JSON_OBJECT` and `JSON_ARRAYAGG`.
- One document per customer who has at least one quote.
- `_id` is customer number.
- Customer business is `-` when missing.
- Customer stats include quote count, job count, total paid job cost, and total unpaid job cost.
- If a job’s actual cost is the same as quote cost and `job_cost` is null, use quote cost as the job cost.
- Use `-` for missing totals/job costs as required.
- Dates should be formatted like `10-May-2026`.

MongoDB rules:

- Do not move or modify supplied marker comments in `T6-brm-mongo.mongodb.js`.
- Start with `use('yourauthcate')` or the unit-required database command if present in the starter file.
- Drop collection immediately before creating/inserting.
- Insert generated documents.
- Use `find()` to show full details after insert.
- Query Melbourne customers with at least 2 quotes; ensure Task 2 data makes this return output.
- Insert Patrick Bosse with `_id: 1001` and display him.
- Push quote number `2002` into Patrick’s quotes array and update stats; display him again.
- Use double quotes for fields and predicates such as `"$eq"`, `"$and"`, `"$or"`, `"$push"`, and `"$set"`.

## Standard response formats

### For code review
Return:

1. `Likely mark blockers`
2. `Exact issues`
3. `Small patches`
4. `Validation queries/tests`
5. `What to rerun next`

### For generating code
Return:

1. Assumptions used
2. Code block for the requested file or patch only
3. Explanation of key decisions
4. How to run/test it
5. Any remaining risk

### For validation
Return a checklist table:

- Requirement
- Expected
- Found
- Status
- Fix

## Quality bar
Code must be:

- Oracle-compatible for Monash SQL Developer Extension.
- Rerunnable where starter-file comments imply rerunnability.
- Free of unsupported syntax.
- Defensive against extra live database rows.
- Using subqueries instead of manual ID lookups.
- Clear enough for the user to explain in an interview.

