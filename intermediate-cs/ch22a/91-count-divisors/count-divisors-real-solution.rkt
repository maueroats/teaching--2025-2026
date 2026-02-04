; I have cut out check expects to make it shorter to read online.

(define (count-divisors-helper start end)
  (cond [(< end start)
         0]
        [(= start end)
         1]
        [else
         (+ (count-div start end)
            (count-divisors-helper (+ 1 start)
                                   end))]))

(define (count-divisors n)
  (count-divisors-helper 1 n))

(define (count-div k n)
  (cond [(= 0 (remainder n k))
         1]
        [else
         0]))
