# TechCare-Solutions-Riwi-S.A.S
Organization about orders data, using sql and applying everything learned


# TechCare Solutions - Database Normalization Project

## Project Description
This repository contains the professional relational database migration and implementation for **TechCare Solutions Riwi S.A.S.**, a company specializing in preventive and corrective maintenance services for technological equipment nationwide. 

The main objective of this project was to transform a legacy flat-file data structure (a shared Excel sheet) into a fully normalized, high-performance relational database management system (RDBMS) to resolve severe data anomalies such as duplicates, spelling inconsistencies, untracked work hours, and analytical constraints.

---

## Technologies Used
*   **Database Engine:** MySQL Server (v8.0+)
*   **Modeling Tools:** Draw.io / MySQL Workbench
*   **Language:** SQL (DDL, DML)
*   **Documentation Language:** English (as required by technical specifications)

---

## Database Engine
The solution was designed and tested using **MySQL**, leveraging its robust handling of relational constraints (`on update cascade`, `on delete set null / restrict`), support for indexing, transactional integrity, and efficient stored procedures execution.

---

## Explanation of the Normalization Process

The transformation from the raw Excel spreadsheet to the relational database structure followed the rules of the **Third Normal Form (3FN)**:

### 1. Initial State & Anomalies Detected (Unnormalized Form - UNF)
The spreadsheet stored all atomic records in a single table, resulting in:
*   **Redundancy:** Client names (`Acme Ltd` vs `ACME LTDA`), cities (`Bucaramanga` vs `B/manga`), and service types (`Preventive` vs `Preventive Maintenance`) were duplicated with varying character patterns.
*   **Update Anomalies:** Changing a technician's name required updating dozens of repeated rows.
*   **Insertion Anomalies:** A new city or equipment category could not be recorded unless a work order was generated.

### 2. First Normal Form (1FN)
*   All attributes were reduced to atomic values.
*   Repeating groups were eliminated.
*   A composite candidate key was identified to uniquely distinguish rows, and clear data types were assigned to each field.

### 3. Second Normal Form (2FN)
*   Every non-key attribute was checked to ensure **full functional dependency** on the primary key.
*   Attributes that depended only on a part of the operational data were split into independent master tables: `riwi_clients`, `riwi_techniques`, `riwi_equipments`, and `riwi_branches`.

### 4. Third Normal Form (3FN)
*   **Transitive dependencies** were eliminated. 
*   `City` was separated from `Client` because a city exists independently of a corporate client.
*   `Category` was isolated from the `Equipment` descriptive model.
*   The final transactional hub table (`riwi_work_orders`) now exclusively retains numerical foreign key identifiers pointing back to clean master registries.

---

## Database Structure

All database components incorporate the required corporate naming convention prefix: **`riwi_`**.

### Master Tables
1.  **`riwi_cities`:** Centralizes approved geographical territories.
2.  **`riwi_categories`:** Classifies hardware equipment groups.
3.  **`riwi_service_types`:** Standardizes technical interventions.
4.  **`riwi_techniques`:** Stores internal field engineering staff profiles.

### Relational / Operational Tables
5.  **`riwi_clients`:** Maps corporate accounts to their legal operating city (`riwi_id_city`).
6.  **`riwi_equipments`:** Maps operational hardware to their parent classifications (`riwi_id_category`).
7.  **`riwi_branches`:** Tracks business offices and sets the primary technician assigned to each field branch (`riwi_id_technique`).

### Central Transactional Hub
8.  **`riwi_work_orders`:** The core operational ledger. Connects equipment, branches, clients, and services while tracking the actual service date, execution hours, and financial ticket costs.

---

## Database creation instructions


* To create the data base we need to type the next script:
**`create database database_name;`**

* Following that we need to use that created database using the next script:
**`use database_name;`**

This way, we can start using the database to insert data, modify structures, or do whatever else you need to do—you'll be able to carry it out by following the previous steps.

---

## Developer Information

Camilo Andres Villalobos Ruiz - Clan Cumbia
