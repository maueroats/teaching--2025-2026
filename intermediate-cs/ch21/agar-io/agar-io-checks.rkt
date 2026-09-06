;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2019-01-17-agario-single) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

(require "posn-util.rkt")

;
; GAME: single player, single dot agar.io
; eat the dot and get larger
; larger player moves slower
; win when you radius is 40
;
; SCENE:
; move around on the screen
; motion follows mouse

; model: position-velocity-radius-point
; position and velocity control the character
; radius is the size of the character
; point is the goal location

(define-struct pvrp (pos vel rad pt))

(define ex1 (make-pvrp (make-posn 100 125)
                       (make-posn 0 -5)
                       20
                       (make-posn 200 125)))

(check-expect (pvrp-pos ex1) (make-posn 100 125))
(check-expect (pvrp-vel ex1) (make-posn 0 -5))
(check-expect (pvrp-rad ex1) 20)
(check-expect (pvrp-pt ex1) (make-posn 200 125))

;
; 1. draw-handler: model(pvrp) -> image
; purpose: draw the character and the food
;
(define BG-WIDTH 600)
(define BG-HEIGHT 400)
(define BACKGROUND (empty-scene 600 400))
(define FOOD (star 10 "solid" "green"))

(define (draw-handler model)
  BACKGROUND)

(check-expect (draw-handler (make-pvrp (make-posn 100 125) (make-posn 0 -5) 20 (make-posn 200 125)))
              (place-image (circle 20 "solid" "orange")
                           100 125
                           (place-image FOOD 200 125 BACKGROUND)))

;
; 2a. tick-handler-1: model(pvrp) -> model(pvrp)
; purpose: update position of dot according to new velocity
;
(define (tick-handler-1 model)
  model)

(check-expect (tick-handler-1 (make-pvrp (make-posn 100 125) (make-posn 0 -5) 20 (make-posn 200 125)))
              (make-pvrp (make-posn 100 120) (make-posn 0 -5) 20 (make-posn 200 125)))

; 2b. tick-handler-2: model(pvrp) -> model(pvrp)
; purpose: eat food and get larger (radius +2) if food is close enough.
; if food gets eaten there should be a new food in a random position.
; i make the food have position NEED-MORE-FOOD and fix it later.
;
; helper function: close-enough?: posn(center) number(radius) posn(food-center) -> boolean
; purpose: true if food is close enough to eat. food center is inside circle (center, radius)
;

(define (close-enough? center radius food-center)
  false)

(check-expect (close-enough? (make-posn 200 100) 20 (make-posn 300 400)) false)
(check-expect (close-enough? (make-posn 200 100) 26 (make-posn 207 124)) true)

(define NEED-MORE-FOOD (make-posn -100 -100))

(define (tick-handler-2 model)
  model)

(check-expect (tick-handler-2 (make-pvrp (make-posn 200 100) (make-posn 5 3) 26 (make-posn 207 124)))
              (make-pvrp (make-posn 200 100) (make-posn 5 3) 28 NEED-MORE-FOOD))

; 2c. tick-handler-3: model(pvrp) -> model(pvrp)
; purpose: if the food has location NEED-MORE-FOOD, give it a random new location
; otherwise do not change the location

; helper function:
; random-location-if-need-more-food: posn -> posn
; if posn is NEED-MORE-FOOD, then return a random new posn, otherwise leave the old posn
(define (random-location-if-need-more-food p)
  (cond [(posn=? p NEED-MORE-FOOD)
         (make-posn (random BG-WIDTH)
                    (random BG-HEIGHT))]
        [else p]))

(check-expect (random-location-if-need-more-food (make-posn 40 70))
              (make-posn 40 70))
; this tests to make sure the posn changes in the need more food case
(check-random (random-location-if-need-more-food NEED-MORE-FOOD)
              (make-posn (random BG-WIDTH) (random  BG-HEIGHT)))

; tricky so I wrote it... 
(define (tick-handler-3 model)
  (make-pvrp (pvrp-pos model)
             (pvrp-vel model)
             (pvrp-rad model)
             (random-location-if-need-more-food (pvrp-pt model))))

; WRITE TESTS
;(check-random 

; 2d. tick-handler: model(pvrp) -> model(pvrp)
; purpose: put all of the other tick handlers together
; we will talk about this when you are ready

(define (tick-handler model)
  (tick-handler-3
   (tick-handler-2
    (tick-handler-1
     model))))

;
; 3. mouse-handler: model(pvrp) number(x) number(y) string(event) -> model(pvrp)
; purpose: make velocity point in direction of mouse position
; try #1: just subtract posns for mouse and center of player
;         do this first!
;
(define (mouse-handler model x y event)
  model)

; try #1 check expect
; distances from center position to mouse: x:30, y:40
(check-expect (mouse-handler (make-pvrp (make-posn 25 31) (make-posn 5 0) 25 (make-posn 210 75))
                             55 71
                             "move")
              (make-pvrp (make-posn 25 31) (make-posn 30 40) 25 (make-posn 210 75)))

; note: no guarantee the velocity looks good! i did not test it.

#|
; COMPLEX - NEEDS DISCUSSION

; try #2: scale so farther away mouse = greater velocity and bigger player = slower
;         formula? = (distance from current position to mouse position)/radius * (mouse x - posn x, mouse y - posn y)
; you can adjust the formula for velocity once your game works.
;

; try #2 check expect
; distances from center position to mouse: x:30, y:40, distance:50
; radius of circle 25
; so speed should be distance/radius = 50/25 = 2
#;(check-expect (mouse-handler (make-pvrp (make-posn 25 30) (make-posn 5 0) 25 (make-posn 210 75))
                             55 70
                             "move")
              (make-pvrp (make-posn 25 30) (make-posn 60 80) 25 (make-posn 210 75)))
|#


; 4. game-over?: model(pvrp) -> boolean
(define (game-over? model)
  false)

(check-expect (game-over? (make-pvrp (make-posn 25 30) (make-posn 5 0) 25 (make-posn 210 75))) false)
(check-expect (game-over? (make-pvrp (make-posn 25 30) (make-posn 5 0) 40 (make-posn 210 75))) true)

; 5. win-draw-h: model(pvrp) -> image
; purpose: show win screen
(define (win-draw-h model)
  BACKGROUND)

(check-expect (win-draw-h (make-pvrp (make-posn 25 30) (make-posn 5 0) 40 (make-posn 210 75)))
              (overlay (text "You Win" 64 "red")
                       BACKGROUND))

; comment out big bang with #;
(big-bang (make-pvrp (make-posn 300 200) (make-posn 0 0) 10 (make-posn 400 200))
  (on-draw draw-handler)
  (on-tick tick-handler 0.2)
  (on-mouse mouse-handler)
  (check-with pvrp?)
  (stop-when game-over? win-draw-h))
