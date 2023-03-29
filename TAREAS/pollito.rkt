; Created by Maria Fernanda Cortés Lozano and Arantza Parra Martínez

#lang racket

; (define animales (list "un Pollito Pio" "una Gallina Coo" "un Gallo Coroco" "un Pavo Glu Glu Glu" "un Perro Guau Guau" "un Gato Miau" "una Cabra me" "un Cordero bee" "una Vaca Mu" "un Toro muu"))
; (define animalesY (list "Y el Pollito Pio" "Y la Gallina Coo" "Y el Gallo Coroco" "Y el Pavo Glu Glu Glu" "Y el Perro Guau Guau" "Y el Gato Miau" "Y la Cabra me" "Y el Cordero bee" "Y la Vaca Mu" "Y el Toro muu"))
; (define inicio (list "En la radio hay u"))

; (define (replace-u str animal)
;   (string-replace str "u" animal))

; (define (pollito-lyrics inicio animales animalesY)
;   (if (null? animales)
;       '()
;       (let ((animal (car animales))
;             (animalY (car animalesY)))
;         (append (list (replace-u inicio animal))
;                 (list "\n")
;                 (list animalY)
;                 (list "\n")
;                 (pollito-lyrics inicio (cdr animales) (cdr animalesY))))))

; (define (pollitopio inicio animales animalesY )
;   (pollito-lyrics (car inicio) animales animalesY) )

; (displayln (pollitopio inicio animales animalesY))


 
(define animales (list " un Pollito Pio" "una Gallina Coo" "un Gallo Coroco" "un Pavo Glu Glu Glu" "un Perro Guau Guau" "un Gato Miau" "una Cabra me" "un Cordero bee" " una Vaca Mu" " un Toro muu"))
(define animalesla (list "Y el Pollito Pio" "Y la Gallina Coo" "Y el Gallo Coroco" "Y el Pavo Glu Glu Glu" "Y el Perro Guau Guau" "Y el Gato Miau" "Y la Cabra me" "Y el Cordero bee" " Y la Vaca Mu" " Y el Toro muu"))
(define inicio (list "En la radio hay u"))

(define (pollitopio inicio animales animalesla)
   (define cancion '())
   (define agregado '())
   (for ([i inicio])
     (for ([x (range (length animales))])
       (set! cancion (append cancion (list (string-replace i "u" (list-ref animales x) ))))
       
       (set! agregado (cons (list-ref animalesla x) agregado))
       
       (set! cancion (append cancion agregado))))
   cancion)

 (displayln (pollitopio inicio animales animalesla))