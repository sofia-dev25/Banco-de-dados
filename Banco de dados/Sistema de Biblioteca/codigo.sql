- create a table
CREATE TABLE usuario (
id_usuario INTEGER PRIMARY KEY,
Name TEXT NOT NULL,
Tipo TEXT NOT NULL
);
-- insert some values
INSERT INTO usuario VALUES (1, 'João', 'M');
INSERT INTO usuario VALUES (2, 'Marta', 'F');
-- fetch some values
SELECT * FROM usuario WHERE tipo = 'F'