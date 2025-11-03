/*Reglas
  1. Asistencia mayor 75%
  2. Aprobado TP1
  3. Aprobado TP2
  4. Aprobado Parcial
*/

%Hechos
alumno(juan).
alumno(maria).

asistencia(77,juan).
asistencia(100,maria).

tp1(8,juan).
tp1(9,maria).

tp2(9,juan).
tp2(9,maria).

parcial(5,juan).
parcial(10,maria).


%Reglas
aprueba_asistencia(Y) :-
  asistencia(X,Y),
  X >= 75.
                            
aprueba_tp1(Y) :- 
  tp1(X,Y),
  X >= 6.
                      
aprueba_tp2(Y) :- 
  tp2(X,Y),
  X >= 6.
                      
aprueba_parcial(Y) :- 
  parcial(X,Y),
  X >= 6.
                      
aprueba_la_materia(Y) :- 
  aprueba_asistencia(Y),
  aprueba_tp1(Y),
  aprueba_tp2(Y),
  aprueba_parcial(Y).
                      

/*
resultados:
  1. ¿Juan aprobó la materia Paradigmas 2? No
  2. ¿Maria aprobó la materia Paradigmas 2? Si
  */
  
:- initialization(main).

main:-

write('¿Juan aprobó la materia Paradigmas 2?'),
  (
    aprueba_la_materia(juan)
    ->
    write('Si')
    ;
    write('No')
  ),
  nl,
  
write('¿Maria aprobó la materia Paradigmas 2?'),
  (
    aprueba_la_materia(maria)
    ->
    write('Si')
    ;
    write('No')
  ),
  nl,
  
  halt(0).
