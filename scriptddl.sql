create database bd_camilo_villalobos_cumbia;

use bd_camilo_villalobos_cumbia;


create table riwi_cities(
	riwi_id int primary key auto_increment,
    riwi_name varchar(50) not null unique
);


create table riwi_clients(
	riwi_id int primary key auto_increment,
    riwi_name varchar(50) not null unique,
    riwi_id_city int not null,
    foreign key (riwi_id_city)
    references riwi_cities(riwi_id)
    on update cascade
    on delete cascade
);


create table riwi_techniques(
	riwi_id int primary key auto_increment,
    riwi_name varchar(50) not null,
    riwi_lastname varchar(50) not null,
    constraint riwi_unique_technician unique (riwi_name, riwi_lastname)
);


create table riwi_categories(
	riwi_id int primary key auto_increment,
    riwi_name varchar(50) not null unique
);


create table riwi_equipments(
    riwi_id int primary key auto_increment,
    riwi_name varchar(100) not null unique,
    riwi_id_category int,
    foreign key(riwi_id_category)
    references riwi_categories(riwi_id)
    on update cascade
    on delete set null
);


create table riwi_branches(
	riwi_id int primary key auto_increment,
    riwi_name varchar(50) not null unique,
    riwi_id_technique int,
    foreign key (riwi_id_technique)
    references riwi_techniques(riwi_id)
    on update cascade
    on delete set null
);


create table riwi_service_types(
	riwi_id int primary key auto_increment,
    riwi_name varchar(50) not null unique
);


create table riwi_work_orders (
	riwi_id int primary key auto_increment,
    riwi_work_order_code varchar(20) not null unique,
    riwi_id_equipment int,
    
    foreign key (riwi_id_equipment)
    references riwi_equipments(riwi_id)
    on update cascade 
    on delete set null,
    
    riwi_id_branch int,
    
	foreign key (riwi_id_branch)
    references riwi_branches(riwi_id)
    on update cascade
    on delete set null,
    
    riwi_id_client int,
    
    foreign key (riwi_id_client)
    references riwi_clients(riwi_id) 
    on update cascade
    on delete set null,
    
    riwi_id_service int,
    
    foreign key (riwi_id_service) 
    references riwi_service_types(riwi_id) 
    on update cascade 
    on delete set null,
    
    riwi_service_date date not null,
    riwi_hours tinyint not null check (riwi_hours > 0),
    riwi_cost decimal(10,2) not null check (riwi_cost >= 0)
        
);
