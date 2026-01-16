(require picturing-programs)

(define (count-div k n)
  (cond [(= 0 (remainder n k))
         1]
        [else
         0]))

(check-expect (count-div 2 10) 1)
(check-expect (count-div 3 10) 0)

; count-divisors: number(n) -> number
; purpose: how many integers 1..n divide n?

(define (count-divisors n)
  (count-divisors-helper 1 n))

(check-expect (count-divisors 2)
              2)
(check-expect (count-divisors 3)
              2)
(check-expect (count-divisors 4)
              3)
(check-expect (count-divisors 10)
              4)

; 1 => 1
; 2 => 1,2
; 3 => 1,3
; 4 => 1,2,4
; 5 => 1,5
; 6 => 1,2,3,6
; 7 => 1,7
; 8 => 1,2,4,8
; 9 => 1,3,9




; cdh: how many numbers from start to end divide end?
; numbers n with start<= n <= end that divide end

; example:
; (cdh 1 6) => 4
; (cdh 2 6) => 3
; (cdh 3 6) => 2
; (cdh 4 6) => 1
; (cdh 5 6) => 1
; (cdh 6 6) => 1

(define (count-divisors-helper start end)
  (cond [(< end start)
         0]
        [(= start end)
         1]
        [else
         (+ (count-div start end)
            (count-divisors-helper (+ 1 start)
                                   end))]))
(define cdh count-divisors-helper)
;; examples for (cdh ?? 6)
(check-expect (cdh 1 6)  4)
(check-expect  (cdh 2 6)  3)
(check-expect  (cdh 3 6)  2)
(check-expect  (cdh 4 6)  1)
(check-expect  (cdh 5 6)  1)
(check-expect  (cdh 6 6)  1)


