/*
 * Lógica de Aprobación de la Materia
 * Requisitos:
 * 1. Asistencia mayor 75%
 * 2. Aprobado TP1 (>= 6)
 * 3. Aprobado TP2 (>= 6)
 * 4. Aprobado Parcial (>= 6)
 */

% Hechos: Base de conocimientos del alumno y sus notas
alumno(juan).
alumno(maria).

% Notas de asistencia (Porcentaje, Alumno)
asistencia(77, juan).
asistencia(100, maria).

% Notas de trabajos prácticos y parcial (Nota, Alumno)
tp1(8, juan).
tp1(9, maria).

tp2(9, juan).
tp2(9, maria).

parcial(5, juan).
parcial(10, maria).


% Reglas: Determinación de la aprobación por requisito

% Si la nota (X) es >= 75, la asistencia para el Alumno (Y) está aprobada
aprueba_asistencia(Y) :-
    asistencia(X, Y),
    X >= 75.
 
% Si la nota (X) es >= 6, el TP1 para el Alumno (Y) está aprobado
aprueba_tp1(Y) :- 
    tp1(X, Y),
    X >= 6.
 
% Si la nota (X) es >= 6, el TP2 para el Alumno (Y) está aprobado
aprueba_tp2(Y) :- 
    tp2(X, Y),
    X >= 6.
 
% Si la nota (X) es >= 6, el Parcial para el Alumno (Y) está aprobado
aprueba_parcial(Y) :- 
    parcial(X, Y),
    X >= 6.
 
% La materia se aprueba si se cumplen TODOS los requisitos
aprueba_la_materia(Y) :- 
    aprueba_asistencia(Y),
    aprueba_tp1(Y),
    aprueba_tp2(Y),
    aprueba_parcial(Y).
 
 
% Bloque de Inicialización para ejecutar automáticamente
:- initialization(main).

main:-
    % Consulta para Juan
    write('¿Juan aprobó la materia Paradigmas 2? '),
    (
        aprueba_la_materia(juan)
        ->
        write('Si')
        ;
        write('No')
    ),
    nl, % Nueva línea
    
    % Consulta para María
    write('¿Maria aprobó la materia Paradigmas 2? '),
    (
        aprueba_la_materia(maria)
        ->
        write('Si')
        ;
        write('No')
    ),
    nl,
    
    halt(0).
