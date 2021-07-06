(define (square x) 
    (* x x)
)

(define (sum-of-squares x y)
    (+ (square x) (square y))
)

(define (<= x y)
    (or (< x y) (= x y))
)

(define (f a b c)
    (cond 
        ((and (<= a b) (<= a c)) (sum-of-squares b c) ) 
        ((and (<= b c) (<= b a)) (sum-of-squares a c) )
        (else (sum-of-squares a b) )
))

;expect 13
(f 1 2 3)

;expect 13
(f 3 2 1)

;expect 8
(f 2 2 2)

;expect 13
(f 2 2 3)

;expect 18
(f 3 1 3)