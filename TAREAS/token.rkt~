
#|

Simple caesar enconding for text files

|#

#lang racket

(require racket/trace)

(provide (all-defined-out))

(define (shift-chars char offset)
  "Return a new charcater with  offset distance from the original character"
  (integer->char(+ offset (char->integer char))))


(define (shift-line line offset)
  " Shifts every character in the input string an offset distance
   return a new string"
  (list->string
   (map (lambda (char) (shift-chars char offset))
        (string->list line))))

(define (caesar in-filename out-filename offset)
  "Encode a file using the Caesar Cipher"
  (display-to-file
   (string-join
    (map (lambda (line) (shift-line line offset))
         (file->lines in-filename))
           
    "\n")
         out-filename))
