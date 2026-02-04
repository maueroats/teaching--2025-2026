;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ch08-review-ii-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

(define (draw slope)
  (place-image (line 500 (round (* slope 500)) "black")
               50 25
               (empty-scene 200 200)))

(define (mouseh slope x y event)
  (/ (- y 25)
     (cheat (- x 50))))

; this method prevents division by zero
(define (cheat n)
  (+ 0.1 n))

(big-bang 1
  (on-draw draw)
  (on-mouse mouseh))


