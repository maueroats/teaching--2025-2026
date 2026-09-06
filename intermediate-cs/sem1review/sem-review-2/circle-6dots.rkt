;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2018-01-09-circle-6dots) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(require "posn-util.rkt")

(define DOT (circle 10 "solid" "blue"))

(define R 100)
(define CENTER (make-posn R R))
(define BG (circle R "outline" "black"))

; model: number

; basic method: just a big cond to decide
; which coordinates go with which number
(define (pt n)
  (cond [(= n 0) (make-posn R 0)]
        [(= n 3) (make-posn R (* 2 R))]
        [else (make-posn R R)]))

; fancy method, no big table:
; 60 degrees, in radians for DrRacket trig
(define DEGREES60 (* 60 pi 1/180))

(define (pt2 n)
  (add-posn
   CENTER 
   (make-posn (* R (cos (* DEGREES60 n)))
              (* R (sin (* DEGREES60 n))))))








(define (draw-h n)
  (place-image/posn DOT (pt2 n) BG))

(define (tick-h n)
  (random 6))

(big-bang 0
  (on-draw draw-h)
  (on-tick tick-h 0.3))


