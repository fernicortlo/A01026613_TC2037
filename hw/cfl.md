# **Actividad 3.3 Practicando los lenguajes libres de contexto**

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

< module > ::= defmodule < module_name > do < function > end 

< function > ::=  def < name > (< parameters >) do < body > end

< parameters > ::=  < parameter > | < parameter>, < parameters >

< parameter > ::= < name >

< body > ::=  < exp > | < exp >

< exp > ::= < if > |< if > < else > | < if > < else > < else >

< if > ::= if < condition > do < exp >

< condition > ::= < name > < operator > < name > 

< operator > ::= == | < | > | <= | >=

< name > ::= < mayus > | < char > < name >

< number > ::= < num > | < num > < number >

 < char > ::= a | b | c | ... | z A | B | C | ... | Z

 < mayus > ::= A | B | C | ... | Z

 < num >  ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9


**The EBNF could be written as follows:**

