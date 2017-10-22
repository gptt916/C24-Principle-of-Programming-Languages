(module lab7 scheme
  
  ;;; define a tail-recursive, linear-time foldr without using
  ;;; continuation passing style
  (define (foldr-tail proc end xs)
    (letrec ([tail (λ (xs res)
                     (if (empty? xs)
                         res
                         (tail (rest xs) (proc (first xs) res))))])
      (tail xs end)))
  
  ;;; define a tail-recursive, linear-time foldr using CPS
  (define (foldr-cps proc end xs)
    (letrec ([cps (λ (xs k)
                    (if (empty? xs)
                        (k end)
                        (cps (rest xs) (λ (v) (k (proc (first xs) v))))))])
      (cps xs identity)))
  
  ; define a tail-recursive linear-time version of map (a simplified version
  ; that works on one list) using CPS
  (define (map-cps proc xs)
    (letrec ([cps (λ (xs k)
                    (if (empty? xs)
                        (k '())
                        (cps (rest xs) (λ (v) (k (cons (proc (first xs)) v))))))])
      (cps xs identity)))

  
  (provide foldr-tail foldr-cps map-cps)
  )
