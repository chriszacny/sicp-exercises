;; Apparently this is all they are looking for from the Scheme perspective.
(define (compute r i)
  (if (or (= i 0) (= i (- r 1)))
      1
      (+ (compute (- r 1) (- i 1)) (compute (- r 1) i))))
