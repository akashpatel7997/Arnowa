show databases; 

create database arnowa;
use arnowa;

create table google(
date date ,  
open float(12,6) ,
high float(12,6),
low float(12,6),
close float(12,6),
`Adj close` float(12,6),
Volume int(9),
Company varchar(5)
);

create table amazon(
date date ,  
open float(12,6) ,
high float(12,6),
low float(12,6),
close float(12,6),
`Adj close` float(12,6),
Volume int(9),
Company varchar(5)
);


create table apple(
date date ,  
open float(12,6) ,
high float(12,6),
low float(12,6),
close float(12,6),
`Adj close` float(12,6),
Volume int(9),
Company varchar(10)
);


create table microsoft(
date date ,  
open float(12,6) ,
high float(12,6),
low float(12,6),
close float(12,6),
`Adj close` float(12,6),
Volume int(9),
Company varchar(10)
);

create table tesla(
date date ,  
open float(12,6) ,
high float(12,6),
low float(12,6),
close float(12,6),
`Adj close` float(12,6),
Volume int(9),
Company varchar(10)
);

create table netflix(
date date ,  
open float(12,6) ,
high float(12,6),
low float(12,6),
close float(12,6),
`Adj close` float(12,6),
Volume int(9),
Company varchar(10)
);


show tables;
select * from google; 

#1. Print the highest opening and the lowest closing values of each month for Google.

select max(open), min(`close`) from google group by  monthname(date) ; 

#2. Find the standard deviation of Volume per year for Netflix.

select std(Volume), year(date) from netflix group by year(date); 

#3. Find the difference between the opening values of Amazon and Apple. 

select amazon.open, apple.open, abs(amazon.open - apple.open) from amazon join apple;  

#4. Find the largest daily return for Amazon. (Daily return is calculated by subtracting the opening price from the closing price)

select max(abs(open - close)) from amazon; 

#5. Print the company name with the highest opening value for each day. 

select date, max(open), Company  from (select date, max(open), Company  from amazon am 
union select date, max(open), Company  from apple ap 
union select date, max(open), Company  from microsoft m 
union select date, max(open), Company  from google g
union select date, max(open), Company  from netflix n
union select date, max(open), Company  from tesla t) group by date(date); 
















