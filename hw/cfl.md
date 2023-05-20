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


```


reconocer tipos de tokens a identificar

     comentarios, palabras clave, numeros, arg, funciones

hacer expresiones regulares 

    Exp. reg. para un comentario Elixir/Py
        #.* 

    en una linea hay varios tokens
        sabemos leer renglon por renglon, provar todo lo que va haciendo match y lo vas quitando y deja el resto
