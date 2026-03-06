;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname median) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

; median: num num num -> num
; find the middle number after putting them in order

(check-expect (median 7 2 3) 3)
(check-expect (median 2 7 3) 3)
(check-expect (median 7 3 2) 3)
(check-expect (median 2 3 7) 3)
(check-expect (median 3 7 2) 3)
(check-expect (median 3 2 7) 3)

; my method: subtract smallest and largest from the total.
; yours could be different/messier
(define (median a b c)
  (- (+ a b c)
     (min a b c)
     (max a b c)))

; this try was wrong, but my checks caught it
(define (median-try1 a b c)
  (max a (min b c)))

