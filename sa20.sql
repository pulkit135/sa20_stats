select distinct striker,batting_team from matches; 
select runs_off_bat,striker,batting_team from matches where striker='AK Markram';

select striker,sum(runs_off_bat),batting_team from (select distinct * from matches) CTE 
group by striker,batting_team
order by
sum(runs_off_bat)desc;

select * from matches;

select bowler,count(wicket_type),bowling_team from (select distinct *from matches where wicket_type!='runout')CTE
group by bowler,bowling_team order by count(wicket_type)desc;

select distinct wicket_type from matches;

select count(wicket_type),bowler,bowling_team from matches where wicket_type!='runout'
group by bowler,bowling_team order by count(wicket_type)desc;

select (sum(runs_off_bat)+sum(extras)) as runs,count(ball) as balls_bowled,
6 *(sum(runs_off_bat)+sum(extras))/count(ball)
as economy,bowler,bowling_team from matches group by bowler,bowling_team 
order by economy;

select case 
	when 6 *(sum(runs_off_bat)+sum(extras))/count(ball) <=6 then 'Economy under 6'
	when 6 *(sum(runs_off_bat)+sum(extras))/count(ball) between 6 and 7.5 then 'Economy between 6 & 7.5'
	when 6 *(sum(runs_off_bat)+sum(extras))/count(ball) between 7.5 and 9 then 'Economy between 7.5 & 9'
	when 6 *(sum(runs_off_bat)+sum(extras))/count(ball) >9 then 'Economy greater than 9'
end as economy_groups,bowler,bowling_team from matches group by bowler,bowling_team 
order by economy_groups;

create table eco_gps (groups varchar(50),bowler varchar(50),bowling_team varchar(50))

select *from eco_gps;
select count(*),groups from eco_gps group by groups;

select *from matches; 
select distinct venue from matches;
select sum(runs_off_bat),count(ball),striker,batting_team from matches group by striker,batting_team;
select sum(runs_off_bat),count(ball),100*(sum(runs_off_bat)/count(ball)) as strike_rate,striker,batting_team,
venue from matches  group by venue,striker,batting_team having count(ball)>15 order by strike_rate desc ;

select sum(runs_off_bat),count(ball),100*(sum(runs_off_bat)/count(ball)) as strike_rate,striker,batting_team
from matches group by striker,batting_team having count(ball)>15 order by strike_rate desc ;

select sum(runs_off_bat),(sum(runs_off_bat)/count(wicket_type)) as average,striker from matches 
group by striker having count(wicket_type)>=1 order by average desc;

select bowler,count(ball) from (select * from matches where runs_off_bat=0 and extras=0) as dots
group by bowler order by count(ball) desc;

select striker ,count(ball) from (select * from matches where runs_off_bat=6) as sixes
group by striker order by count(ball) desc;

select striker ,count(ball) from (select * from matches where runs_off_bat=4) as fours
group by striker order by count(ball) desc;

select 6*((sum(runs_off_bat)+sum(extras))/count(ball)) as run_rate ,batting_team from matches
group by batting_team order by run_rate desc;

select 6*((sum(runs_off_bat)+sum(extras))/count(ball)) as run_rate ,batting_team from matches 
where ball between 0.0 and 6.0
group by batting_team order by run_rate desc;

select 6*((sum(runs_off_bat)+sum(extras))/count(ball)) as run_rate ,batting_team from matches 
where ball between 16.0 and 20.0
group by batting_team order by run_rate desc;

select 6*((sum(runs_off_bat)+sum(extras))/count(ball)) as economy ,bowling_team from matches 
where ball between 0.0 and 6.0
group by bowling_team order by economy ;

select 6*((sum(runs_off_bat)+sum(extras))/count(ball)) as economy ,bowling_team from matches 
where ball between 16.0 and 20.0
group by bowling_team order by economy ;

select 6*((sum(runs_off_bat)+sum(extras))/count(ball)) as economy,bowler,count(ball)  from matches 
where ball between 0.0 and 6.0  group by bowler having count(ball)>= 36 order by economy;

select 6*((sum(runs_off_bat)+sum(extras))/count(ball)) as economy,bowler,count(ball)  from matches 
where ball between 16.0 and 20.0  group by bowler having count(ball)>= 30 order by economy;


 