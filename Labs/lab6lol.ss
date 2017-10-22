(module lab6 scheme
  
;;; (my-reverse xs) -> list
;;; xs: list
;;; Return the reverse of xs. (Not tail-recursive.)
(define my-reverse-1
  (λ (xs)
    (if (empty? xs)
        '()
        (append (my-reverse-1 (rest xs)) (list(first xs))))))

  
;;; tail-recursive version
(define my-reverse-2
  (λ (xs)
  (define reverser
    (λ (acc xs)
      (if (empty? xs)
          acc
          (reverser (cons (first xs) acc) (rest xs)))))
  (reverser '() xs)))

;;; (num-els xs) -> int
;;; xs: list
;;; Return the number of elements in xs, including
;;; any sublists, on any nesting level.
;;; using recursion only, no tail recursion
(define num-els-1
  (λ (xs)
    (if (empty? xs)
        0
        (if (list?(first xs))
            (+ (num-els-1 (first xs)) (num-els-1 (rest xs)))
            (+ 1 (num-els-1 (rest xs)))))))

;;; using HOPs (and recursion)
;;; this solution should be much shorter!
(define num-els-2
  (λ (xs)
    (foldr (λ (x y)
             (if
              (list? x)
              (+ (num-els-2 x) y)
              (+ 1 y))) 0 xs)
    ))

;;; tail-recursive version
(define num-els-3
  (λ (xs)
    (define counter
      (λ (acc xs)
        (if (empty? xs)
            acc
            (if (list? (first xs))
                (counter (counter acc (first xs)) (rest xs))
                (counter (+ 1 acc) (rest xs))))))
    (counter 0 xs)))


;;; (flatten xs) -> list
;;; xs: list
;;; Return the flattened version of xs. 
;;; using recursion only, no tail recursion
(define flatten-1
  (λ (xs)
    (if (empty? xs)
        '()
        (if (list? (first xs))
            (append (flatten-1 (first xs))(flatten-1 (rest xs)))
            (cons (first xs) (flatten-1 (rest xs)))))
    ))

;;; using HOPs (and recursion)
(define flatten-2
  (λ (xs)
    (foldr (λ (x y)
             (if
              (list? x)
              (append (flatten-2 x) y)
              (cons x y))) '() xs)
    ))
;;; tail-recursive version
(define flatten-3
  (λ (xs)
    (define flattener
      (λ (acc xs)
        (if (empty? xs)
            acc
            (if (list? (first xs))
                (flattener (flattener acc (first xs)) (rest xs))
                (flattener (append acc (list (first xs))) (rest xs))))))
    (flattener '() xs)))
(provide my-reverse-1 my-reverse-2 num-els-1 num-els-2 num-els-3 flatten-1 flatten-2 flatten-3)
)