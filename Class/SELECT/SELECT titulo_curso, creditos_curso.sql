SELECT titulo_curso, creditos_curso
FROM practica.ejercicio_b
WHERE nota_exam = 'C'
order by creditos_curso desc;