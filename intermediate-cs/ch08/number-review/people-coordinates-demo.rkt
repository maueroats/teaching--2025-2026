;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname people-coordinates-demo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

(define Q
  (frame (rectangle 200 200 "solid" "yellow")))

(define BG (above (beside Q Q)
                  (beside Q Q)))

BG

(define PT (circle 15 "solid" "cyan"))

(define (f x)
  (+ (* 2 x) 100))

(define (draw-h x)
  (place-image PT (+ 200 x) (- 200 (f x)) BG))

(define (key-h x key)
  -200)

(big-bang -200
  (on-draw draw-h)
  (on-tick add1)
  (on-key key-h))


  

