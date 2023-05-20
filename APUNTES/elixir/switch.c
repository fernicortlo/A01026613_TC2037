int main (){
    int value = 6*2;

    switch (value){
        case 1:
            printf("One");
            break;
        case 'e':
        case 3:
            printf("Two");
            break;
        case 5:
            printf("Three");
        default:
            printf("Number not found");
    }
}
/* Características switch
    - Switch obligatorio
    - Case obligatorio
    - Default opcional
    - Break opcional
    - Case puede ser un valor o una expresión
*/ 


// BNF (Backus-Naur Form)

<switch> ::= switch "(" <expresion> ")" "{" <switch-block> "}"
<switch-block> ::= <case> <switch-block> | <switch-block>  <default> | λ
<case> ::= case < int-expresion> ":" <statements> break ";" 
<default> ::= default ":" <statements> break ";"
<statments> ::= <stament>| <statement> <statement>

//EBNF (Extended Backus-Naur Form)
{} -> 0 o más
[] -> 0 o 1
| -> o
() -> agrupar
<switch> ::= 'switch' '(' INT-EXPRESSION ')' '{' [{CASE}] [DEFAULT] '}'
CASE ::= 'case' INT-VALUE ':' [{EXPRESSION}] [break;]
DEFAULT ::= 'default' ':' [{EXPRESSION}] [break;]

