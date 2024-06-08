create database classdb;
use classdb;
show tables;
select * from financial_loan_dataset;
#total loan applications
select count(id) as Total_loan_applications from financial_loan_dataset;
#amount disbursed in 2021
select sum(loan_amount) as Amount_disbursed from financial_loan_dataset;
#amount collected
select sum(total_payment) as amount_received from financial_loan_dataset;
#avg interest
select avg(int_rate)*100 as avg_int_rate from financial_loan_dataset;
select round(avg(int_rate),2)*100 as avg_int_rate from financial_loan_dataset;
#avg int
select avg(dti)*100 as avg_dti from financial_loan_dataset;
select round(avg(dti),2)*100 as avg_dti from financial_loan_dataset;
#good loan applications
select count(id) as good_loan_applications from financial_loan_dataset where loan_status="Fully Paid" or loan_status="current";
#bad loan applications
select count(id) as Bad_loan_applications from financial_loan_dataset where loan_status="Charged off";
#good loan percentage
select (count(case when loan_status="Fully paid" or "charged off" then id end)*100)/count(id) as good_loan_percentage from financial_loan_dataset;
#bad loan percentage
select (count(case when loan_status="charged off" then id end)*100)/count(id) as bad_loan_percentage from financial_loan_dataset;
#good amount given by the bank
select sum(loan_amount) as good_loan_amount from financial_loan_dataset where loan_status ="fully paid" or loan_status="current";
#good loan amount received by the bank
select sum(total_payment) as good_loan_amount_received from financial_loan_dataset where loan_status ="fully paid" or loan_status="current";
#groupby
select loan_status,count(id)as total_applications, sum(total_payment) as total_amount_received,
sum(loan_amount) as total_funded_amount,avg(int_rate*100) as interest_rate ,avg(dti*100) as avg_dti
from financial_loan_dataset group by loan_status;