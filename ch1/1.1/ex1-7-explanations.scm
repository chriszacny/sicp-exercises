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

(define (sqrt x)
    (sqrt-iter 1.0 x)
)

; (sqrt 0.0000000000001)
; --> our answer: .03125000000106562
; --> correct: 3.162277660168379e-07
; --> (square 0.000000316) = 9.985600000000002e-14
; --> 0.0000000000009985600000000002 -> rounds up to correct answer.
; Why is our answer so incorrect? I suspect it is because we are comparing a good enough answer testing if two small numbers and up being less then 0.001, 
;   which they quickly will be after just a few guesses. In fact, and extremely small nubmer will likely return .03125000000106562.
;   test: (sqrt 0.00000000000000000000000000000000000000001). returns: .03125

; works - (sqrt 1,000,000,000,000) 1 trillion
; --> (sqrt 1000000000000)
; cpu 100% - (sqrt 10,000,000,000,000) 10 trillion
; --> (sqrt 10000000000000)
;
; (average 1.0 (/ 10000000000000 1.0))
; (average 5000000000000.5 (/ 10000000000000 5000000000000.5))
; Why does 1 trillion work fine, but 10 trillion goes on forever? Debugging it, it looks like the guesses start appending significant digits as they go along.
;   My guess is that the closer you get to 10 trillion, you will have many significant digits, which in some way never allows the test of 
;   (< (abs (- (square guess) x)) 0.001) to be true. Therefore, the test runs infinitely.