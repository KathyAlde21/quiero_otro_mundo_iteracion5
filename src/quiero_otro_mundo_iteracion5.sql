-- Parte 1: Crear entorno de trabajo
-- A) Crear una base de datos
-- respaldo en imagen

-- B) Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.
-- respaldo en imagen

-- // -----------------------------------------------------------------------------------------------------------

-- Parte 2: Crear tres tablas.
-- C) La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña,
-- zona horaria (por defecto UTC-3), género y teléfono de contacto).
CREATE TABLE usuarios_aplicacion(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    apellido_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(15) NOT NULL,
    zona_horaria VARCHAR(6) DEFAULT '-03:00',         -- Indica la zona horaria como UTC-3
    genero VARCHAR(25),
    telefono VARCHAR(20) NOT NULL,
	UNIQUE(id_usuario)
);

-- D) La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a
-- la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).
CREATE TABLE horarios_uso_plataforma(
	id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP(),
    fk_id_usuario INT,
    FOREIGN KEY(fk_id_usuario) REFERENCES usuarios_aplicacion(id_usuario),
	UNIQUE(id_ingreso, fk_id_usuario)
);
 
-- E) La tercera tabla almacena información sobre la cantidad de veces que los usuarios han visitado
-- la aplicación. Piense en una estructura de columnas que permita entregar esta información y cree la tabla.
CREATE TABLE usuarios_visitas(
	id_visitas INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_usuario INT,
    FOREIGN KEY(fk_id_usuario) REFERENCES usuarios_aplicacion(id_usuario),
    cantidad_visitas INT DEFAULT 0,
    UNIQUE(id_visitas, fk_id_usuario)
);

-- // -----------------------------------------------------------------------------------------------------------
-- Parte 3: Creación de registros.
-- F) Para cada tabla crea 8 registros.

-- TABLA usuarios_aplicacion
INSERT INTO usuarios_aplicacion (nombre_usuario, apellido_usuario, contrasena, zona_horaria, genero, telefono)
VALUES ('Juan', 'Pérez', 'password123', '-02:00', 'Masculino', 923456789), -- 1
	('María', 'Gómez', 'password456', '-02:00', 'Femenino', 987654321), -- 2
	('Carlos', 'López', 'password789', '-02:00', 'Masculino', 946123789), -- 3
	('Ana', 'Martínez', 'password321', '-02:00', 'Femenino', 932164987), -- 4
	('Luis', 'Rodríguez', 'password654', '-02:00', 'Masculino', 965497321), -- 5
	('Laura', 'Hernández', 'password987', '-02:00', 'Femenino', 789321654), -- 6
	('Pedro', 'García', 'password159', '-02:00', 'Masculino', 959753486), -- 7
	('Sofía', 'Fernández', 'password753', '-02:00', 'Femenino', 975315846); -- 8

-- TABLA horarios_uso_plataforma
INSERT INTO horarios_uso_plataforma (fk_id_usuario) -- id y fecha se autocompletan
VALUES  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8);

-- TABLA usuarios_visitas
INSERT INTO usuarios_visitas (fk_id_usuario, cantidad_visitas)
VALUES (1, 5),
  (2, 3),
  (3, 8),
  (4, 2),
  (5, 7),
  (6, 4),
  (7, 6),
  (8, 1);

-- // -----------------------------------------------------------------------------------------------------------
-- Parte 4: Elimine una de las tablas creadas.

DROP TABLE usuarios_visitas;

-- Parte 5: Justifique cada tipo de dato utilizado en la creación de las tablas.
-- => Tabla usuarios_aplicacion = para poder contactar nuevamente un usuario se requieren datos mínimos como nombre y
								-- teléfono, además de una contraseña. Por eso los registré con NOT NULL
	-- id_usuario INT AUTO_INCREMENT PRIMARY KEY : con esto determino el dato debe ser un número y autoicrementarse
		-- en cada ingreso
    -- nombre_usuario VARCHAR(50) NOT NULL : la cantidad de caracteres permite que el nombre sea extenso y con
		-- not null obligo a que ingresen un dato
    -- apellido_usuario VARCHAR(50) NOT NULL : la cantidad de caracteres permite que el nombre sea extenso y con
		-- not null obligo a que ingresen un dato
    -- contrasena VARCHAR(15) NOT NULL : permite que el ingreso sea alfanumerico y obligatorio
    -- zona_horaria VARCHAR(6) DEFAULT '-02:00' : valor que quedo igual para todos
    -- genero VARCHAR(25) : las opciones tienen pocos caracteres por lo que con 25 se cubre
    -- telefono VARCHAR(20) NOT NULL : permite que no sean solo numeros y pueda tener caractereres como +
	-- UNIQUE(id_usuario) : es complemento de la primera línea ya que obliga a que el número no se repita

-- => Tabla horarios_uso_plataforma = tabla compuesta por llave foranea a tabla usuarios_aplicacion, que es el único
									-- dato que se puede ingresar
	-- id_ingreso INT AUTO_INCREMENT PRIMARY KEY : con esto determino el dato debe ser un número y autoicrementarse
		-- en cada ingreso
    -- fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP() : este valor se autocompleta, permitiendo que el
		-- registro quede grabado con el momento en que se creo
    -- fk_id_usuario INT : defino la llave foranea que voy a llamar como numero, ya que tiene ese valor en su tabla
    -- FOREIGN KEY(fk_id_usuario) REFERENCES usuarios_aplicacion(id_usuario) : con esto indico desde donde viene la llave
	-- UNIQUE(id_ingreso, fk_id_usuario) : es complemento en las llaves ya que obliga a que el número no se repita

-- // **************************************************************************************

 -- ***** El ejercicio debe ser subido a github y al Nodo Virtual. ******
-- link GitHub: 
-- https://github.com/KathyAlde21/quiero_otro_mundo_iteracion5
