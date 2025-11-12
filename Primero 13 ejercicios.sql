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