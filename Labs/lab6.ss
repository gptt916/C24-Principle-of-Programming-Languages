(module lab6 scheme
  
;;; (my-reverse xs) -> list
;;; xs: list
;;; Return the reverse of xs. (Not tail-recursive.)
(define my-reverse-1
  (λ (xs)
    (if (empty? xs)
        '()
        (append (my-reverse-1 (rest xs)) (list (first xs))))))

;;; tail-recursive version
(define my-reverse-2
  (λ (xs)
    (letrec ([tail-rec (λ (xs lst)
                   (if (empty? xs)
                       lst
                       (tail-rec (rest xs) (cons (first xs) lst))))])
    (tail-rec xs '()))))

;;; (num-elts xs) -> int
;;; xs: list
;;; Return the number of elements in xs, including
;;; any sublists, on any nesting level.
;;; using recursion only, no tail recursion
(define num-els-1
  (λ (xs)
    (if (empty? xs)
        0
        (if (list? (first xs))
            (+ (num-els-1 (first xs)) (num-els-1 (rest xs)))
            (+ 1 (num-els-1 (rest xs)))))))

;;; using HOPs (and recursion)
;;; this solution should be much shorter!
(define num-els-2
  (λ (xs)
    (if (not (list? xs))
        1
        (apply + (map num-els-2 xs)))))

;;; tail-recursive version
(define num-els-3
  (λ (xs)
    (letrec ([tail-rec (λ (xs count)
                         (if (empty? xs)
                             count
                             (if (list? (first xs))
                                 (tail-rec (rest xs) (tail-rec (first xs) count))
                                 (tail-rec (rest xs) (+ 1 count)))))])
      (tail-rec xs 0))))

;;; (flatten xs) -> list
;;; xs: list
;;; Return the flattened version of xs. 
;;; using recursion only, no tail recursion
(define flatten-1
  (λ (xs)
    (if (empty? xs)
        '()
        (if (list? (first xs))
            (append (flatten-1 (first xs)) (flatten-1 (rest xs)))
            (cons (first xs) (flatten-1 (rest xs)))))))

;;; using HOPs (and recursion)
(define flatten-2
  (λ (xs)
    (foldr (λ (frst rst)
             (if (list? frst)
                 (append (flatten-2 frst) rst)
                 (cons frst rst))) '() xs)))

;;; tail-recursive version
(define flatten-3
  (λ (xs)
    (letrec ([tail-rec (λ (xs flat)
                        (if (empty? xs)
                            flat
                            (if (list? (first xs))
                                (tail-rec (rest xs) (tail-rec (first xs) flat))
                                (tail-rec (rest xs) (append flat (list (first xs)))))))])
    (tail-rec xs '()))))

(provide my-reverse-1 my-reverse-2 num-els-1 num-els-2 num-els-3 flatten-1 flatten-2 flatten-3)
)
