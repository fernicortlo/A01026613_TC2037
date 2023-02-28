
#lang racket

(define (sum-digits number)
  if(zero? number)
  0
    (+ (remainder number 10)
        (sum-digits (quotient number 10))))