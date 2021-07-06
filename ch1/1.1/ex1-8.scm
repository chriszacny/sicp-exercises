(define (square x) (* x x))

;(define (average x y) (/ (+ x y) 2) )

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
    ; guess == y
    (/ (+ (/ x (square guess)) (* 2 guess) ) 3)
)

(define (cbrt-iter guess prevguess x)
    (if (good-enough? guess prevguess)
        guess
        (cbrt-iter (improve guess x) 
        guess
        x)
    )
)

; I am just using 0.0 as prevguess to guarantee the difference forces it to improve at least once.
(define (cbrt x)
    (cbrt-iter 1.0 0.0 x)
)
