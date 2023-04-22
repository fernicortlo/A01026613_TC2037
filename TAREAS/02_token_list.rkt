;NOS FALTA:
; - HACER LOS TOKENS PARA LOS PARÉNTESIS
; - Cambiar el loop para que salga en pares (token, text)
; - Que se impriman bien los pares
; que reconozca chars?
; que guarde cada uno de los valores

; Program that detects tokens of a lenguage and indicates its type or that it is not a valid expression
#lang racket

(require racket/trace)

(provide (all-defined-out))

; Define a stucture that describes a DFA
(struct dfa (transition initial accept))

(define (arithmetic-lexer strng)
  " Evaluate an arithmetic expression "
  (validate-dfa strng (dfa delta-arithmetic 'start '(int float exp id spa))))

; Function to evaluate a string using a DFA
; Receives the string to test and a structure for a DFA
(define (validate-dfa input dfa-def)
  (let loop
      ; Convert the string into a list of chars
      ([char-list (string->list input)]
       ; Get the initial state from the DFA definition
       [state (dfa-initial dfa-def)]
       ; The characters that will be forming the token
       [current-token '()]
       ; The list to be returned with all the types of tokens found
       [tokens '()])
    (cond
      ; Check if the final state is in the list of acceptable states
      [(empty? char-list)
       (if (member state (dfa-accept dfa-def))
           (reverse (cons (cons state (list->string (reverse current-token))) tokens))
           'invalid)]
           
      [else
       ; Extract the two values returned by the transition function
       (let-values
           ; var1 var2 Call to the transition function
           ([(new-state found) ((dfa-transition dfa-def) state (car char-list))])
         (loop
          ; New list
          (cdr char-list)
          ; New state, obtained by calling the transition function
          new-state
          ; New list of tokens. Add a token only if it has already been identified
          (if found
              (cons (cons (list->string (reverse current-token)) found) tokens)
              ; (cons (cons found (list->string (reverse current-token))) tokens)
              tokens)
          ; Reset the current-token list if necessary
          (if found '() (cons (car char-list) current-token))))])))


(define (char-operator? char)
  " Check if the character is considered an operator "
  (member char (string->list "=+-*/")))

; Accept numbers of different types
; Star state: 'start
; Accept states: 'int 'float
; The function returns pairs of values: the new state, and the token that had been found
; if the token has not fihised yet, the type is false ( #f )
(define (delta-arithmetic state char)
  (cond 
    [(eq? state 'start)
     (cond
       [(char-numeric? char) (values 'int #f)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f)]
       [(char-alphabetic? char) (values 'id #f)]
       [(eq? char #\_) (values 'id #f)]
       [(char-whitespace? char) (values 'spa #f)] ; Add this line
       [(eq? char #\( ) (values 'open_parenthesis #f)]
       [(eq? char #\))  (values 'close_parenthesis #f)]
       [else (values 'inv #f)])]
       
    [(eq? state 'sign)
     (cond
       [(char-numeric? char) (values 'int #f)]
       [else (values 'inv #f)])]
    [(eq? state 'int)
     (cond
       [(char-numeric? char) (values 'int #f)]
       [(eq? char #\.) (values 'dot #f)]
       [(or (eq? char #\e) (eq? char #\E)) (values 'e #f)]
       [(char-operator? char) (values 'op 'int)]
       [(eq? char #\() (values 'open_parenthesis #f)]
       [(eq? char #\)) (values 'close_parenthesis #f)]
       [else (values 'inv #f)])]
    [(eq? state 'dot)
     (cond
       [(char-numeric? char) (values 'float #f)]
       [else (values 'inv #f)])]
    [(eq? state 'float)
     (cond
       [(char-numeric? char) (values 'float #f)]
       [(or (eq? char #\e) (eq? char #\E)) (values 'e #f)]
       [(char-operator? char) (values 'op 'float)]
       [(eq? char #\( ) (values 'open_parenthesis #f)]
       [(eq? char #\)) (values 'close_parenthesis #f)]
       [else (values 'inv #f)])]
    [(eq? state 'e)
     (cond
       [(char-numeric? char) (values 'exp #f)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'e_sign #f)]
       [else (values 'inv #f)])]
    [(eq? state 'e_sign)
     (cond
       [(char-numeric? char) (values 'exp #f)]
       [else (values 'inv #f)])]
    [(eq? state 'exp)
     (cond
       [(char-numeric? char) (values 'exp #f)]
       [(char-operator? char) (values 'op 'exp)]
       [(eq? char #\() (values 'open_parenthesis #f)]
       [(eq? char #\)) (values 'close_parenthesis #f)]
       [else (values 'inv #f)])]
    [(eq? state 'id)
     (cond
       [(char-numeric? char) (values 'id #f)]
       [(char-alphabetic? char) (values 'id #f)]
       [(eq? char #\_) (values 'id #f)]
       [(char-operator? char) (values 'op 'id)]
       [(eq? char #\() (values 'open_parenthesis #f)]
       [(eq? char #\)) (values 'close_parenthesis #f)]
       [else (values 'inv #f)])]
    [(eq? state 'op)
     (cond
       [(char-numeric? char) (values 'int 'op)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'op)]
       [(char-alphabetic? char) (values 'id 'op)]
       [(eq? char #\() (values 'open_parenthesis #f)]
       [(eq? char #\)) (values 'close_parenthesis #f)]
       [else (values 'inv #f)])]
    [(eq? state 'spa)
     (cond
       [(char-operator? char) (values 'op #f)]
       [(char-whitespace? char) (values 'spa #f)]
       [(eq? char #\() (values 'open_parenthesis #f)]
       [(eq? char #\)) (values 'close_parenthesis #f)]
       [(char-operator? char) (values 'int #f)]
       [else (values 'inv #f)])]
    
    [(eq? state 'open_parenthesis)
     (cond
       [(char-numeric? char) (values 'int #f)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f)]
       [(char-alphabetic? char) (values 'id #f)]
       [(eq? char #\_) (values 'id #f)]
       [(eq? char #\() (values 'open_parenthesis #f)]
       [(eq? char #\)) (values 'close_parenthesis #f)]
       [else (values 'inv #f)])]
    [(eq? state 'close_parenthesis)
     (cond
       [(char-operator? char) (values 'op #f)]
       [(char-whitespace? char) (values 'spa #f)]
       [(eq? char #\)) (values 'close_parenthesis #f)]
       [else (values 'inv #f)])]
    [else (values 'start #f)]))
