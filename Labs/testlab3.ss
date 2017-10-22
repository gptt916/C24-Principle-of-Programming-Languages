#lang scheme

(require "lab3.ss")
(require test-engine/scheme-tests)

(check-expect (my-length empty) 0)

(check-expect (my-length '(1 2 3)) 3)

(check-expect (my-reverse '(1 2 3 4)) '(4 3 2 1))

(check-expect (my-reverse empty) '())

(check-expect (is-pal '(1 2 3)) #f)

(check-expect (is-pal '(1 2 1)) #t)

(check-expect (is-pal empty) #t)

(check-expect (num-el '(1 2 3)) 3)

(check-expect (num-el '((1 2) 3)) 3)

(check-expect (num-el '(())) 0)

(check-expect (stutter '(1 2 3)) '(1 1 2 2 3 3))

(check-expect (stutter '((1) 2 3)) '((1) (1) 2 2 3 3))

(check-expect (my-filter even? '(1 2 3 4 5 6)) '(2 4 6))

(check-expect (my-filter even? '(1 1 1 1 1 1)) '())

(check-expect (my-filter even? empty) '())

(check-expect (my-map even? '(1 2 3 4 5 6)) '(#f #t #f #t #f #t))

(test)
