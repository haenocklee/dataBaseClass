use db_dbclass;
create table table1(
col1 int,
col2 varchar(5)
);
-- 테이블 조회 (모든컬럼)
select * from table1;

-- 테이블에 저장
insert into table1(col1, col2) values(1,'안녕');
insert into table1(col1, col2) values(2,'화요일');
-- 정의한 컬럼에 맞지 않는 데이터가 들어오면 에러
insert into table1(col1, col2) values('aa','화요일');
-- 정의된 크기보다 크다는 에러
insert into table1(col1, col2) values(4,'화요일입니다');
insert into table1(col1, col2) values(5,'abcde');

/* 
관리번호(id),
학번(studentNumber),
이름(studentName),
전화번호(studentMobile),
학과(stuedntMajor)
정보를 저장하는 student_table 생성
*/
create table student_table(
	id bigint,
    studentNumber varchar(8),
    studentName varchar(20),
    studentMobile varchar(20),
    studentMajor varchar(30)
);

select * from student_table;
insert into student_table(id, studentNumber, studentName, studentMobile, studentMajor)
	values (1, '20241111', '학생1', '010-1111-1111', '컴퓨터공학');
    
    create table dept (
    deptno int,
    dname varchar(14),
    loc varchar(13)
);

create table emp (
    empno int,
    ename varchar(10),
    job varchar(9),
    mgr int,
    hiredate date,
    sal int,
    comm int,
    deptno int
);

create table bonus (
    ename varchar(10),
    job varchar(9),
    sal int,
    comm int
);


create table salgrade (
    grade int,
    losal int,
    hisal int
);
    
insert into dept values	(10,'ACCOUNTING','NEW YORK');
insert into dept values (20,'RESEARCH','DALLAS');
insert into dept values (30,'SALES','CHICAGO');
insert into dept values	(40,'OPERATIONS','BOSTON');    

insert into emp values (7369,'SMITH','CLERK',7902, str_to_date('17-12-1980','%d-%m-%Y'),800,NULL,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,str_to_date('20-2-1981','%d-%m-%Y'),1600,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,str_to_date('22-2-1981','%d-%m-%Y'),1250,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,str_to_date('2-4-1981','%d-%m-%Y'),2975,NULL,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,str_to_date('28-9-1981','%d-%m-%Y'),1250,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,str_to_date('1-5-1981','%d-%m-%Y'),2850,NULL,30);
insert into emp values (7782,'CLARK','MANAGER',7839,str_to_date('9-6-1981','%d-%m-%Y'),2450,NULL,10);
insert into emp values (7788,'SCOTT','ANALYST',7566,str_to_date('13-7-87','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7839,'KING','PRESIDENT',NULL,str_to_date('17-11-1981','%d-%m-%Y'),5000,NULL,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,str_to_date('8-9-1981','%d-%m-%Y'),1500,0,30);
insert into emp values (7876,'ADAMS','CLERK',7788,str_to_date('13-7-87','%d-%m-%Y'),1100,NULL,20);
insert into emp values (7900,'JAMES','CLERK',7698,str_to_date('3-12-1981','%d-%m-%Y'),950,NULL,30);
insert into emp values (7902,'FORD','ANALYST',7566,str_to_date('3-12-1981','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7934,'MILLER','CLERK',7782,str_to_date('23-1-1982','%d-%m-%Y'),1300,NULL,10);
		 
insert into salgrade values (1,700,1200);
insert into salgrade values (2,1201,1400);
insert into salgrade values (3,1401,2000);
insert into salgrade values (4,2001,3000);
insert into salgrade values (5,3001,9999);

select * from emp; 
select * from bonus; -- 조회결과 없음
select * from salgrade;
select * from dept;

-- emp 테이블 전체 컬럼 조회
select*from emp;
-- emp 테이블의 empno, ename 컬럼만 조회
select empno, ename from emp;
-- emp테이블의 job 컬럼만 조회
select job from emp;
-- 중복값은 한 번만 조회
select distinct job from emp;
-- 사원 이름 조회(오름차순)정렬
select*from emp order by ename asc;
-- 사원 이름 조회(내림차순)정렬
select*from emp order by ename desc;
-- 급여(sal) 기준 오름차순 정렬
select*from emp order by sal asc;
-- 급여(sal) 기준 내림차순 정렬
select*from emp order by sal desc;
-- 입사일(hiredate) 기준 오름차순 정렬
select*from emp order by hiredate asc;
-- 입사일(hiredate) 기준 내림차순 정렬
select*from emp order by hiredate desc;

-- 정렬 기준이 두가지라면 콤마(,)로 구분
-- 입사일 기준 내림차순 정렬하고 입사일이 같다면 이름 기준 오름차순 정렬
select*from emp order by hiredate desc, ename asc;

-- 조회시 조건: 특정 데이터를 기준으로 조회하고자 할 때 
-- where
-- 직급(job)이 salesman인 사원 조회
select*from emp where job='salesman';
-- 직급(job)이 manager인 사원 조회
select*from emp where job='manager';
-- 부서번호(deptno)가 10 인 사원조회
select*from emp where deptno=10;
-- 이름(ename)이 james 인 사원 조회
select*from emp where ename='james';
-- 사번(empno)이 7654인 사원 조회
select*from emp where empno=7654;

-- 조건이 2가지 이상
-- 직급이 manager 이고 부서번호가 20 인 사원
select*from emp where job='menager' and deptno='20';
-- 직급이 salesman 이거나 clerk 인 사원alter
select*from emp where job='salesman' or job='clerk';
-- 급여가(sal)가 3000 이상인 사원
select * from emp where sal >= 3000;
-- 급여가(sal)가 1000 이상 3000 이하인 사원
-- select *  from emp where 1000 <= sal <= 3000; -> 사용불가능
select* from emp where sal >= 1000 and sal <= 3000;
select * from emp where sal between 1000 and 3000;
-- 급여가 1000 미만이거나 3000 초과인 사원
select * from emp where sal not between 1000 and 3000;
-- 급여가 3000 이하인 사원 
select * from emp where sal <= 3000;
-- 급여가 3000 이하인 사원 조회 결과를 sal 기중으로 오름차순 정렬 
select * from emp where sal <= 3000 order by sal asc;
-- 직급이 salesman이 아닌 사원 
select * from emp where job != 'salesman';
select * from emp where not job = 'salesman';
-- 입사일자(hiredate)가 81 년 4 월 1 일 이후인 사원
select * from emp where hiredate > '1981-04-01';
select * from emp where hiredate > '1981-04-01' order by hiredate asc;
-- str_to_date(): 문자를 날자형으로 변환하는 함수
select * from emp where hiredate > str_to_date('1981-04-01','%Y-%m-%d');

-- like 연산자
-- %는  like 연산자에서만 사용 가능하다.
-- m 뒤에 무언가 붙으면 출력
select * from emp where ename like 'm%';-- martin, mailler
-- m 앞에 무언가 붙으면 출력
select * from emp where ename like '%m';
-- m 앞뒤로 무언가 붙으면 출력
select * from emp where ename like '%m%';--
-- m 앞에 1자리에 무언가 있고 뒤에 무언가 붙어있으면 출력
select * from emp where ename like '_m%';
-- m 앞에 2자리에 무언가 있고 뒤에 무언가 붙어있으면 출력
select * from emp where ename like '__m%';

-- 김씨성의 이름이 3글자인 사원
select * from emp where ename like '김__';
-- 이씨성의 이름이 2글자인 사원
select * from emp where ename like '이_';
-- 이름이 3글자인 사원 중에서 이름 중간에 '가' 가 있는 사원 
select * from emp where ename like '_가_';
select * from emp where ename like '_날씨_';

-- 함수
-- sum(), avg(), max(), min(), count(),
-- 급여 총합
select sum(sal) from emp;
select sum(sal) as '급여총합' from emp;
select sum(sal) from emp where job = 'salesman';
select sum(sal) from emp where job = 'manager';
-- 평균 급여 조회 
select avg(sal) from emp;

-- round() 함수 반올림해주는 함수
-- dual: 문장을 완성하기 위한 가상의 테이블
select round(12.3456,2) from dual;-- 12.35
select round(12.3456,1) from dual;-- 12.3
select round(12.3456,0) from dual;-- 12
select round(12.567,0) from dual;-- 13

-- 평균값을 소수 둘째자리 까지만 조회하려면 
select round(avg(sal),2) from emp ;


-- 가장 많은 급여
select max(sal) from emp;
-- 가장 적은 급여 
select min(sal) from emp;
-- 전체 사원 수 
select count(*) from emp;
-- 부서번호가 20인 사원수
select count(*) from emp where deptno = 20;


-- 그룹화(gruping, 특정 컬럼을 기준으로 동일한 데이터 끼리 묶는 것)
-- 그룹화한 결과를 조회할 때는 그룹화한 컬럼으로 조회만 가능
-- job을 기준으로
-- 그룹화하지 않은 컬럼은 조회 불가능 
select * from emp group by job; -- x
select job, ename from emp group by job; -- x

select job from emp group by job;
-- 직급별로 편균급여
select job , avg(sal) from emp group by job;
-- 직급이 clerk 인 사원들의 평균급여 
select job, avg (sal) from emp where job = 'clerk';
-- 부서별(depno)별 평균 급여
select depno, avg(sal) from emp group by deptno;
-- 직급별 사원수 
select job , count(*) from emp group by job;
-- 직급별 평균급여, 사원수
select job, avg(sal), count(*) from emp group by job;
-- 위 결과에서 직급기준 오름차순 정렬
select job, avg(sal), count(*) from emp group by job order by job asc; 
-- 위의 결과에서 평균 급여 소수 첫째자리 까지 
select job, round(avg(sal),1), count(*) from emp group by job order by job asc; 
-- 위의 결과에서 job은 '직급' 급여 평균값은 '평균급여' 사원수는 '사원수' 로 표편하여 조회
select job as '직급', round(avg(sal),1) as '평균급여', count(*) as '사원수' from emp group by job order by job asc; 

-- 두 개 이상의 컬럼 그룹화 -- 그룹화 한 결과에는 where 사용 불가
-- deptno 를 기준으로 그룹화하고 그 결과에서 job을 기준으로 그룹화
select deptno, job from emp group by deptno, job;
select deptno, job, count(*) from emp group by deptno, job;
select deptno, job, count(*), avg(sal) from emp group by deptno, job;

-- 그룹화한 결과에 조건을 적용한다면 
-- having 
-- 위의 결과에서 평균 급여가 2000 이상인 결과만 조회
select deptno, job, count(*), avg(sal)
	from emp
		group by deptno, job
			having avg(sal) >= 2000;

select deptno, job, count(*), avg(sal)
from emp
	group by deptno, job
		having avg(sal) >= 2000
			order by deptno asc;

-- 급여가 3000 이하인 사원만 가지고 부서별, 직급별 그룹화를 하고 평균급여가 2000 이상인 결과 조회 
select deptno, job, count(*), avg(sal)
	from emp
		where sal <= 3000
			group by deptno, job
				having avg(sal) >= 2000
					order by deptno asc;
                    
/*
	연습문제
	1. 부서별 평균급여, 최고급여, 최저급여, 사원수 조회(평균급여는 소수점 둘째자리에서 반올림)
    2. 직급별 사원수 조회(단 3명 이상인 결과만 출력)
    3. 연도별 입사한 사원수 조회(조회결과 : 연도(yyyy), 사원수)
    3.1. 위의 결과에서 각 연도별로 부서별 입사한 사원수 조회(조회결과 : 연도(yyyy), 부서번호, 사원수)
*/
select  deptno as '부서번호', round(avg(sal),2)as'평균급여', max(sal)as'최고급여', min(sal)as'최저급여', count(*) as'사원수' 
	from emp 
		group by deptno -- 1
			order by deptno asc;
            
select job as '직급', count(*) as '사원수'  -- 2
	from emp 
		group by job having count(*) >= 3;
    
select date_format(hiredate, '%Y')as'연도',count(*)as'사원수'  -- 3
	from emp 
		group by date_format(hiredate, '%Y');
    
select date_format(hiredate, '%Y')as'연도',deptno as '',count(*)as'사원수'  -- 3.1
	from emp 
		group by date_format(hiredate, '%Y'),deptno
			order by date_format(hiredate, '%Y') asc;

-- 조인(join)
-- 두 개 이상의 테이블ㅇ르 하나의 테이블처럼 사용할 때 
select * from emp;
select * from dept;
select * from emp, dept;-- 적절치 못한 조인방법
-- 내부 조인(inner join)
-- 조인하려는 두 테이블에 공통 컬럼이 존재해야 함 
select*from emp, dept where emp.deptno = dept.deptno;
-- 테이블 이름을 줄여서 사용
select*from emp e, dept d where e.deptno = d.deptno;

-- deptno 컬럼은 두테이블에 모두 있기 때문에 ambigiuous 에러
select empno, ename, job, deptno, dname, loc 
	from emp e, dept d where e.deptno = d.deptno;
-- 에러 수정
select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc 
	from emp e, dept d where e.deptno = d.deptno;

-- emp 테이블 전체 조회
select e.* from emp e, dept d where e.deptno = d.deptno;

-- 연습
-- emp, dept를 조인하여 empno,ename, deptno, dname, loc 조회
-- (단, 급여가 2500 이상인 사원만 조회하고, 조회 결과는 사원이름 기준으로 오름차순 정렬)
select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc 
	from emp e, dept d where e.deptno = d.deptno and e.sal >= 2500
		order by e.ename asc;
        
-- 서브쿼리(sub query)
-- 하나의 쿼리문 안에서 다른 쿼리문을 수행하는 것 
-- 최저 급여를 받는 사원의 이름 
select * from emp;
-- 1. 최저급여가 얼마인지; => 800
select min(sal) from emp;
-- 2. 800 급여를 받는 사원이 이름 => smith
select ename from emp where sal=800;
-- 위의 두 문장을 서브쿼리로 
select ename from emp where sal=(select min(sal) from emp);
-- 최고 급여를 받는 사원의 정보 조회
select * from emp where sal = (select max(sal) from emp);
-- allen 보다 높은 급여를 받는 사원 조회 
select ename from emp where sal > (select sal from emp where ename = 'allen');

/*
	연습문제 
    1. clark 보다 늦게 입사한 사원 조회 
    2. 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
    3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회 
    4. martin과 같은 부서 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
*/
-- 1. clark 보다 늦게 입사한 사원 조회 
select * 
	from emp 
		where hiredate > (select hiredate from emp where ename = 'clark' );
-- 2. 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
select ename 
	from emp 
		where deptno = 20 
			and sal > (select avg(sal) from emp);
-- 3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회 
select *
	from emp e, dept d 
		where e.deptno=d.deptno
			and e.deptno = 20 
				and e.sal > (select avg(sal) from emp);
-- 4. martin과 같은 부서 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
select *
	from emp 
		where deptno = (select deptno from emp where ename = 'martin') 
			and sal > (select avg(sal) from emp);
            
-- 제약조건 
-- id, member_email, member_password 컬럼이 있는 테이블
drop table if exists member1;
create table member1(
	id bigint,
    member_email varchar(20),
    member_password varchar(20)
);
select * from member1;
-- 기본 입력시 모든 컬럼과 모든 값입력
insert into member1(id, member_email, member_password)values(1,'aa@aa.com','1234');
-- 모든 컬럼에 값을 다 넣을 때는 컬럼이름 생략가능
insert into member1 values(2,'bb@bb.com','1234');
insert into member1 values(3,'cc@cc.com','1234');
-- 특정 컬럼만 값을 넣을 때는
insert into member1(id,member_email) values(3, 'cc@cc.com');
-- 조건이 안들어 가있으니깐 null값 가능
insert into member1 values(4, 'dd@dd.com',null );

-- not null
drop table if exists member2;
create table member2(
	id bigint not null,
    member_email varchar(20),
    member_password varchar(20)
);
select*from member2;
insert into member2(id, member_email, member_password)values(1,'aa@aa.com','1234');
-- id를 제외하고 나머지 값만 입력
-- id값이 안들어오니깐 에러가 걸린다.
insert into member2(id, member_email, member_password)values('aa@aa.com','1234');
-- id값에 null값이 들어갈수도 없다.
insert into member2(id, member_email, member_password)values(null,'aa@aa.com','1234');
-- 이메일에는 제약이 없기 때문에 에러가 안뜬다.
insert into member2(id, member_email, member_password)values(4,null,'1234');

drop table if exists member3;
create table member3(
	id bigint not null unique, -- unique는 값이 하나만 있어야하는 곳에 씀
    member_email varchar(20) not null,
    member_password varchar(20) not null -- not null은 데이터가 무조건 써야할대 씀
);
insert into member3(id, member_email, member_password)values(1,'aa@aa.com','1234');
-- id값이 같기 때문에 에러 발생
insert into member3(id, member_email, member_password)values(1,'aa@aa.com','1234');
-- 비밀번호 값이 null값으로 지정되어서 에러 발생
insert into member3(id, member_email, member_password)values(2,'aa@aa.com',null);

-- unique
drop table if exists member4;
create table member4(
	id bigint not null unique, -- unique는 값이 하나만 있어야하는 곳에 씀
    member_email varchar(20) not null unique,
    member_password varchar(20) not null, -- not null은 데이터가 무조건 써야할대 씀
    created_at datetime
);
select * from member4;
insert into member4(id, member_email, member_password, created_at)
		values(1,'aa@aa.com','1234',now());
insert into member4(id, member_email, member_password, created_at)
		values(2,'aa@aa.com','1234');

drop table if exists member5;	
create table member5(
	id bigint not null unique, -- unique는 값이 하나만 있어야하는 곳에 씀
    member_email varchar(20) not null unique,
    member_password varchar(20) not null, -- not null은 데이터가 무조건 써야할대 씀
    created_at datetime default now() -- datetime 형식 default now 컬럼작성시 now() 자동 생성
);
select * from member5;
insert into member5(id, member_email, member_password, created_at)
		values(1,'aa@aa.com','1234',now());
insert into member5(id, member_email, member_password)
		values(2,'aa@aa.com','1234');
        
-- primary key
drop table if exists member6;	
create table member6(
	id bigint primary key, -- unique는 값이 하나만 있어야하는 곳에 씀
    member_email varchar(20) not null unique,
    member_password varchar(20) not null, -- not null은 데이터가 무조건 써야할대 씀
    created_at datetime default now() -- datetime 형식 default now 컬럼작성시 now() 자동 생성
);
select * from member6;
insert into member6(id, member_email, member_password)
		values(1,'aa@aa.com','1234');
-- 값이 겹치거나 비어있으면 에가 발생
insert into member6(id, member_email, member_password)
		values(1,'aa@aa.com','1234'); -- x
-- 값이 겹치거나 비어있으면 에가 발생
insert into member6(id, member_email, member_password)
		values('aa@aa.com','1234'); -- x
-- 에러 해결
insert into member6(id, member_email, member_password)
		values(2,'aa@aa.com','1234');

drop table if exists member7;	
create table member7(
	id bigint, -- unique는 값이 하나만 있어야하는 곳에 씀
    member_email varchar(20) not null unique,
    member_password varchar(20) not null, -- not null은 데이터가 무조건 써야할대 씀
    created_at datetime default now(), -- datetime 형식 default now 컬럼작성시 now() 자동 생성
    constraint pk_member7 primary key(id) -- id 에 primary key 를 적용
);
drop table if exists member7;

-- 자동 번호 적용하기 (auto_increment 는 pk 컬럼에만 적용가능)
drop table if exists member8;	
create table member8(
	id bigint auto_increment, -- auto_increment 자동으로 id값이 증가함
    member_email varchar(20) not null unique, -- unique는 값이 하나만 있어야하는 곳에 씀
    member_password varchar(20) not null, -- not null은 데이터가 무조건 써야할대 씀
    created_at datetime default now(), -- datetime 형식... default 컬럼작성시 now() 자동 생성
    -- id2 bigint auto_increment, -- 일반 컬럼에는 지정 불가
    constraint pk_member8 primary key(id) -- id 에 primary key 를 적용
);
select * from member8;
-- auto_increment 를 지정하면 값을 따로 주지 않아도 된다
insert into member6(member_email, member_password) values('aa@aa.com','1234');
insert into member6(member_email, member_password) values('bb@bb.com','1234');



-- ----------------------------
-- 참조관계 
drop table parent1;
create table parent1(
	id bigint primary key,
    p1 varchar (10),
    p2 varchar (20)
);

drop table child1;
create table child1(
	id bigint primary key,
    c1 varchar (10),
    c2 varchar (20),
    p_id bigint, -- 참조할 컬럼 
    -- 외래키 지정 (P_id 컬럼을 parent1 테이블의 id 컬럼을 참조하도록함)
    constraint fk_child1 foreign key(p_id) references parent1(id)
);

insert into parent1(id,p1,p2) values(1,'aa','aa');
insert into parent1(id,p1,p2) values(2,'bb','bb');
insert into parent1(id,p1,p2) values(3,'cc','cc');
insert into parent1(id,p1,p2) values(4,'dd','dd');
select * from parent1;

-- 부모가 가지고 있는 값이 아닐경우 에러발생...예) id 값이 1,2,3 이 아닐경우
insert child1(id, c1, c2, p_id) values(1,'aaa','aaa',1);
-- 부모 id 컬럼에 없는 값을 P-id에 저장 
insert child1(id, c1, c2, p_id) values(2,'bbb','bbb',2);
insert child1(id, c1, c2, p_id) values(3,'ccc','ccc',3); 

-- 부모테이블의 데이터 삭제 
-- id=2인 데이터 한줄을 삭제
-- 자식테이블에 id=2인 데이터를 참조하는 부분이 있기 때문에 삭제 불가
delete from parent1 where id = 2; -- 특정한줄 삭제할때 사용
-- 자식테이블에 id=4 인 데이터를 참조하는 부분이 없기 때문에 삭제가능
delete from parent1 where id = 4;
-- 자식테이블의 부모 id=2를 참조하는 데이터 삭제 
delete from child1 where id = 2;




