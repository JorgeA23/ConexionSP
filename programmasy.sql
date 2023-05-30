create database Programmasy; 
use Programmasy;

create table Usuarios(
UsserID INT PRIMARY KEY, UsserName VARCHAR (80), Email VARCHAR
(100), Phone VARCHAR (50), StatusID INT, MatricID INT, RegistrarID INT
);

create table Estados(
StatusID INT PRIMARY KEY, StatusUsser VARCHAR (20)
);

create table Cursos(
CoursesID INT PRIMARY KEY, CourseName VARCHAR (50),CourseDescription VARCHAR (100), CategoryID INT, LevelID INT 
);

create table Matriculados(
MatricID INT PRIMARY KEY, Enrolled INT, CoursesID INT
);


create table Niveles(
LevelID INT PRIMARY KEY, LevelCourse VARCHAR (10)
);

Create table Categorias(
CategoryID INT PRIMARY KEY, CategoryName VARCHAR (100), SuppliersID INT
);

Create table Registro(
RegistrarID INT PRIMARY KEY, ParticipannNumber INT, EventsID INT
);

create table Eventos(
EventsID INT PRIMARY KEY, EventName VARCHAR (100),
EventDescription VARCHAR (200), EventDate DATE, VersusID INT
);

create table Versus(
VersusID INT PRIMARY KEY, VersusParticipants VARCHAR (100), VersusCode CHAR (3), VersusTime TIME
);

create table Proveedores(
SuppliersID INT PRIMARY KEY, SuppliersName VARCHAR (100), ProductName VARCHAR (100), ProductDescription VARCHAR (100)
);
 
Create table Publicidad(
PublicID INT PRIMARY KEY, PublicDescription VARCHAR (100), Payment FLOAT
);

/***      Relación entre tablas:      ***/

ALTER TABLE Categorias
ADD CONSTRAINT fk_ASuppliers FOREIGN KEY (SuppliersID) REFERENCES Proveedores (SuppliersID);

ALTER TABLE Usuarios
ADD CONSTRAINT fk_AStatus FOREIGN KEY (StatusID) REFERENCES
Estados(StatusID);

ALTER TABLE Usuarios
ADD CONSTRAINT fk_ARegistrar FOREIGN KEY (RegistrarID) REFERENCES Registro (RegistrarID);

ALTER TABLE Usuarios
ADD CONSTRAINT fk_AMatric FOREIGN KEY (MatricID) REFERENCES
Matriculados (MatricID);

ALTER TABLE Cursos
ADD CONSTRAINT fk_ALevel FOREIGN KEY (LevelID) REFERENCES
Niveles(LevelID);
 
ALTER TABLE Cursos
ADD CONSTRAINT fk_ACategory FOREIGN KEY (CategoryID) REFERENCES Categorias (CategoryID);

ALTER TABLE Eventos
ADD CONSTRAINT fk_AVersus FOREIGN KEY (VersusID) REFERENCES
Versus(VersusID);

ALTER TABLE Matriculados
ADD CONSTRAINT fk_ACourses FOREIGN KEY (CoursesID) REFERENCES
Cursos (CoursesID);

ALTER TABLE Registro
ADD CONSTRAINT fk_AEvents FOREIGN KEY (EventsID) REFERENCES
Eventos (EventsID);
 
PROCEDIMIENTO ALMACENADO:

/**     Procedimiento para crear un usuario     */
DELIMITER $$
CREATE PROCEDURE sp_insertar_estudiante( IN cedula int,IN ins_UserName VARCHAR(80),
IN ins_Email VARCHAR(100), IN ins_Phone VARCHAR(50)
) BEGIN
INSERT INTO usuarios(UsserID ,UsserName, Email, Phone) VALUES(cedula,ins_UserName, ins_Email, ins_Phone); END $$
DELIMITER ;
