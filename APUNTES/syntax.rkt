#lang racket

(provide leap? month-days next-day)

; Use indentation to organize the code and make it legible

(define (leap? year)
  (if (= 0 (remainder year 4))
      (if (= 0 (remainder year 100))
        ; The predicate 'zero?' can be used to compare if a value is 0
        (if (zero? (remainder year 400))
          #t
          #f)
        #t)
      #f))

; This function does not use if, and instead
; returns the result of the expresion, since it is also boolean
(define (leap-2? year)
  (and (zero? (remainder year 4))
       (or (not (zero? (remainder year 100)))
           (zero? (remainder year 400)))))

; Function to return the number of days in the given month
(define (month-days month year)
  (case month
    [(4 6 9 11) 30]
    [(2) (if (leap? year) 29 28)]
    [else 31]))

; Function to return the date of the day after
; the input provided
(define (next-day day month year)
  (if (= day (month-days month year))
    (if (= 12 month)
      (list 1 1 (add1 year))
      (list 1 (add1 month) year))
    (list (add1 day) month year)))