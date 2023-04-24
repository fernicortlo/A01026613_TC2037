;NOS FALTA:
; - HACER LOS TOKENS PARA LOS PARÉNTESIS
; - Cambiar el loop para que salga en pares (token, text)
; - Que se impriman bien los pares
; que reconozca chars?
; que guarde cada uno de los valores
#|
    ; Program that detects tokens of a lenguage and indicates its type or that it is not a valid expression

    Arantza Parra Martinez - A01782023
    Ma.Fernanda Cortés Lozano - A01026613
    2023-03-14
|#
#lang racket

(require racket/trace)

(provide (all-defined-out))

; Define a stucture that describes a DFA
(struct dfa (transition initial accept))

(define (arithmetic-lexer strng)
  " Evaluate an arithmetic expression "
  (validate-dfa (dfa delta-arithmetic 'start '(int float exp id spa op sign dot e e_sign open_p close_p))strng ))

; Function to evaluate a string using a DFA
; Receives the string to test and a structure for a DFA
(define (validate-dfa dfa-def strng)
  (let loop
; Convert the string into a list of chars
      ([char-list(string->list strng)]
; Get the initial state from the DFA definition
       [state (dfa-initial dfa-def)]
; The characters that will be forming the token
       [current-token '()]
; The list to be returned with all the types of tokens found
       [tokens '()])
; This conditional checks if the list of characters is empty,
    (cond
      [(empty? char-list)
;  if it is, it checks if the current state is an accept state
       (if (member state (dfa-accept dfa-def))
; if it is a valid state, it returns the list of tokens
           (reverse (cons (cons(list->string (reverse current-token))state) tokens))
;if it is not, it returns an error
           'invalid)]
; If the list of characters is not empty, it calls a recursive function
      [else
       (let-values
; The function returns a pair of values: the new state and the token found
           ([(new-state found) ((dfa-transition dfa-def) state (car char-list))])
 ;  If the token is finished, it adds it to the list of tokens and calls the recursive function again
        (if found
            ;  (if (not (empty? current-token))
                 (loop (cdr char-list) new-state '() 
                       (cons (cons(list->string (reverse current-token))found) tokens))
; If the token is not finished, it calls the recursive function again
             (loop (cdr char-list) new-state (cons (car char-list) current-token) tokens)))])))
        
(define (char-operator? char)
  " Check if the character is considered an operator "
  (member char (#\+ #\- #\* #\/ #\^)))

  
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
      ;  [(eq? char #\( ) (values 'open_p #f)]
      ;  [(eq? char #\))  (values 'close_p #f)]
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
      ;  [(eq? char #\() (values 'open_p #f)]
      ;  [(eq? char #\)) (values 'close_p #f)]
       [(char-whitespace? char) (values 'spa 'int)]
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
       [(char-whitespace? char) (values 'spa 'float)]
      ;  [(eq? char #\( ) (values 'open_p #f)]
      ;  [(eq? char #\)) (values 'close_p #f)]
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
       [(char-whitespace? char) (values 'spa 'exp)]
      ;  [(eq? char #\() (values 'open_p #f)]
      ;  [(eq? char #\)) (values 'close_p #f)]
       [else (values 'inv #f)])]
    [(eq? state 'id)
     (cond
       [(char-numeric? char) (values 'id #f)]
       [(char-alphabetic? char) (values 'id #f)]
       [(eq? char #\_) (values 'id #f)]
       [(char-operator? char) (values 'op 'id)]
        [(char-whitespace? char) (values 'spa 'id)]
       [else (values 'inv #f)])]
    [(eq? state 'op)
     (cond
       [(char-numeric? char) (values 'int 'op)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'op)]
       [(char-alphabetic? char) (values 'id 'op)]
        [(eq? char #\_) (values 'id 'op)]
       [(char-whitespace? char) (values 'op_spa 'op)]
      ;  [(eq? char #\() (values 'open_p #f)]
      ;  [(eq? char #\)) (values 'close_p #f)]
       [else (values 'inv #f)])]
    [(eq? state 'spa)
     (cond
       [(char-operator? char) (values 'op #f)]
       [(char-whitespace? char) (values 'spa #f)]
      ;  [(eq? char #\() (values 'open_p #f)]
      ;  [(eq? char #\)) (values 'close_p #f)]
       [(char-operator? char) (values 'int #f)]
       [else (values 'inv #f)])]
    [(eq? state 'op_spa) (cond
       [(char-numeric? char) (values 'int #f)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f)]
       [(char-alphabetic? char) (values 'id #f)]
       [(eq? char #\_) (values 'id #f)]
       [(char-whitespace? char) (values 'op_spa #f)]
      ;  [(eq? char #\() (values 'open_p #f)]
      ;  [(eq? char #\)) (values 'close_p #f)]
       [else (values 'inv #f)])]
    [(eq? state 'open_p)
     (cond
       [(char-numeric? char) (values 'int #f)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f)]
       [(char-alphabetic? char) (values 'id #f)]
       [(eq? char #\_) (values 'id #f)]
       [(eq? char #\() (values 'open_p #f)]
       [(eq? char #\)) (values 'close_p #f)]
       [else (values 'inv #f)])]
    [(eq? state 'close_p)
     (cond
       [(char-operator? char) (values 'op #f)]
       [(char-whitespace? char) (values 'spa #f)]
       [(eq? char #\)) (values 'close_p #f)]
       [else (values 'inv #f)])]
    [else (values 'start #f)]))
