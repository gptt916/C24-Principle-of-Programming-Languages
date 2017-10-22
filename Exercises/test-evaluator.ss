#lang racket

(require rackunit)
(require rackunit/text-ui)
(require "evaluator.ss")

(define-test-suite evaluator-test-suite
  
  (test-equal? 
   "evaluate"
   (evaluate '(a and b)
             '((a . #t) (b . #f)))
   #f)

  (test-equal? 
   "evaluate"
   (evaluate '(a and b)
             '((a . #t) (b . #t)))
   #t)

  (test-equal? 
   "evaluate"
   (evaluate '(a or b)
             '((a . #t) (b . #f)))
   #t)

  (test-equal? 
   "evaluate"
   (evaluate '(a or b)
             '((a . #t) (b . #t)))
   #t)

  (test-equal? 
   "evaluate"
   (evaluate '(a or b)
             '((a . #f) (b . #t)))
   #t)

  (test-equal? 
   "evaluate"
   (evaluate '(a or b)
             '((a . #f) (b . #f)))
   #f)

  (test-equal? 
   "evaluate"
   (evaluate '(a and (b or c))
             '((a . #t) (b . #f) (c . #t)))
   #t)

  (test-equal? 
   "evaluate"
   (evaluate '(not a)
             '((a . #f)))
   #t)

  (test-equal? 
   "evaluate"
   (evaluate '(not a)
             '((a . #t)))
   #f)
  
  (test-equal? 
   "evaluate"
   (evaluate '((a and (not b)) or ((a and c) or ((not b) and c)))
             '((a . #t) (b . #f) (c . #f) (d . #t)))
   #t)
  )

(define-test-suite simplifier-test-suite
  
  (test-equal? 
   "simplify"
   (simplify '(a and (b or c))
             '((a . #t) (b . #f) (c . #t)))
   #t)

  (test-equal? 
   "simplify"
   (simplify '(a and (b or c))
             '((b . #f) (c . #t)))
   'a)

  (test-equal? 
   "simplify"
   (simplify '(#t and x)
             '())
   'x)

  (test-equal? 
   "simplify"
   (simplify '(x and #t)
             '())
   'x)

  (test-equal? 
   "simplify"
   (simplify '(#f and x)
             '())
   #f)

  (test-equal? 
   "simplify"
   (simplify '(x and #f)
             '())
   #f)

  (test-equal? 
   "simplify"
   (simplify '(#t or x)
             '())
   #t)

  (test-equal? 
   "simplify"
   (simplify '(x or #t)
             '())
   #t)

  (test-equal? 
   "simplify"
   (simplify '(#f or x)
             '())
   'x)

  (test-equal? 
   "simplify"
   (simplify '(x or #f)
             '())
   'x)
  
  (test-equal? 
   "simplify"
   (simplify '(not (a and (b or c)))
             '((b . #f) (c . #t)))
   '(not a))

  (test-equal? 
   "simplify"
   (simplify '(d and (a and (b or c)))
             '((b . #f) (c . #t)))
   '(d and a))

  (test-equal? 
   "simplify"
   (simplify '((x and y) or (not z))
             '((z . #t)))
   '(x and y))

  (test-equal? 
   "simplify"
   (simplify '((a and (not b)) or ((a and c) or ((not b) and c)))
             '((a . #t) (c . #f) (d . #t)))
   '(not b))
  )

(run-tests evaluator-test-suite)
(run-tests simplifier-test-suite)