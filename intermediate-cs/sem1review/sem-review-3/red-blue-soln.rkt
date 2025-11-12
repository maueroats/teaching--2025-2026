;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname red-blue-soln) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require picturing-programs)

#|
Red-blue.
Standard dice have 6 sides, numbered 1 through 6.
Play a game with a standard blue die and
two standard red dice.

The number of points you get is
 ten times the blue roll
plus
three times the sum of the other two.

Except you get zero points if your red dice total 4. Design and test the red-blue function.
|#

; example:
; blue = 4 red1 = 6 red2 = 1
; 10*4    +       3 * (6 + 1)
; (+ (* 4 10)
;    (* 3 (+ 6 1)))
; = 51
`

; example:
; blue = 5  red1 = 1  red2 = 3
; (+ 1 3) ==> 4
; points = 0


(define (red-blue-help blue red1 red2)
  (cond [(= 4 (+ red1 red2))
         0]
        [else
         (+ (* 10 blue)
            (* 3 (+ red1 red2)))]))

(check-expect (red-blue-help 5 1 3) 0)
(check-expect (red-blue-help 4 6 1) 61)

(define (red-blue ignore)
  (red-blue-help (dice-roll 1)
                 (dice-roll 2)
                 (dice-roll 3)))

(define (dice-roll x)
  (+ 1 (random 6)))



; model

; show picture of circles               ====> image
; know what color circle to draw next   ====> number
; number: 0=red 1=green 2=blue

(define-struct mm (img num))

; draw-handler
; draw-h: mm(model) -> image
; purpose: return a picture of the circles

(define (draw-h model)
  (mm-image model))

;; mouse-handler: mm (old-model) num(x) num(y) string(event)
;;                -> mm (new-model)

;; new model is:
;;  image = draw a random circle on old image
;;  number = old number + 1 (maybe remainder 3)
















