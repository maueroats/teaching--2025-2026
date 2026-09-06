;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ch08-review-ii-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

(define start-model 20)

(define (draw-handler n)
  (overlay (ellipse (* 4 n) (* 3 n) "solid" "orange")
           (rectangle 500 400 "solid" "blue")))

(define (mouse-handler n x y event)
  (max 0 x))

(define (key-handler n key)
  20)

(big-bang start-model
  (on-draw draw-handler)
  (on-key key-handler)
  (on-mouse mouse-handler))