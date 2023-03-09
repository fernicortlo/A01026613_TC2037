; Actividad 2.1 Programación funcional, parte 1
; Maria Fernanda Cortés Lozano A01026613
; Arantza Parra Martinez A01782023

#lang racket

(provide positives)

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
    (let ((sum (apply + lst))) ; sum is the name of the variable where the sum of the elements in the list are stored
    ; the function apply helps us sum up all the elements in the list 
     (display (/ sum(length lst)))))






