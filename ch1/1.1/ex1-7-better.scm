(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2) )

(define (abs x)
    (if (< x 0)
        (- x)
        x
    )
)

(define (good-enough? guess prevguess)
    (< (abs (- guess prevguess)) 0.0000000000001)
)

(define (improve guess x)
    (average guess (/ x guess))
)

(define (sqrt-iter guess prevguess x)
    (if (good-enough? guess prevguess)
        guess
        (sqrt-iter (improve guess x) 
        guess
        x)
    )
)

; I am just using 0.0 as prevguess to guarantee the difference forces it to improve at least once.
(define (sqrt x)
    (sqrt-iter 1.0 0.0 x)
)

; This new set of procedures works better, but it might make more sense to look at the input of x in the sqrt for small numbers, count the significant digits and use
;   that as the comparison vs the blanket 0.0000000000001. Numbers smaller than 0.0000000000001 will still be incorrect. The large numbers appear to be mostly correct.