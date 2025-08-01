### c_ddl >> e_ddl실습 ###

/*
	DB(데이터베이스): 데이터를 저장하는 공간
    DBMS: 데이터를 효율적으로 관리할 수 있는 소프트웨어
    RDBMS: 데이터를 테이블 형태로 저장하고, 테이블 간의 관계를 통해 데이터 관리
    
    - Table(테이블): 데이터가 저장되는 기본 단위
    - Column(열, 속성): 데이터 유형
    - Row(행, 레코드): 고유한 데이터 세트
    - Key(키): 레코드 식별 속성 
    
    == SQL 언어 ==
    : DBMS에서 데이터를 관리하기 위해 사용되는 표준 프로그래밍 언어
    - DDL(정의), DML(조작), DCL(제어)로 분류 
    
    == DDL(Data Definition Language) ==
    : 데이터 정의 언어
    - DB와 테이블의 구조를 생성, 수정, 삭제 
    
    1. create (생성)
    2. alter (수정)
    3. drop (DB와 테이블 삭제 - 구조체 자체의 삭제)
    4. truncate (삭제 - 내부 데이터 삭제 & 구조 유지)
    
    +) use DB명: DB 지정 키워드 
		desc(describe) 테이블명: 테이블 구조 조회 
        show DB명: 해당 SQL 서버 내의 DB(스키마) 목록 조회 
        if exists / if not exists: 존재할 경우 실행 / 존재하지 않을 경우 실행 
        
	== 데이터 타입(DataType) ==
    1. 정수형(tinyint, smallint, int, bigint) + unsigned(부호가 없는 정수)
    2. 문자형(char(개수), varchar(개수))
    3. 실수형(float, double) + decimal
    4. 논리형(true, false)
		- 실제 데이터 저장은 tinyint(1)
        - true(1), false(0)
	4. 날짜형(date, time, datetime)
    6. 열거형(enum)
*/
CREATE DATABASE `baseball_league`;
USE `baseball_league`;
CREATE TABLE `teams` (
	team_id INT,
    name VARCHAR(100),
    city VARCHAR(100),
    founded_year YEAR
);
CREATE TABLE IF NOT EXISTS `players` (
	player_id INT,
    name VARCHAR(100),
    position ENUM('타자', '투수', '내야수', '외야수')
);

DESCRIBE `teams`;
DESC `players`; 

alter table `players`
add birth_date DATE;

DESC `players`;

drop table if exists `games`;
drop table if exists `players`;

drop database `baseball_league`;
	
