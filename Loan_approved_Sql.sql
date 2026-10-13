create database bank_loan;
use bank_loan;

select count(*) from l_approved;
select count(*) from loan_approved_clean;

alter table l_approved drop column MyUnknownColumn;
alter table loan_approved_clean rename to l_approved;

-- SECTION 1 — Basic SQL Queries
-- 1. View the first 10 records from the table.
select * from l_approved limit 10;

-- 2. Count the total number of loan applications.
select count(*) as total_applicants from l_approved;

-- 3. List all unique property areas.
select distinct (Property_Area) from l_approved;

-- 4. Show all applicants who are self-employed and have an income above 5000.
select * from l_approved where Self_Employed = 'Yes' and Applicantincome < 5000;

-- 5. Find the total number of approved loans.
select count(*) from l_approved where loan_status = 'Y';

-- SECTION 2 — Aggregation & Grouping

-- 6. Find average loan amount by education level.
select education,round(avg(loanamount), 2) as avg_loan_amount
from l_approved group by education;

-- 7. Find average total income (Applicant + Coapplicant) by marital status.
select married, round(avg(Applicantincome+coapplicantincome), 2) as avg_total_income
from l_approved group by Married;

-- 8. Show average loan amount by credit history.
select Credit_history ,round(avg(loanamount), 2) as avg_loan_amount
from l_approved group by Credit_history;

-- 9. Find total applications and approval rate by gender.
select
	gender,
	count(*) as Total_Applicants,
	sum(case when loan_status = 'Y' then 1 else 0 end )  as approved ,
    sum(case when loan_status = 'Y' then 1 else 0 end )/count(*) *100 as approval_rate
from l_approved group by gender;

-- 10. Show approval rate by property area.
select property_area,
	sum(case when loan_status = 'Y' then 1 else 0 end )  as approved ,
    sum(case when loan_status = 'Y' then 1 else 0 end )/count(*) *100 as approval_rate
from l_approved group by property_area;


-- SECTION 3 — Filtering & Conditions


-- 11. Show applicants who are graduates, not self-employed, and have loan amount greater than 150.
select * from l_approved 
where education = 'graduate'
and self_employed ='No'
and loanamount > 150 ;

-- 12. Display approved loans from urban area with good credit history.
select * from l_approved 
where Property_area = 'Urban'
and Credit_History = 1;

-- 13. List top 5 applicants with highest total income.
select * from l_approved order by applicantincome+coapplicantincome desc limit 5;


-- SECTION 4 — Derived Columns & CASE WHEN


-- 14. Create derived columns for total income for each applicant.
select * , applicantincome+coapplicantincome as total_income from l_approved ;


-- 15. Classify applicants into income groups (Low, Medium, High) based on applicant income.
-- 16. Find average loan amount for each income group.
