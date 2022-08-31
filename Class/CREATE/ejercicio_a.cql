CREATE TABLE practica.ejercicio_a (
  titulo_curso text,
  idC_curso int,
  creditos_curso int,
  profesor_curso text,
  nombre_estudiante text,
  idE_estudiante int,
  PRIMARY KEY ( idE_estudiante ,  titulo_curso,idC_curso)
) WITH CLUSTERING ORDER BY(titulo_curso asc, idC_curso asc );