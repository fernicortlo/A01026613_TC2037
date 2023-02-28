
Functions to practice recursion in racket

#lang racket

(provide !)

(define (! n)
    (if (zero? n)
        1
        (* n(! (sub1 n)))))