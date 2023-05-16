# BNF
<conditional> ::= <if> | <if> <else> | <if> <elif> | <if> <elif> <else>
<if> ::= if <boolean-expression> : \n\t <code>
<elif> ::= elif <boolean-expression> : \n\t <code>
<else> ::= else : \n\t <code>
<elifs> ::= <elif> | <elif> <elifs>

#EBNF
CONDITIONAL ::= IF [{ELIFS}] [{ELSE}]
IF ::= if BOOLEAN_EXPRESSION : \n\t CODE
ELIF ::= elif BOOLEAN_EXPRESSION : \n\t CODE
ELSE ::= else : \n\t CODE

if a == b:
    print("Hola")

if a > b:
    print("adios")
if a > b:
    print("adios")
else:
    print("amigos")

if a > b:
    print("adios")
elif a == b:
    print("hola")
elif a > b:
    print("adios")
elif a != b:
    print("hola")
else:
    print("amigos")