; Actividad 2.1 Programación funcional, parte 1
; Maria Fernanda Cortés Lozano A01026613
; Arantza Parra Martinez A01782023

#lang racket

(provide positives binary)

; The following function takes a list of numbers and returns a new list containing only 
; the positive ones
(define (positives lst) 
; for-each helps us iterate over each element in the list
     (for-each(lambda (x) ;lambda creates the function,
     ;x being the elements of the list
         (when(positive? x) ; the function 'positive?' helps us check whether 
         ;the element if positive or not
          (display x) ; this prints the positive elements 
          (display " "))) ; puts a space between the numbers of the list
         lst))

; The following function prints and calculates the average of a list 
(define (average lst)
    (let loop ((lst lst) (sum 0) (count 0)) ; this function takes three elements
    ; the list, the sum and a counter to get the lenght of the list
        (cond ((null? lst)
            (when (> count 0)
                (display (/ sum count))
                (newline)))
            (else
            (loop (cdr lst) (+ sum (car lst)) (+ count 1)))))) ; if the list isn't empty
            ; it adds the first element of the list and incrementd the lenght by 1


; The followig function replicates the elements of a list x times
(define (replicate lst x) ;this function takes the list and the numer you want to replicate it
  (cond ((null? lst) '()) ; checks if the list is empty
        ((= x 0) '()) ; checks if x equals 0
        (else (append (make-list x (car lst)) ; it creates the list reapeating 
        ;the first element x times
                      (replicate (cdr lst) x))))) ;it recursively calls the function with the rest of the elements


; the following function prints out the equivalent of the number given in binary  
(define (binary n)
  (if (= n 0) 
      '() ; checks if the number equals 0
      (append (binary (quotient n 2)) ; it makes the division of the number between 2
      ; and stores the quotient and remainders on a list
              (list (remainder n 2)))))
