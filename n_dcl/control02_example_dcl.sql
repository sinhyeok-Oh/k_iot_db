USE korea_db;

### select 가능 - 권한 있음 ###
select * from members;

### insert 불가 - 권한 없음 ###
insert into members
	(name, gender, area_code, grade, contact, join_date)
values
	('TEST', 'Male', 'JEJU', 'Bronze', '010-0000-0000', '2025-08-04');
    
### 수정 권한 부여 ###
# : 다른 사용자에게 권한을 부여하는 명령 
# - 현재 로그인 된 계정이 해당 권한에 대한 권한이 존재해야 함
-- GRANT INSERT, UPDATE, DELETE ON `korea_db`.`members` TO 'readonly_user'@'localhost';
insert into members
	(name, gender, area_code, grade, contact, join_date)
values
	('TEST', 'Male', 'JEJU', 'Bronze', '010-0000-0000', '2025-08-04');
    
update members
set
	grade = 'Gold'
where
	name = 'TEST';
    
delete from members
where
	name = 'TEST';
    
-- 
delete from purchases
where
	purchase_id = 1;


