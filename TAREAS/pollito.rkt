; Created by Maria Fernanda Cortés Lozano and Arantza Parra Martínez

; The following code prints the lyrics of the song "El Pollito Pio" using recursion
#lang racket

;first, we define the lists of the animals and the beginning of the song
(define animales (list "un Pollito Pio" "una Gallina Coo" "un Gallo Corocó" "un Pavo Glú Glú Glú" "una Paloma Ruu" "un Perro Guau Guau" "un Gato Miau" "una Cabra me" "un Cordero bee" " una Vaca Moo" " un Toro Muu"))
(define animalesY (list "Y el Pollito Pio" "Y la Gallina Coo" "Y el Gallo Corocó" "Y la Paloma Ruu" "Y el Pavo Glú Glú Glú" "Y el Perro Guau Guau" "Y el Gato Miau" "Y la Cabra me" "Y el Cordero bee" "Y la Vaca Moo" "Y el Toro Muu"))

(define inicio (list "En la radio hay "))

;we define the function that will print the lyrics
(define (pollito-lyrics inicio animales animalesla)
  (define pollitoPio '())
  (define agregar '())
  (for ([i inicio])
    (for ([x (range (length animales))])
      (set! pollitoPio (append pollitoPio (list (string-replace i "u" (list-ref animales x)))))
      (set! agregar (cons (list-ref animalesY x) agregar))
      (set! pollitoPio (append pollitoPio agregar))))
  pollitoPio)

(displayln (pollito-lyrics inicio animales animalesY))