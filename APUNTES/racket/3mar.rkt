#lang racket
(require racket/trace)

(provide len len-tail sum-list sqrt-list invert sqrt-list-fast new-map )

; Function to count the number of elements in a list
(define(len lst)
    (if (empty? lst)
      0
      (+ 1 (len(cdr lst)))))
    

; Count the number of elements in a list using tail
(define(len-tail lst)
    (let loop
        ([lst lst]
            [res 0])
            (if (empty? lst)
            res
            (loop (cdr lst) (add1 res)))))

; Sum all numbeers in a list
(define (sum-list lst)
    (let loop
        ([lst lst]
        [res 0])
    (if (empty? lst)
        res
        (loop (cdr lst(+ (car lst) res))))))

; Invert the order of the elements in a list
(define (invert lst)
    (trace-let loop
    ([lst lst]
    [res '()])
    (if (empty? lst)
    res
    (loop (cdr lst) (cons (car lst) res)))))

; Squre root each element in a list
(define (sqrt-list lst)
    (let loop
    ([lst lst]
    [res '()])
    (if (empty? lst)
    res
    (loop (cdr lst)
          (append res (list(sqrt(car lst))))))))


; Squre root each element in a list-> fast
(define (sqrt-list-fast lst)
    (let loop
      ([lst lst]
       [res '()])
    (if (empty? lst)
        (reverse res)
    (loop (cdr lst)
          (cons (sqrt( car lst))res)))))

; Create map -> Toma función y lista y le pone la función a todos los elementos
(define (new-map func lst)
    (let loop
      ([lst lst]
       [res '()])
    (if (empty? lst)
        (reverse res)
    (loop (cdr lst)
          (cons (func( car lst))res)))))

(trace len)