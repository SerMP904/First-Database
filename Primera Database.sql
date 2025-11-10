# CREATE DATABASE tienda;
USE tienda;
/*
CREATE TABLE productos (
id INT auto_increment primary key,
nombre varchar(50),
precio decimal(6,2),
stock INT unsigned 
) ;*/
/*
CREATE TABLE clientes(
id int auto_increment primary key,
nombre varchar(50),
email varchar(50)
); */

# ALTER TABLE productos add column categorias varchar(30);
# ALTER TABLE productos CHANGE column categorias categoria varchar(30);
# ALTER TABLE productos DROP column categoria;
ALTER TABLE productos MODIFY column nombre varchar(70);

alter table clientes add column telefono varchar(15);

