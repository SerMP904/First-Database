create database codespaceacademy;

use codespaceacademy; 

# CodeSpaceAcademy
 /*
## Objetivo
Diseñar y construir una base de datos relacional sencilla para gestionar cursos, estudiantes y matrículas de una academia, aplicando claves primarias, foráneas y borrado/actualización en cascada. Poblarla con datos de ejemplo y comprobar su correcto funcionamiento mediante consultas
 
## Tareas iniciales
1. Crear la base de datos
    - Nombre: CodeSpaceAcademy
2. Crear las tablas(en este orden)
    - Courses
        - course_id INT AUTO_INCREMENT PK
        - course_name VARCHAR(100) NOT NULL
        - price DECIMAL(10,2) NOT NULL
        - duration VARCHAR(50) ← (guarda la cantidad como texto, p. ej. "3")
        - schedule VARCHAR(50) ← (p. ej. "Morning", "Afternoon", "Evening")
        - difficulty VARCHAR(20) ← (p. ej. "Beginner", "Intermediate", "Advanced")
    - Students
        - student_id INT AUTO_INCREMENT PK
        - first_name VARCHAR(50) NOT NULL
        - last_name VARCHAR(50) NOT NULL
        - dni VARCHAR(20) NOT NULL
        - phone VARCHAR(20)
        - email VARCHAR(100)
        - date_of_birth DATE
    - Enrollments
        - enrollment_id INT AUTO_INCREMENT PK
        - student_id INT FK → Students(student_id) (ON DELETE/UPDATE CASCADE)
        - course_id INT FK → Courses(course_id) (ON DELETE/UPDATE CASCADE)
        - year_enrolled INT
3. Insertar datos de prueba.
    - Insertar excatamente los datos del apartado: "Datos a insertar"
4. Validaciones obligatorias (ejecutar y guardar resultados)
    - Contar filas:
        ```
        - SELECT COUNT(*) FROM Courses; → debe devolver 11.
        - SELECT COUNT(*) FROM Students; → debe devolver 11.
        - SELECT COUNT(*) FROM Enrollments; → debe devolver 30.
        ```
    - Probar la integridad referencial con la siguiente consulta:
        ```
        SELECT e.enrollment_id, s.first_name, s.last_name, c.course_name, e.year_enrolled
        FROM Enrollments e
        JOIN Students s ON s.student_id = e.student_id
        JOIN Courses  c ON c.course_id  = e.course_id
        LIMIT 5;
        ```
## Datos a insertar
    -  Tabla Courses (course_name, price, duration, schedule, difficulty)
    ```
    ('Mathematics', 99.99, '3', 'Morning', 'Intermediate'),
    ('English Grammar', 129.99, '6', 'Afternoon', 'Advanced'),
    ('Computer Science', 149.99, '4', 'Evening', 'Intermediate'),
    ('Art History', 79.99, '2', 'Morning', 'Beginner'),
    ('Physics', 119.99, '5', 'Evening', 'Advanced'),
    ('Chemistry', 109.99, '3', 'Afternoon', 'Intermediate'),
    ('Computer Science', 89.99, '4', 'Morning', 'Beginner'),
    ('Literature', 69.99, '2', 'Evening', 'Intermediate'),
    ('History', 99.99, '6', 'Morning', 'Advanced'),
    ('Cybersecurity', 119.99, '6', 'Morning', 'Advanced'),
    ('Computer Science', 79.99, '5', 'Afternoon', 'Beginner')
    ```
    - Tabla Students (first_name, last_name, dni, phone, email, date_of_birth)
    ```
    ('John', 'Doe', '123456789A', '555-1234', 'john@example.com', '1998-05-10'),
    ('Jane', 'Smith', '987654321B', '555-5678', 'jane@example.com', '2000-02-15'),
    ('Michael', 'Johnson', '456789012C', '555-2468', 'michael@example.com', '1997-09-22'),
    ('Emma', 'Brown', '789012345D', '555-1357', 'emma@example.com', '1999-11-30'),
    ('Daniel', 'Taylor', '234567890E', '555-9876', 'daniel@example.com', '2001-07-05'),
    ('Olivia', 'Lee', '345678901F', '555-5432', 'olivia@example.com', '1995-04-18'),
    ('William', 'Wilson', '678901234G', '555-7890', 'william@example.com', '1996-12-25'),
    ('Sophia', 'Anderson', '890123456H', '555-4321', 'sophia@example.com', '1994-10-31'),
    ('Matthew', 'Davis', '567890123I', '555-2109', 'matthew@example.com', '2002-08-08'),
    ('Iván', 'Moreno Villena', '467890123I', '555-2109', 'ivan@example.com', '2002-08-08'),
    ('Isabella', 'Clark', '012345678J', '555-8765', 'isabella@example.com', '2003-03-17')
    ```
    -Tabla Enrollments (student_id, course_id, year_enrolled)
    ```
    (1, 2, 2023), (2, 1, 2021), (3, 3, 2022), (4, 4, 2021), (5, 5, 2023), (6, 6, 2020),
    (7, 7, 2018), (8, 8, 2021), (9, 9, 2013), (10, 10, 2023), (1, 3, 2023), (2, 4, 2022),
    (3, 5, 2021), (4, 6, 2023), (5, 7, 2022), (6, 8, 2021), (7, 9, 2023), (8, 10, 2022),
    (9, 1, 2021), (10, 2, 2023), (5, 3, 2022), (8, 6, 2020), (10, 4, 2023), (3, 8, 2021),
    (6, 9, 2022), (2, 5, 2023), (7, 7, 2020), (9, 2, 2021), (1, 10, 2023), (4, 1, 2022)
    ```
## Consultas a realizar
1. Mostrar los cursos en orden ascendente según su precio
2. Encuentra el número total de estudiantes matriculados en cada curso ordenados de mayor a menor.
3. Mostrar los nombres y correos electrónicos de todos los estudiantes.
4. Obtener los cursos y sus precios mayores a $80.
5. Mostrar los cursos en los que la duración sea de 4 meses.
6. Mostrar los estudiantes que han nacido en el 1998.
7. Seleccionar los alumnos cuyo nombre empieza por 'J'.
8. Mostrar los alumnos cuyo número de DNI contiene '12'.
9. Calcula la duración promedio de los cursos.
10. Obtener la cantidad de cursos que ha realizado el alumno 'Jhon'.
11. Obtener el nombre y apellidos de los estudiantes matriculados en el curso de "Computer Science".
12. Obtener el precio medio de los cursos por horario.
13. Obtén el curso más antiguo.
14. Obtener el nombre y apellidos de los estudiantes que se matricularon en algún curso en el año 2021.
15. Obtener el nombre del curso y su precio que se hayan matriculado en 2022 y tengan horario de mañana.
16. Obtener el gasto de cada uno de los alumnos, es decir, la suma total del precio de los cursos en los que se ha matriculado .
17. Mostrar los cursos en orden ascendente según su precio.
18. Crear una función para obtener el precio medio (sin decimales)  de todos los cursos. Tip: Para redondear sin decimales usar Round()
19. Crear un procedimiento almacenado para mostrar el nombre y la cantidad de cursos de cada dificultad, ordenados por la cantidad de cursos de manera descendente.
20. Crear una vista llamada getAdvancedStudents para obtener el nombre y apellidos y la dificultad(nivel) de los estudiantes que se han matriculado en algún curso de nivel "Advanced" ordenada por nombre de forma ascendente.
*/

create table courses(
	course_id INT AUTO_INCREMENT PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	duration VARCHAR(50),
	schedule VARCHAR(50),
	difficulty VARCHAR(20)
);

create table students (
	student_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	dni VARCHAR(20) NOT NULL,
	phone VARCHAR(20),
	email VARCHAR(100),
	date_of_birth DATE
); 

create table enrollments (
	enrollment_id INT AUTO_INCREMENT ,
	student_id INT,
    course_id INT,
    year_enrolled INT,
    PRIMARY KEY(enrollment_id),
    foreign key (course_id) references courses(course_id) on delete cascade on update cascade,
    foreign key (student_id) references students(student_id) on delete cascade on update cascade
);

insert into courses (course_name, price, duration, schedule, difficulty) values
	('Mathematics', 99.99, '3', 'Morning', 'Intermediate'),
    ('English Grammar', 129.99, '6', 'Afternoon', 'Advanced'),
    ('Computer Science', 149.99, '4', 'Evening', 'Intermediate'),
    ('Art History', 79.99, '2', 'Morning', 'Beginner'),
    ('Physics', 119.99, '5', 'Evening', 'Advanced'),
    ('Chemistry', 109.99, '3', 'Afternoon', 'Intermediate'),
    ('Computer Science', 89.99, '4', 'Morning', 'Beginner'),
    ('Literature', 69.99, '2', 'Evening', 'Intermediate'),
    ('History', 99.99, '6', 'Morning', 'Advanced'),
    ('Cybersecurity', 119.99, '6', 'Morning', 'Advanced'),
    ('Computer Science', 79.99, '5', 'Afternoon', 'Beginner');

insert into students (first_name, last_name, dni, phone, email, date_of_birth) values
    ('John', 'Doe', '123456789A', '555-1234', 'john@example.com', '1998-05-10'),
    ('Jane', 'Smith', '987654321B', '555-5678', 'jane@example.com', '2000-02-15'),
    ('Michael', 'Johnson', '456789012C', '555-2468', 'michael@example.com', '1997-09-22'),
    ('Emma', 'Brown', '789012345D', '555-1357', 'emma@example.com', '1999-11-30'),
    ('Daniel', 'Taylor', '234567890E', '555-9876', 'daniel@example.com', '2001-07-05'),
    ('Olivia', 'Lee', '345678901F', '555-5432', 'olivia@example.com', '1995-04-18'),
    ('William', 'Wilson', '678901234G', '555-7890', 'william@example.com', '1996-12-25'),
    ('Sophia', 'Anderson', '890123456H', '555-4321', 'sophia@example.com', '1994-10-31'),
    ('Matthew', 'Davis', '567890123I', '555-2109', 'matthew@example.com', '2002-08-08'),
    ('Iván', 'Moreno Villena', '467890123I', '555-2109', 'ivan@example.com', '2002-08-08'),
    ('Isabella', 'Clark', '012345678J', '555-8765', 'isabella@example.com', '2003-03-17');
    
insert into enrollments (student_id, course_id, year_enrolled) values 
	(1, 2, 2023), (2, 1, 2021), (3, 3, 2022), (4, 4, 2021), (5, 5, 2023), (6, 6, 2020),
    (7, 7, 2018), (8, 8, 2021), (9, 9, 2013), (10, 10, 2023), (1, 3, 2023), (2, 4, 2022),
    (3, 5, 2021), (4, 6, 2023), (5, 7, 2022), (6, 8, 2021), (7, 9, 2023), (8, 10, 2022),
    (9, 1, 2021), (10, 2, 2023), (5, 3, 2022), (8, 6, 2020), (10, 4, 2023), (3, 8, 2021),
    (6, 9, 2022), (2, 5, 2023), (7, 7, 2020), (9, 2, 2021), (1, 10, 2023), (4, 1, 2022);



select * from students;
select * from courses;
select * from enrollments;

#1. Mostrar los cursos en orden ascendente según su precio
select course_name from courses order by price desc;

#2. Encuentra el número total de estudiantes matriculados en cada curso ordenados de mayor a menor.
select course_name, count(course_name) as numero_mat
from courses c 
inner join enrollments e on c.course_id = e.course_id 
group by course_name
order by numero_mat desc;

#3. Mostrar los nombres y correos electrónicos de todos los estudiantes.
select first_name, email from students;

#4. Obtener los cursos y sus precios mayores a $80.
select course_name, price from courses where price > 80 order by price desc;

#5. Mostrar los cursos en los que la duración sea de 4 meses.
select course_name, duration from courses where duration > 4 order by duration desc;

#6. Mostrar los estudiantes que han nacido en el 1998.
select first_name, date_of_birth from students where year(date_of_birth) = 1998 order by first_name desc;

#7. Seleccionar los alumnos cuyo nombre empieza por 'J'.
select first_name from students where first_name like "J%";

#8. Mostrar los alumnos cuyo número de DNI contiene '12'.
select first_name, dni from students where dni like "%12%";

#9. Calcula la duración promedio de los cursos.
select course_name, avg(duration) from courses group by course_name;

#10. Obtener la cantidad de cursos que ha realizado el alumno 'John'.
select first_name, count(course_name) as number_of_courses
from students s
inner join enrollments e on  e.student_id = s.student_id
inner join courses c on c.course_id = e.student_id
where first_name = "John";

#11. Obtener el nombre y apellidos de los estudiantes matriculados en el curso de "Computer Science".
select first_name as nombre, last_name as apellidos
from students s
inner join enrollments e on  e.student_id = s.student_id
inner join courses c on c.course_id = e.student_id
where c.course_name = "Computer Science"
group by s.student_id;

#12. Obtener el precio medio de los cursos por horario.
select avg(price) as promedio from courses group by schedule;

#13. Obtén el curso más antiguo.
select course_name, year_enrolled as curso_más_antiguo
from courses c
inner join enrollments e on e.course_id = c.course_id 
order by e.year_enrolled asc
limit 1;

#14. Obtener el nombre y apellidos de los estudiantes que se matricularon en algún curso en el año 2021.
select first_name, last_name
from students s
inner join enrollments e on e.student_id = s.student_id 
where year_enrolled = 2013;

#15. Obtener el nombre del curso y su precio que se hayan matriculado en 2022 y tengan horario de mañana.
select first_name as nombre, course_name as curso, price as precio
from students s
inner join enrollments e on  e.student_id = s.student_id
inner join courses c on c.course_id = e.student_id
where e.year_enrolled = 2022 and schedule = "Morning"
group by s.student_id;

#16. Obtener el gasto de cada uno de los alumnos, es decir, la suma total del precio de los cursos en los que se ha matriculado .
select first_name as nombre, avg(price) as gastos
from students s
inner join enrollments e on  e.student_id = s.student_id
inner join courses c on c.course_id = e.student_id
group by s.student_id;

#17. Mostrar los cursos en orden ascendente según su precio.
select course_name, price
from courses c
order by price desc;

#18. Crear una función para obtener el precio medio (sin decimales)  de todos los cursos. Tip: Para redondear sin decimales usar Round()
delimiter //
create function precio_promedio()
returns int
deterministic
begin
	declare avg_price int;
	select round(avg(price)) into avg_price
	from courses;
	return avg_price;
end //
delimiter ;

select precio_promedio();

#19. Crear un procedimiento almacenado para mostrar el nombre y la cantidad de cursos de cada dificultad, ordenados por la cantidad de cursos de manera descendente.
delimiter //
create procedure nombre_y_cursos()
begin 
	select difficulty, count(course_name)
	from courses c
	group by difficulty desc;
end //
delimiter ;

call nombre_y_cursos();

#20. Crear una vista llamada getAdvancedStudents para obtener el nombre y apellidos y la dificultad(nivel) de los estudiantes que se han matriculado en algún curso de nivel "Advanced" ordenada por nombre de forma ascendente.
create view getAdvancedStudents as 
select first_name, last_name, difficulty 
from students s
inner join enrollments e on  e.student_id = s.student_id
inner join courses c on c.course_id = e.student_id
where difficulty = "Advanced"
order by difficulty desc;

select * from getAdvancedStudents;