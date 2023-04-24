# <span style="color: pink" > Actividad 3.2 - Programando un DFA

Reference for math symbols:
https://www.overleaf.com/learn/latex/List_of_Greek_letters_and_math_symbols

## <span style="color: pink" > Nombres:
- Arantza Parra Martínez
- María Fernanda Cortés Lozano

# Especificaciones del programa
- ¿Cómo correrlo?
    
    Para correr este programa es necesario tener los casos de prueba presentados y mandar a llamar del programa desde la terminal de Racket. 

- ¿Qué obtiene como salida?

    Este programa utiliza un DFA para validar y añadir un token a una cadena dada como una expresión aritmética válida.

- Lenguaje utilizado

    El lenguaje que se utilizo para realizar este programa es Racket. 

- ¿Qué se necesita instalar para correrlo?

    Para correr este programa es necesario instalar Racket y los programas con los casos prueba.

# Automata
:::mermaid

graph LR
start --> int
start --> sign
start --> var
start --> paren
start --> comment
int --> int
int --> dot
int --> e
int --> opint
int --> spa
int --> parenint
dot --> float
float --> float
float --> e
float --> opfloat
float --> spafloat
float --> parenfloat
e --> signexp
e --> intexp
signexp --> intexp
intexp --> intexp
intexp --> opintexp
intexp --> spaexp
intexp --> parenexp
spa --> int
spa --> float
spa --> var
spa --> paren
spa --> comment
paren --> parenint
paren --> parenfloat
parenint --> int
parenfloat --> float
:::




