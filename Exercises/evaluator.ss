(module evaluator scheme

  ; some helper functions that should make your code much easier to read
  (define unary-op first)
  (define operand second)
  (define binary-op second)
  (define left first)
  (define right third)
  (define (atomic? v) (not (list? v)))
  (define (unary? expr) (= 2 (length expr)))
  (define (binary? expr) (= 3 (length expr)))
  
  ; It is a good idea to define more such helpers here...

  ; (eval symb context)-> boolean
  ; expr: a valid atomic expression,
  ; can either be a symbol or a primitive
  ; context: list of pairs: symbol to #t/#f
  ; Return the accociated boolean value to a symbol,
  ; or the value its self if it is a primitive
  (define (eval symb context)
    (if (dict-has-key? context symb)
        (dict-ref context symb)
        symb))
  
  ; (evaluate expr context) -> boolean
  ; expr: a valid representation of an expression
  ; context: list of pairs: symbol to #t/#f
  ; Return the value of expr with values of all variables
  ; that occur in expr specified in context.
  (define (evaluate expr context)
      (if (atomic? expr)
          (eval expr context)
          (if (unary? expr)
              (if (eq? (unary-op expr) 'not)
                  (not (evaluate (operand expr) context))
                  (display "unary error"))
              (if (binary? expr)
                  (if (eq? (binary-op expr) 'and)
                      (and (evaluate (left expr) context)
                           (evaluate (right expr) context))
                      (or (evaluate (left expr) context)
                          (evaluate (right expr) context)))
                  (display "binary error")))))
  
  ; (simplify-not expr contex)-> expr or primitive
  ; expr: a valid expression,
  ; context: list of pairs: symbol to #t/#f
  ; recursively call the simplify procedure for unary expr
  (define (simplify-not expr context)
    (if (or (eq? (simplify (operand expr) context) #t)
            (eq? (simplify (operand expr) context) #f))
        (not (simplify (operand expr) context))
        (list 'not (simplify (operand expr) context))))
  
  ; (simplify-and expr contex)-> expr or primitive
  ; expr: a valid expression,
  ; context: list of pairs: symbol to #t/#f
  ; recursively call the simplify procedure for binary and expr
  (define (simplify-and expr context)
    (if (eq? (simplify (left expr) context) #t)
        (simplify (right expr) context)
        (if (eq? (simplify (right expr) context) #t)
            (simplify (left expr) context)
            (if (or (eq? (simplify (left expr) context) #f)
                    (eq? (simplify (right expr) context) #f))
                #f
                (list (simplify (left expr) context)
                      'and
                      (simplify (right expr) context))))))
  
  ; (simplify-and expr contex)-> expr or primitive
  ; expr: a valid expression,
  ; context: list of pairs: symbol to #t/#f
  ; recursively call the simplify procedure for binary or expr
  (define (simplify-or expr context)
    (if (eq? (simplify (left expr) context) #f)
        (simplify (right expr) context)
        (if (eq? (simplify (right expr) context) #f)
            (simplify (left expr) context)
            (if (or (eq? (simplify (left expr) context) #t)
                    (eq? (simplify (right expr) context) #t))
                #t
                (list (simplify (left expr) context)
                      'or
                      (simplify (right expr) context))))))
  
  ; (simplify expr context) -> valid expression
  ; expr: a valid representation of an expression
  ; context: list of pairs: symbol to #t/#f
  ; Return an expression that is equivalent to expr,
  ; but is simplified as much as possible, according to
  ; the given rules.
  (define (simplify expr context)
      (if (atomic? expr)
          (eval expr context)
          (if (unary? expr)
              (if (eq? (unary-op expr) 'not)
                  (simplify-not expr context)
                  (display "unary error"))
              (if (binary? expr)
                  (if (eq? (binary-op expr) 'and)
                      (simplify-and expr context)
                      (simplify-or expr context))
                  (display "binary error")))))
  
  (provide evaluate simplify) 
  )
