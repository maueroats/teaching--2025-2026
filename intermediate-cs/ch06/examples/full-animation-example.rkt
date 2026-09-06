;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 2017-10-15-example) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require picturing-programs)
(define original-model (square 50 "solid" "purple"))
(define (move-down model)
    (above (rectangle 0 5 "solid" "white")
           model))
(define (three-copies model)
  (overlay/align "middle" "top"
   (beside model
           (rectangle 75 0 "solid" "white")
           model
           (rectangle 75 0 "solid" "white")
           model)
   (empty-scene 500 400)))
(define (reset model key)
  original-model)
(define (shrink model x y event)
  (scale 0.99 model))
(big-bang original-model
          (on-tick move-down)
          (on-draw three-copies)
          (on-key reset)
          (on-mouse shrink))
