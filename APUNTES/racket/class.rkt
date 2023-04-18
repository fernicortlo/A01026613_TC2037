#|
Simple Deterministic Finite Automaton (DFA) to validate arithmetic expressions
It returns a list of the types of tokens found in an expression
Examples of function calls to test:
> (arithmetic-lexer "var=3*num-7.5/5")
'(id op int op id op float op int)

|#

#lang racket

(require racket/trace)

(provide dfa arithmetic-lexer delta-arithmetic)

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
     ; The list to be returned with all the types of tokens found
     [tokens '()])
    (cond
      ; Check if the final state is in the list of acceptable states
      [(empty? char-list)
       (if (member state (dfa-accept dfa-def))
         (reverse (cons state tokens))
         'invalid)]
      [else
        ; Extract the two values returned by the transition function
        (let-values
          ;   var1      var2   Call to the transition function
          ([(new-state found) ((dfa-transition dfa-def) state (car char-list))])
          (loop
            ; New list
            (cdr char-list)
            ; New state, obtained by calling the transition function
            new-state
            ; New list of tokens. Add a token only if it has already been identified
            (if found (cons found tokens) tokens)))])))

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
    [(eq? state 'start) (cond
       [(char-numeric? char) (values 'int #f)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'sign #f)]
       [(char-alphabetic? char) (values 'id #f)]
       [(eq? char #\_) (values 'id #f)]
       [else (values 'inv #f)])]
    [(eq? state 'sign) (cond
       [(char-numeric? char) (values 'int #f)]
       [else (values 'inv #f)])]
    [(eq? state 'int) (cond
       [(char-numeric? char) (values 'int #f)]
       [(eq? char #\.) (values 'dot #f)]
       [(or (eq? char #\e) (eq? char #\E)) (values 'e #f)]
       [(char-operator? char) (values 'op 'int)]
       [else (values 'inv #f)])]
    [(eq? state 'dot) (cond
       [(char-numeric? char) (values 'float #f)]
       [else (values 'inv #f)])]
    [(eq? state 'float) (cond
       [(char-numeric? char) (values 'float #f)]
       [(or (eq? char #\e) (eq? char #\E)) (values 'e #f)]
       [(char-operator? char) (values 'op 'float)]
       [else (values 'inv #f)])]
    [(eq? state 'e) (cond
       [(char-numeric? char) (values 'exp #f)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'e_sign #f)]
       [else (values 'inv #f)])]
    [(eq? state 'e_sign) (cond
       [(char-numeric? char) (values 'exp #f)]
       [else (values 'inv #f)])]
    [(eq? state 'exp) (cond
       [(char-numeric? char) (values 'exp #f)]
       [(char-operator? char) (values 'op 'exp)]
       [else (values 'inv #f)])]
    [(eq? state 'id) (cond
       [(char-numeric? char) (values 'id #f)]
       [(char-alphabetic? char) (values 'id #f)]
       [(eq? char #\_) (values 'id #f)]
       [(char-operator? char) (values 'op 'id)]
       [else (values 'inv #f)])]
    [(eq? state 'op) (cond
       [(char-numeric? char) (values 'int 'op)]
       [(or (eq? char #\+) (eq? char #\-)) (values 'sign 'op)]
       [(char-alphabetic? char) (values 'id 'op)]
       [else (values 'inv #f)])]
    
    ))

