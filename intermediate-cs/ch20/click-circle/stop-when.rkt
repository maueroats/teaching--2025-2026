;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2017-12-15-stop-when) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define start-model 0)
(define (quick-text txt)
  (text txt 64 "black"))
(define (draw-h n)
  (quick-text (number->string n)))
(define (draw-final n)
  (quick-text "ALL DONE"))
(define (above-20? n)
  (<= 20 n))
(big-bang start-model
  (on-draw draw-h 300 200)
  (on-tick add1 0.1)
  (stop-when above-20? draw-final))
