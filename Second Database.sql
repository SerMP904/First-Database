# JOINS
 
CREATE DATABASE tienda_joins;
 
Use tienda_joins;
 
CREATE TABLE clientes (

id INT auto_increment primary key,

nombre varchar(50),

apellido varchar(100),

dni varchar(9)

);
 
CREATE TABLE pedidos (

id_pedido INT auto_increment primary key,

id_cliente INT,

fecha DATE,

total decimal(7,2),

foreign key (id_cliente) references clientes(id)

);
 
INSERT INTO clientes (nombre) values ("Luis"), ("Alejandro"), ("Vanessa");

Select *  from clientes;
 
INSERT INTO pedidos (id_cliente,fecha, total) values

(1, '2025-10-25', 120.5), (1, '2025-11-02', 45.00),(2, '2025-11-03', 80.00);

Select *  from pedidos;

INSERT INTO pedidos (fecha, total) values ("2025-09-25", 45.50);
 
select nombre from clientes;
select fecha, total from pedidos;

select c.nombre, p.fecha, p.total from clientes c
inner join pedidos p on c.id = p.id_cliente;

select * from clientes c
left join pedidos p on c.id = p.id_cliente;

select * from clientes c
right join pedidos p on c.id = p.id_cliente;

insert into pedidos (fecha, total) values("2025-09-08",45.50);

select * from pedidos;
select * from clientes;

# 28. Nombre del cliente y su total gastado (SUM) ordenado de forma descendente

select c.nombre, sum(p.total) as dineros from clientes c inner join pedidos p on c.id = p.id_cliente group by c.id, c.nombre;

# 29. Cliente con más pedidos. Tip: Usar Limit 1

select c.nombre, count(p.total) as dineros from clientes c inner join pedidos p on c.id = p.id_cliente group by c.id, c.nombre limit 1;

# 30. Mostrar todos los clientes, tengan o no pedidos.

select c.nombre, count(p.total) as dineros from clientes c left join pedidos p on c.id = p.id_cliente group by c.id, c.nombre;

# 31. Mostrar todos los clientes que han gastado más de 100€ (HAVING). Tip: Debes agrupar por nombre para sumar sus cantidades

select c.nombre, sum(p.total) as dineros from clientes c inner join pedidos p on c.id = p.id_cliente group by c.id, c.nombre having sum(p.total) > 100;