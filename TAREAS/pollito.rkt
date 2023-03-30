; Created by Maria Fernanda Cortés Lozano and Arantza Parra Martínez

#lang racket

;the function 'pollito-lyrics' will print the lyrics to the song 'Pollito Pio' using a recurvise function.
 
;we define the function
(define (pollito-lyrics)
  ;we define the lists of animals and sounds that will be used 
  (define animals '("el Pollito Pio" "la Gallina Coo" "el Gallo Corocó" "el Pavo Glú Glú Glú" "la Paloma Ruu" "el Gato Miao" "el Perro Guau Guau" "la Cabra Mee" "el Cordero Bee" "la Vaca Moo" "el Toro Muu"))
  (define animalsUn '("un Pollito Pio" "una Gallina Coo" "un Gallo Corocó" "un Pavo Glú Glú Glú" "una Paloma Ruu" "un Gato Miao" "un Perro Guau Guau" "una Cabra Mee" "un Cordero Bee" "una Vaca Moo" "un Toro Muu"))

  ; we define a function that will help us keep track of how  we iterate throught the list called pollito-lyrics-helper
  ; the arguments used are the lists we previously defined and a variable called 'so-far' that stores the previous animals
  (define (pollito-lyrics-helper animals animalsUn so-far)
    ; If there are no more animals to iterate it prints the following:
    (cond ((null? animals)
           (begin (display "En la radio hay un Tractor\n")
                  (display "Y el Tractor: Bruum \n Y el Pollito: oh oh!\n")))
          ; If there are animals in the list, it will iterate this loop until its empty
          (else (begin (display (string-append "En la radio hay " (car animalsUn) "\n")) ; this takes and prints the current element in 'animalsUn'
                       ;in the list according to the iteration
                       (display (string-append "Y " (string-join (cons (car animals) so-far) " \n Y ") "\n")) ; this prints and adds the new and previous animals using 'so-far' 
                       (pollito-lyrics-helper (cdr animals) (cdr animalsUn) (cons (car animals) so-far)))))) ; this recursively calls itself until there are no more animals 

  (pollito-lyrics-helper animals animalsUn '()))

(pollito-lyrics)