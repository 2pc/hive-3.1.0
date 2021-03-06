SET hive.vectorized.execution.enabled=false;
SET hive.input.format=org.apache.hadoop.hive.ql.io.HiveInputFormat;
SET mapred.min.split.size=1000;
SET mapred.max.split.size=5000;

create table newtypesorc_n5(c char(10), v varchar(10), d decimal(5,3), da date) stored as orc tblproperties("orc.stripe.size"="16777216"); 

insert overwrite table newtypesorc_n5 select * from (select cast("apple" as char(10)), cast("bee" as varchar(10)), 0.22, cast("1970-02-20" as date) from src src1 union all select cast("hello" as char(10)), cast("world" as varchar(10)), 11.22, cast("1970-02-27" as date) from src src2) uniontbl;

-- decimal data types (EQUAL, NOT_EQUAL, LESS_THAN, LESS_THAN_EQUALS, IN, BETWEEN tests)
select sum(hash(*)) from newtypesorc_n5 where d=0.22;

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d=0.22;

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d='0.22';

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d='0.22';

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d=cast('0.22' as float);

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d=cast('0.22' as float);

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d!=0.22;

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d!=0.22;

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d!='0.22';

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d!='0.22';

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d!=cast('0.22' as float);

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d!=cast('0.22' as float);

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d<11.22;

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d<11.22;

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d<'11.22';

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d<'11.22';

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d<cast('11.22' as float);

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d<cast('11.22' as float);

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d<1;

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d<1;

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d<=11.22;

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d<=11.22;

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d<='11.22';

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d<='11.22';

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d<=cast('11.22' as float);

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d<=cast('11.22' as float);

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d<=cast('11.22' as decimal);

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d<=cast('11.22' as decimal);

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d<=11.22BD;

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d<=11.22BD;

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d<=12;

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d<=12;

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d in ('0.22', '1.0');

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d in ('0.22', '1.0');

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d in ('0.22', '11.22');

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d in ('0.22', '11.22');

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d in ('0.9', '1.0');

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d in ('0.9', '1.0');

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d in ('0.9', 0.22);

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d in ('0.9', 0.22);

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d in ('0.9', 0.22, cast('11.22' as float));

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d in ('0.9', 0.22, cast('11.22' as float));

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d between 0 and 1;

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d between 0 and 1;

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d between 0 and 1000;

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d between 0 and 1000;

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d between 0 and '2.0';

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d between 0 and '2.0';

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d between 0 and cast(3 as float);

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d between 0 and cast(3 as float);

set hive.optimize.index.filter=false;
select sum(hash(*)) from newtypesorc_n5 where d between 1 and cast(30 as char(10));

set hive.optimize.index.filter=true;
select sum(hash(*)) from newtypesorc_n5 where d between 1 and cast(30 as char(10));
