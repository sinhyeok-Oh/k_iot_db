### h_트리거 >>> trigger_practice###

USE `baseball_league`;

create table if not exists `player_delete_logs`(
	log_id int auto_increment primary key,
	player_name varchar(8),
    delete_time datetime
);
drop trigger if exists `after_player_delete`;

delimiter $$
create trigger `after_player_delete`
	after delete
    on players
    for each row
begin
	insert into player_insert_logs (player_name, delete_time)
    values (OLD.player_name, now());
end $$
delimiter ;



create table if not exists player_position_logs (
	log_id int auto_increment primary key,
    player_name varchar(10),
    old_positon varchar(50),
    new_positon varchar(50)
);

drop trigger if exists after_player_position_update;

begin
	
    
