select t.riwi_id, concat(t.riwi_name, ' ', t.riwi_lastname) as technician_name, count(wo.riwi_id) as total_orders
from riwi_techniques t
left join riwi_branches b on b.riwi_id_technique = t.riwi_id
left join riwi_work_orders wo on wo.riwi_id_branch = b.riwi_id
group by t.riwi_id, t.riwi_name, t.riwi_lastname
order by total_orders desc;



select c.riwi_name as city_name, count(wo.riwi_id) as total_services
from riwi_cities c
join riwi_clients cl on cl.riwi_id_city = c.riwi_id
join riwi_work_orders wo on wo.riwi_id_client = cl.riwi_id
group by c.riwi_id, c.riwi_name
order by total_services desc;


select st.riwi_name as service_type, count(wo.riwi_id) as total_requests
from riwi_service_types st
left join riwi_work_orders wo on wo.riwi_id_service = st.riwi_id
group by st.riwi_id, st.riwi_name
order by total_requests desc;


select e.riwi_name as equipment_name, count(wo.riwi_id) as maintenance_count
from riwi_equipments e
join riwi_work_orders wo on wo.riwi_id_equipment = e.riwi_id
group by e.riwi_id, e.riwi_name
order by maintenance_count desc;


select b.riwi_name as branch_name, count(wo.riwi_id) as managed_orders
from riwi_branches b
left join riwi_work_orders wo on wo.riwi_id_branch = b.riwi_id
group by b.riwi_id, b.riwi_name
order by managed_orders desc;


create view riwi_complete_operational_report as
select 
    wo.riwi_id as order_id,
    wo.riwi_work_order_code as work_order,
    cl.riwi_name as client_name,
    ci.riwi_name as city_name,
    b.riwi_name as branch_name,
    concat(t.riwi_name, ' ', t.riwi_lastname) AS technician_name,
    e.riwi_name as equipment_name,
    cat.riwi_name as equipment_category,
    st.riwi_name as service_type,
    wo.riwi_service_date as service_date,
    wo.riwi_hours as hours,
    wo.riwi_cost as cost
from riwi_work_orders wo
left join riwi_clients cl on wo.riwi_id_client = cl.riwi_id
left join riwi_cities ci on cl.riwi_id_city = ci.riwi_id
left join riwi_branches b on wo.riwi_id_branch = b.riwi_id
left join riwi_techniques t on b.riwi_id_technique = t.riwi_id
left join riwi_equipments e on wo.riwi_id_equipment = e.riwi_id
left join riwi_categories cat on e.riwi_id_category = cat.riwi_id
left join riwi_service_types st on wo.riwi_id_service = st.riwi_id;


select * from riwi_complete_operational_report 
order by work_order asc;
