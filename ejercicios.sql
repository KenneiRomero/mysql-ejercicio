CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;

CREATE TABLE Dept (
    Dept_No INT PRIMARY KEY,
    DNombre VARCHAR(50),
    Loc VARCHAR(50)
);

CREATE TABLE Emp (
    Emp_No INT PRIMARY KEY,
    Apellido VARCHAR(50),
    Oficio VARCHAR(50),
    Dir INT,
    Fecha_Alt DATE,
    Salario DECIMAL(10,2),
    Comision DECIMAL(10,2),
    Dept_No INT,
    FOREIGN KEY (Dept_No) REFERENCES Dept(Dept_No)
);

CREATE TABLE Hospital (
    Hospital_Cod INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(100),
    Telefono VARCHAR(20),
    Num_Cama INT
);

CREATE TABLE Doctor (
    Doctor_No INT PRIMARY KEY,
    Hospital_Cod INT,
    Apellido VARCHAR(50),
    Especialidad VARCHAR(50),
    FOREIGN KEY (Hospital_Cod) REFERENCES Hospital(Hospital_Cod)
);

CREATE TABLE Sala (
    Sala_Cod INT,
    Hospital_Cod INT,
    Nombre VARCHAR(50),
    Num_Camas INT,
    PRIMARY KEY (Sala_Cod, Hospital_Cod),
    FOREIGN KEY (Hospital_Cod) REFERENCES Hospital(Hospital_Cod)
);

CREATE TABLE Plantilla (
    Empleado_No INT PRIMARY KEY,
    Hospital_Cod INT,
    Sala_Cod INT,
    Apellido VARCHAR(50),
    Funcion VARCHAR(50),
    T ENUM('T', 'N', 'M'),
    Salario DECIMAL(10,2),
    FOREIGN KEY (Hospital_Cod) REFERENCES Hospital(Hospital_Cod),
    FOREIGN KEY (Sala_Cod, Hospital_Cod) REFERENCES Sala(Sala_Cod, Hospital_Cod)
);

CREATE TABLE Enfermo (
    Inscripcion INT PRIMARY KEY,
    Apellido VARCHAR(50),
    Direccion VARCHAR(100),
    Fecha_Nac DATE,
    S ENUM('M','F'),
    NSS BIGINT
);

INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(10,'CONTABILIDAD','ELCHE');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(20,'INVESTIGACIÓN','MADRID');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(30,'VENTAS','BARCELONA');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(40,'PRODUCCIÓN','SALAMANCA');

INSERT INTO Emp(Emp_No,Apellido,Oficio,Dir,Fecha_Alt,Salario,Comision,Dept_No) VALUES
(7369,'SANCHEZ','EMPLEADO',7902,'1980-12-17',10400,0,20),
(7499,'ARROYO','VENDEDOR',7698,'1981-02-22',208000,39000,30),
(7521,'SALA','VENDEDOR',689,'1981-02-22',162500,65000,30),
(7566,'JIMENEZ','DIRECTOR',7839,'1981-04-02',386750,0,20),
(7654,'MARTIN','VENDEDOR',7698,'1981-09-28',182000,182000,30),
(7698,'NEGRO','DIRECTOR',7839,'1981-05-01',370500,0,30),
(7782,'CEREZO','DIRECTOR',7839,'1981-06-09',318500,0,10),
(7788,'NINO','ANALISTA',7566,'1987-03-30',390000,0,20),
(7839,'REY','PRESIDENTE',0,'1981-11-17',650000,0,10),
(7844,'TOVAR','VENDEDOR',7698,'1981-09-08',195000,0,30),
(7876,'ALONSO','EMPLEADO',7788,'1987-05-03',143000,0,20),
(7900,'JIMENO','EMPLEADO',7698,'1981-12-03',123500,0,30),
(7902,'FERNANDEZ','ANALISTA',7566,'1981-12-03',390000,0,20),
(7934,'MUÑOZ','EMPLEADO',7782,'1982-06-23',169000,0,10),
(7119,'SERRA','DIRECTOR',7839,'1983-11-19',225000,39000,20),
(7322,'GARCIA','EMPLEADO',7119,'1982-10-12',129000,0,20);

INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES
(19,'Provincial','O Donell 50','964-4256',502),
(18,'General','Atocha s/n','595-3111',987),
(22,'La Paz','Castellana 1000','923-5411',412),
(45,'San Carlos','Ciudad Universitaria','597-1500',845);

INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES
(22,386,'Cabeza D.','Psiquiatría'),
(22,398,'Best D.','Urología'),
(19,435,'López A.','Cardiología'),
(22,453,'Galo D.','Pediatría'),
(45,522,'Adams C.','Neurología'),
(18,585,'Miller G.','Ginecología'),
(45,607,'Chuki P.','Pediatría'),
(18,982,'Cajal R.','Cardiología');

INSERT INTO Sala VALUES
(1,22,'Recuperación',10),
(1,45,'Recuperación',15),
(2,22,'Maternidad',34),
(2,45,'Maternidad',24),
(3,19,'Cuidados Intensivos',21),
(3,18,'Cuidados Intensivos',10),
(4,18,'Cardiología',53),
(4,45,'Cardiología',55),
(6,19,'Psiquiátricos',67),
(6,22,'Psiquiátricos',118);

INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario) VALUES
(22,6,1009,'Higueras D.','Enfermera','T',200500),
(45,4,1280,'Amigo R.','Interino','N',221000),
(19,6,3106,'Hernández','Enfermero','T',275000),
(19,6,3754,'Díaz B.','Enfermera','T',226200),
(22,1,6065,'Rivera G.','Enfermera','N',162600),
(18,4,6357,'Karplus W.','Interino','T',337900),
(22,1,7379,'Carlos R.','Enfermera','T',211900),
(22,6,8422,'Bocina G.','Enfermero','M',183800),
(45,1,8526,'Frank H.','Enfermera','T',252200),
(22,2,9901,'Núñez C.','Interino','M',221000);

INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS) VALUES
(10995,'Laguía M.','Goya 20','1956-05-16','M',280862422),
(14024,'Fernández M.','Recoletos 50','1960-05-21','F',284991452),
(18004,'Serrano V.','Alcalá 12','1967-06-23','F',321790059),
(36658,'Domin S.','Mayor 71','1942-01-01','M',160654471),
(38702,'Neal R.','Orense 11','1940-06-18','F',380010217),
(39217,'Cervantes M.','Perón 38','1952-02-29','M',440294390),
(59076,'Miller B.','López de Hoyos 2','1945-09-16','F',311969044),
(63827,'Ruiz P.','Ezquerdo 103','1980-12-26','M',100973253),
(64823,'Fraiser A.','Soto 3','1980-07-10','F',285201776),
(74835,'Benítez E.','Argentina','1957-10-05','M',154811767);

-- 1.Construya el procedimiento almacenado que saque todos los empleados que se dieron de alta entre una determinada 
-- fecha inicial y fecha final y que pertenecen a un determinado departamento.

DROP PROCEDURE IF EXISTS empleadosPorRangoYDepto;
DELIMITER $$
create procedure empleadosPorDepartamento(IN cod_depto INT)
begin
    select *
    from Emp
    where Dept_No = cod_depto;
end $$
DELIMITER ;

CALL empleadosPorDepartamento(30);
show procedure status where db ="hospital";

-- 2.Construya el procedimiento que inserte un empleado.

drop procedure if exists insertarEmpleado;

DELIMITER $$
create procedure insertarEmpleado(in i_Emp_No int, in i_Apellido varchar(50), in i_Oficio varchar(50), in i_Dir varchar(50), in i_Fecha_Alt date, in i_Salario decimal(10,2),in i_Comision decimal(10,2),in i_Dept_No int)
begin 
	insert into Emp(Emp_No,Apellido,Oficio,Dir,Fecha_Alt,Salario,Comision,Dept_No)
	values (i_Emp_No, i_Apellido, i_Oficio, i_Dir, i_Fecha_Alt, i_Salario, i_Comision, i_Dept_No);
end $$
DELIMITER ;

CALL insertarEmpleado(1823, 'ROMERO', 'ANALISTA', 7373, '1980-12-20', 230000, 12, 20);

SELECT * FROM Emp;

-- 3. Construya el procedimiento que recupere el nombre, número y número de personas a partir del número de departamento.

drop procedure if exists nomApartirDept;

DELIMITER $$
create procedure nomApartirDept (in cod_depto int, out total_emp int)
begin
	select COUNT(*) into total_emp
	from Emp
	where Dept_no = cod_depto;

	select Dept_no, DNombre
	from Dept
	where Dept_no = cod_depto;
end $$
DELIMITER ;

SET @cantidad = 0;
CALL nomApartirDept(20, @cantidad);
SELECT @cantidad AS "Número de empleados";

-- 4. Diseñe y construya un procedimiento igual que el anterior, pero que recupere también las
-- personas que trabajan en dicho departamento, pasándole como parámetro el nombres

DROP PROCEDURE IF EXISTS empleadosPorDepto;

DELIMITER $$

create procedure empleadosPorDepto(in nombre_depto varchar(50))
begin
    select e.Emp_No, e.Apellido, e.Oficio, e.Salario
    from Emp e
    join Dept d ON e.Dept_No = d.Dept_No
    where lower(trim(d.DNombre)) = lower(trim(nombre_depto));
end $$

DELIMITER ;

CALL empleadosPorDepto('CONTABILIDAD');
-- 5. Construya un procedimiento para devolver salario, oficio y comisión, pasándole el apellido.

DROP PROCEDURE IF EXISTS pagoPorApellido;

DELIMITER $$

create procedure pagoPorApellido(in nom_apellido varchar(50))
begin
    select Salario, Oficio, Comision
    from Emp
    where Apellido = nom_apellido;
end $$

DELIMITER ;

CALL pagoPorApellido('ROMERO');

-- 6. Tal como el ejercicio anterior, pero si no le pasamos ningún valor, mostrará los datos de
-- todos los empleados.

DROP PROCEDURE IF EXISTS ifConApellido;

DELIMITER $$

create procedure ifConApellido(in nom_apellido varchar(50))
begin
    if nom_apellido is null or nom_apellido = '' then
        select Apellido, Salario, Oficio, Comision from Emp;
    else
        select Apellido, Salario, Oficio, Comision
        from Emp
        where Apellido = nom_apellido;
    end if;
end $$

DELIMITER ;

 CALL ifConApellido('');
 CALL ifConApellido('REY');

-- 7. Construya un procedimiento para mostrar el salario, oficio, apellido y nombre del
-- departamento de todos los empleados que contengan en su apellido el valor que le
-- pasemos como parámetro.

DROP PROCEDURE IF EXISTS empleadosPorParteApellido;

DELIMITER $$

create procedure empleadosPorParteApellido(in parte varchar(50))
begin
    select e.Apellido, e.Oficio, e.Salario, d.DNombre as departamento
    from Emp e
    join Dept d on e.Dept_No = d.Dept_No
    where e.Apellido like concat('%', parte, '%');
end $$

DELIMITER ;

 CALL empleadosPorParteApellido('RO'); 



