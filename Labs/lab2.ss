#lang racket
(define plus42 (λ(x) (+ x 42)))
(define my-avg(λ(x y) (/ (+ x y) 2)))
(define apply-func (λ(func x) (func x)))
