(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)
    )
)

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2) )

(define (abs x)
    (if (< x 0)
        (- x)
        x
    )
)

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001)
)

(define (improve guess x)
    (average guess (/ x guess))
)

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) 
        x)
    )
)

; Note the infinite recursion because of new-if and the way cond is evaluated.
(define (sqrt-iter-bad guess x)
    (new-if (good-enough? guess x)
        guess
        (sqrt-iter-bad (improve guess x) x)
    )
)

(define (sqrt x)
    (sqrt-iter 1.0 x)
)