CREATE TABLE practica.ejercicio_b (
  titulo_curso text,
  creditos_curso int,
  profesor_curso text,
  idE_estudiante int,
  nota_exam text,
  PRIMARY KEY  ( nota_exam, creditos_curso, idE_estudiante  , titulo_curso   ),
  ) WITH CLUSTERING ORDER BY(creditos_curso desc );