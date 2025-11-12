-- Comando para crear una base de datos
CREATE DATABASE Ejercicio1;

-- Seleccionar esa base de datos
USE Ejercicio1;

-- Crear tabla en la base de datos
CREATE TABLE Nacionalidades (
    nacionalidad_id INT AUTO_INCREMENT,
    nombre_nacionalidad VARCHAR(100) NOT NULL,
    PRIMARY KEY (nacionalidad_id)
);
-- Insertar algunos valores de ejemplo en Nacionalidades
INSERT INTO Nacionalidades (nombre_nacionalidad) 
VALUES 
    ('Española'),
    ('Argentina'),
    ('Mexicana'),
    ('Francesa'),
    ('Italiana');
-- Crear la tabla Usuarios con más columnas
CREATE TABLE Usuarios (
    usuario_id INT AUTO_INCREMENT,
    nombre_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_nacimiento DATE,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    estado_activacion BOOLEAN DEFAULT TRUE, 
    nacionalidad_id INT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (usuario_id),
    FOREIGN KEY (nacionalidad_id) REFERENCES Nacionalidades(nacionalidad_id)
);
-- Insertar algunos valores de ejemplo en Usuarios
INSERT INTO Usuarios (nombre_usuario, email, fecha_nacimiento, direccion, telefono, estado_activacion, nacionalidad_id) 
VALUES 
    ('Juan Pérez', 'juan.perez@example.com', '1990-05-15', 'Calle Falsa 123, Madrid', null , TRUE, 1),
    ('Carlos García', 'carlos.garcia@example.com', '1985-08-22', 'Avenida Libertador 456, Buenos Aires', '222333444', TRUE, 2),
    ('María Rodríguez', 'maria.rodriguez@example.com', '1992-12-30', 'Calle 10 de Julio 789, Ciudad de México', '333444555', TRUE, 3),
    ('Sophie Dupont', 'sophie.dupont@example.com', '1988-07-10', 'Rue de Paris 22, París', '666888555', FALSE, 4),
    ('Luca Bianchi', 'luca.bianchi@example.com', '1995-03-25', 'Via Roma 101, Roma', '888999555', TRUE, 5);
    
# 1.Obtener todas las nacionalidades

select nombre_nacionalidad from Nacionalidades;

# 2.Obtener el usuario con id 1

select usuario_id = 1 from Usuarios;

# 3. Obtener los usuarios que no tengan telefono guardado, O SEA VALOR NULL

select * from Usuarios where telefono is NULL;

# 4. Obtener los usuarios cuya dirección contenga "Madrid

select * from Usuarios where direccion like "%Madrid%";

# 5.Obtener el nombre, email del usuario que tenga un telefono que termine en 555

select nombre_usuario as nombre,email from usuarios where telefono like '%555';

# 6.Obtenen el telefono del usuario que empiece por la letra C y termine con a

select telefono from usuarios where nombre_usuario like "CS" and nombre_usuario like "%a";

# 7. Obtener la fecha de nacimiento de los usuarios, y ademas obtener separados el día, el mes y el año

select concat (day(fecha_nacimiento), "-", month(fecha_nacimiento),"-", year(fecha_nacimiento)) from usuarios;

# 8.Obtener la cantidad de usuarios existentes

select count(usuario_id) from usuarios;

# 9. Obtener la cantidad de usuarios que han nacido en el 1985

select year(fecha_nacimiento) from usuarios; 

# 10.Obten el nombre del usuario concatenado al telefono de los usuarios que tengan telefono

select concat(nombre_usuario, "+", telefono) as info from usuarios where telefono is not NULL;

# 11. Obtener la CANTIDAD de usuarios que termine el correo en ".com" (resultado -> 5)

select count(usuarios_id) from usuarios where email like "%.com%";

# 12. Obtener la cantidad de usuarios que no tienen telefono. (RESULTADO -> 1)

select count(usuario_id) from usuarios where telefono is null;

# 13. Obtener la cantidad de usuarios que no tienen telefono O (= A OR) direccion (Resultado -> 1)

select count(usuario_id) from usuarios where telefono is null or direccion is null;

# 14. Poner teléfono NULL al usuario sin teléfono conocido pero con id concreto (id=1).
 
update usuarios set telefono = NULL where usuario_id =1;
 
# 15. Actualizar la dirección de “Juan Pérez” a “Calle Mayor 10, Madrid”.
 
update usuarios set direccion = 'Calle-Mayor-10, Madrid' where nombre_usuario= 'Juan Pérez';
select * from usuarios;
 
# 16. Desactivar (estado_activacion = FALSE) a todos los usuarios cuya dirección contenga “París”.
 
update usuarios set direccion = 'Paris' where estado_activacion =false;
select * from usuarios;
 
# 17. Cambiar el email de “Carlos García” a “carlos.garcia@midominio.com”.
 
update usuarios set email = 'carlos.garcia@midominio.com' where nombre_usuario= 'Carlos Garcia';
select * from usuarios;
 
# 18. Marcar como inactivo a los usuarios sin teléfono (telefono IS NULL).
 
update usuarios set estado_activacion= false where telefono is null;
select * from usuarios;
 
# 19. Añadir el prefijo “España - ” al inicio de la dirección de quienes vivan en Madrid.
 
update usuarios set direccion = concat( "España - ", direccion) where direccion like "%Madrid%";
select * from usuarios;
 
# 20. Añadir el prefijo internacional +34 a teléfonos que empiecen por “6” o “7” y no lo tengan ya.
 
update usuarios set telefono = concat("+ 34 ", telefono) where telefono like "6%" or telefono like "%7" and telefono like "+34%";
select * from usuarios;
 
# 21. Cambiar el dominio de todos los correos “@example.com” a “@correo.com”.
 
update usuarios set email=replace( email, "@example.com", "@correo.com");

# DELETE
# 15. Eliminar usuarios con email que termine en “@spam.com”.
 
delete from usuarios where email like "%@spam.com";
# 16. Eliminar usuarios sin teléfono ni dirección (ambos NULL).
 
delete from usuarios where telefono is null or direccion is null;
# 17. Eliminar usuarios inactivos (estado_activacion = FALSE).
 
delete from usuarios where estado_activacion= false;
# 18. Eliminar usuarios cuya dirección contenga “Falsa”.
 
delete from usuarios where direccion like "%falsa%";
# 19. Eliminar usuarios nacidos antes de 01-01-1988.
 
delete from usuarios where fecha_nacimiento < "1988-01-01";
# 20. Eliminar usuarios sin nacionalidad asignada (nacionalidad_id IS NULL).
 
delete from usuarios where nacionalidad_id is null;

select * from nacionalidades;
select * from usuarios;

#Crea una vista llamada vista_activos que muestre únicamente el nombre y el email de los usuarios activos (estado_activacion = TRUE).

create view vista_activos as 
select nombre_usuario, email 
from usuarios 
where estado_activacion = true;

select * from vista_activos;

create view vista_usuario_nacionalidad as
select u.nombre_usuario, n.nombre_nacionalidad 
from usuarios u 
inner join nacionalidades n on u.nacionalidad_id = n.nacionalidad_id;

select * from vista_usuario_nacionalidad;

#Crea una vista llamada vista_sin_telefono que muestre el nombre y email de los usuarios que no tienen teléfono (telefono IS NULL).

create view vista_sin_telefono as
select u.nombre_usuario, u.email from usuarios u where telefono is null;

select * from vista_sin_telefono;

delimiter //
create function edad_usuario(cumple date)
returns int
deterministic
begin
	declare edad int;
    set edad = year(curdate()) - year(cumple);
    return edad;
end //
delimiter ;

select nombre_usuario, edad_usuario(fecha_nacimiento) as edades from usuarios; 

#Crea una función llamada info_usuario que reciba un nombre y una nacionalidad y devuelva un texto como 'Juan Pérez es de nacionalidad Española'. 

delimiter //
create function info_usuario(nombre varchar(100), nacion varchar(100))
returns varchar(250)
deterministic
begin
    return concat(nombre, " es de nacionalidad ", nacion);
end //
delimiter ;

select info_usuario(u.nombre_usuario, n.nombre_nacionalidad) 
as de_donde_es 
from usuarios u 
inner join nacionalidades n on u.nacionalidad_id = n.nacionalidad_id;

#Crea un procedimiento llamado mostrar_activos que muestre el nombre y correo de los usuarios activos.

delimiter //
create procedure mostrar_activos()
begin
	select nombre_usuario as Nombre, email as Email
	from usuarios 
	where estado_activacion = true;
end //
delimiter ;

call mostrar_activos();

delimiter //
create procedure mostrar_nacionalidades()
begin
	select n.nombre_nacionalidad, count(u.nombre_usuario) as cantidad
    from usuarios u 
    inner join nacionalidades n on u.nacionalidad.id = n.nacionalidad_id 
    group by n.nombre_nacionalidad;
end //
delimiter ; 

call mostrar_nacionalidades();

###Crear un procedimiento almacenado para insertar un nuevo usuario y que devuelva el id del usuario creado.
 
Delimiter //
create procedure alta_usuario(
in p_nombre varchar(50), 
in p_email varchar(100),
in p_fecha_nacimiento date,
in p_direccion varchar (255),
in p_telefono varchar(20),
in p_estado_activacion boolean,
in p_nacionalidad_id int,
out p_nuevo_id int
)
Begin
	insert into Usuarios(nombre_usuario, email, fecha_nacimiento, direccion, telefono, estado_activacion, nacionalidad_id) values(
	p_nombre,
	p_email,
	p_fecha_nacimiento,
	p_direccion,
	p_telefono,
	p_estado_activacion,
	p_nacionalidad_id);
set p_nuevo_id = last_insert_id();
end //
delimiter ;
 
set @nuevo_id := null;
 
call alta_usuario('alejandro','alejandro@email.es','1980-09-16','calle cilla, 1', '666666666', true, 1, @nuevo_id);
 
select * from Usuarios;
 
 


