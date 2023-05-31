# <span style="color:lightblue"> **Actividad 3.3 Practicando los lenguajes libres de contexto** </span>

Created by Fer Cortés and Arantza Parra

*Instructions:*

1. Write the BNF and EBNF notation for the grammar needed to define modules and functions in Elixir


This is an example of a simple implementation of a module (*Math*) and function (*sum*) in Elixir.

    defmodule Math do
        def sum(a, b) do
        a + b
        end
    end 

It could also include loops and recursion.

**Following that, we could write a **BNF** as follows:**
``` BNF 
< module > ::= defmodule < module_name > do < functions > end 

< module_name > ::= < upper > < module_name>

<functions> ::= <private>|<public>

<private> ::= <do-end-private>|<do-private>

<public> ::= <do-end-public>|<do-public>

<do-end-public> ::=  def < name > (< parameters >) do < code > end |  def < name > (< parameters >) when <op> <int-value> do < code > end

<do-public> ::=  def < name > (< parameters >), do: <code> | def < name > (< parameters >) when <op> <int-value>, do: <code>

<do-end-private> ::=  defp < name > (< parameters >) do < code > end |  defp < name > (< parameters >) when <op> <int-value> do < code > end

<do-private> ::=  defp < name > (< parameters >), do: <code> | defp < name > (< parameters >) when <op> <int-value>, do: <code>

<functions> ::= <function> | < function> <functions>

<name> ::= <lower> <name>

<parameters> ::=  <parameter> | <parameter> , <parameters> 

<upper> ::= A | B | ... | Z

< lower > ::= a | b | ... | z

<op> ::= <= | >= | < | >
 ```


**The EBNF could be written as follows:**

```EBNF
MODULE ::= 'defmodule' MODULE_NAME 'do' {FUNCTIONS} 'end' 

MODULE_NAME ::= UPPER {MODULE_NAME}

FUNCTIONS ::= PRIVATE | PUBLIC 

PRIVATE ::= DO_END_PRIVATE | DO_PRIVATE

PUBLIC ::= DO_END_PUBLIC | DO_PUBLIC

DO_END_PUBLIC ::=  'def' NAME '(' [{PARAMETERS}] ') do' CODE 'end' |  'def' NAME '(' [{PARAMETERS}] ') 'when' OP 'int-value do' CODE 'end'

DO_PUBLIC ::=  'def' NAME '(' [{PARAMETERS}] '), do:' CODE | 'def' NAME '(' [{PARAMETERS}] ') 'when' OP 'int-value, do:' CODE

DO_END_PRIVATE ::=  'defp' NAME '(' [{PARAMETERS}] ') do' CODE 'end' |  'defp' NAME '(' [{PARAMETERS}] ') 'when OP 'int-value do' CODE 'end'

DO_PRIVATE ::=  'defp' NAME '(' [{PARAMETERS}] '), do:' CODE | 'defp' NAME '(' [{PARAMETERS}] ') when' OP 'int-value, do:' CODE

FUNCTION ::= PUBLIC | PRIVATE

NAME ::= LOWER {NAME}

UPPER ::= 'A' | 'B' | ... | 'Z'

LOWER ::= 'a' | 'b' | ... | 'z'

OP ::= '<=' | '>=' | '<' | '>'



```