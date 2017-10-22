(module lab3 scheme

  ;;; (my-length xs) -> int
  ;;; xs: list
  ;;; Return the length of xs.
  (define my-length (λ(lst)
                      (if (empty? lst)
                           0
                           (+ 1 (my-length (rest lst))))))

  ;;; (reverse xs) -> list
  ;;; xs: list
  ;;; Return the reverse of xs.
  (define my-reverse (λ (lst) (if (empty? lst)
                                  '()
                                  (cons (last lst) (my-reverse (get lst))))))

  ;;; (is-pal xs) -> boolean
  ;;; xs: list
  ;;; Return whether xs is a palindrome.
  (define is-pal (λ (lst)
                   (or
                    (<= (length lst) 1)
                    (and
                     (eqv? (first lst) (last lst))
                     (is-pal (get (rest lst)))))))


  (define get (λ (lst) (if (= 1 (length lst))
                           '()
                           (cons (first lst) (get (rest lst))))))
  ;;; (num-el xs) -> int
  ;;; xs: list
  ;;; Return the number of (non-list) elements of lst, on any nesting level.
  (define num-el (λ (lst) (if (empty? lst)
                              0
                              (if (not (list? (first lst)))
                                  (+ 1
                                     (num-el(rest lst)))
                                  (+ (num-el (first lst))
                                     (num-el(rest lst)))))))

  ;;; (stutter xs) -> list
  ;;; xs: list
  ;;; Return a list, which repeats each element of lst.
  (define stutter (λ (lst) (if (empty? lst)
                               '()
                               (append (cons (first lst)
                                               (list (first lst)))
                                       (stutter (rest lst))))))

  ;;; (my-filter f xs) -> list
  ;;; f: boolean-valued function applicable to every element of xs
  ;;; xs: list
  ;;; Return a list of those elements from xs that pass the function
  ;;;  f (i.e., f(x) is true for element x in xs), in their original order.
  (define my-filter (λ (f lst) (if (empty? lst)
                                   '()
                                   (if (f (first lst))
                                       (cons (first lst)
                                               (my-filter f (rest lst)))
                                       (my-filter f (rest lst))))))


  ;;; (my-map f xs) -> list
  ;;; f: function applicable to every element of xs
  ;;; xs: list
  ;;; Return the result of applying f to every element of xs.
  (define my-map (λ (f lst) (if (empty? lst)
                                '()
                                (cons (f (first lst)) (my-map f (rest lst))))))
  

  (provide my-length my-reverse is-pal num-el stutter my-filter my-map)
  )
