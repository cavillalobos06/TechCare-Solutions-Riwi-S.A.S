insert into riwi_cities (riwi_name) values 
('Bogotá'), ('Medellín'), ('Cali'), ('Barranquilla'), ('Cartagena'), 
('Bucaramanga'), ('Pereira'), ('Cúcuta'), ('Manizales'), ('Santa Marta');


insert into riwi_clients (riwi_name, riwi_id_city) values
('Acme LTDA', 1), ('Innova S.A.S', 2), ('NovaTech', 3), ('BioHealth', 4), ('Soft Corp', 5),
('Vision S.A', 7), ('Retail One', 6), ('Edu Center', 8), ('Health Plus', 9), ('Mega Foods', 10);


insert into riwi_techniques (riwi_name, riwi_lastname) values
('Juan', 'Pérez'), ('María', 'Gómez'), ('Carlos', 'Ruiz'), ('Laura', 'Díaz'), ('Andrés', 'Mora');


insert into riwi_categories (riwi_name) values 
('Laptop'), ('Desktop'), ('Network'), ('Printer');


insert  into riwi_equipments (riwi_name, riwi_id_category) values
('Dell Latitude 5420', 1), ('HP Pro Desk', 2), ('Cisco Switch 2960', 3), ('Canon Printer', 4), ('Lenovo ThinkPad', 1);


insert into riwi_branches (riwi_name, riwi_id_technique) values
('North Office', 1), ('HeadQuarters', 2), ('West Branch', 3), ('Main Office', 4), 
('Coffee Branch', 1), ('East Office', 2), ('Central Office', 4), ('Caribbean', 5);


insert into riwi_service_types (riwi_name) values 
('Preventive'), ('Corrective'), ('Installation'), ('Repair');


insert into riwi_work_orders (riwi_work_order_code, riwi_id_equipment, riwi_id_branch, riwi_id_client, riwi_id_service, riwi_service_date, riwi_hours, riwi_cost) values
('WO1001', 1, 1, 1, 1, '2026-05-01', 2, 120),
('WO1002', 1, 1, 1, 1, '2026-05-02', 3, 180),
('WO1003', 2, 2, 2, 2, '2026-05-03', 4, 250),
('WO1004', 2, 2, 2, 4, '2026-05-04', 2, 150),
('WO1005', 3, 3, 3, 3, '2026-05-05', 5, 500),
('WO1006', 3, 3, 3, 3, '2026-05-06', 4, 450),
('WO1007', 4, 4, 4, 2, '2026-05-07', 2, 130),
('WO1008', 4, 4, 4, 4, '2026-05-08', 3, 200),
('WO1009', 5, 5, 5, 1, '2026-05-09', 2, 140),
('WO1010', 5, 5, 5, 1, '2026-05-10', 3, 190),
('WO1011', 2, 5, 6, 3, '2026-05-11', 6, 550),
('WO1012', 2, 5, 6, 3, '2026-05-12', 5, 520),
('WO1013', 1, 6, 7, 2, '2026-05-13', 2, 160),
('WO1014', 1, 6, 7, 4, '2026-05-14', 3, 210),
('WO1015', 3, 7, 8, 1, '2026-05-15', 2, 125),
('WO1016', 3, 7, 8, 1, '2026-05-16', 2, 135),
('WO1017', 4, 7, 9, 3, '2026-05-17', 4, 400),
('WO1018', 4, 7, 9, 3, '2026-05-18', 5, 430),
('WO1019', 5, 8, 10, 2, '2026-05-19', 3, 220),
('WO1020', 5, 8, 10, 4, '2026-05-20', 4, 260);



insert into riwi_clients (riwi_name, riwi_id_city) values ('Riwi Company', 1);


insert into riwi_work_orders (riwi_work_order_code, riwi_id_equipment, riwi_id_branch, riwi_id_client, riwi_id_service, riwi_service_date, riwi_hours, riwi_cost) 
values ('WO1021', 1, 1, last_insert_id(), 1, '2026-07-06', 3, 250);




update riwi_techniques 
set riwi_name = 'Camilo', riwi_lastname = 'Ruiz' 
where riwi_id = 3;



delete from riwi_equipments 
where riwi_id = 5 and riwi_id not in (select distinct riwi_id_equipment from riwi_work_orders where riwi_id_equipment is not null);
