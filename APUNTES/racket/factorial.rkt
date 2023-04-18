
; Functions to practice recursion in racket

#lang racket
(provide ! tail-! sum-digits tail-sum-digits)

;import librabry for debugging 
(require racket/trace)

(define (! n)
    (if (zero? n)
    1
    (* n(! (sub1 n)))))


(define (sum-digits number)
  (if(zero? number)
  0
  (+ (remainder number 10)
        (sum-digits (quotient number 10)))))

; using tail recursion for factorial
(define(tail-! n)
  (do-tail-! n 1))

(define(do-tail-! n a)
  (if(zero? n)
   a
    (do-tail-! (sub1 n) (* n a))))



; tail recursion for sum-digits
(define (tail-sum-digits num)
  (do-tail-sum-digits num 0)

(define (do-tail-sum-digits num res) 
  (if (zero? num)
  res
  (do-tail-sum-digits (quotient num 10))
                      (+ res (remainder num 10)))))

; use to debug funtion calls
(trace !)
(trace sum-digits)
(trace do-tail-!)
(trace do-tail-sum-digits)