;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ch08-review-ii-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

(define (f x)
  (abs (- x 90)))

(define (draw-h x)
  (place-image (circle 10 "solid" "blue")
               x (- 200 (f x))
               (empty-scene 200 200)))

(define (tck n)
  (remainder (add1 n)
             201))

(check-expect (tck 0) 1)
(check-expect (tck 200) 0)
  

(define (mouse n x y event)
  (+ 2 n))

(define (key n k)
  0)
           
(big-bang 0
  (on-draw draw-h)
  (on-mouse mouse)
  (on-tick tck)
  (on-key key))
