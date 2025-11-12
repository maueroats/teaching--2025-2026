#lang typed/racket
(require typed/lang/posn)
(require typed/2htdp/image)
(require typed/2htdp/universe)
(require typed/test-engine/racket-tests)
(require "posn-util-typed.rkt")

(define-struct boat ([id : Integer]
                     [name : String]
                     [pos : Posn]
                     [vel : Posn]
                     [color : Color]
                     [radius : Positive-Integer])
  #:transparent
  #:type-name Boat)

(define (update-boat-vel [b : Boat] [new-v : Posn]) : Boat
  (struct-copy boat b [vel new-v]))

(define EPSILON #i0.001)
(define CLICK-SPEED 5.0)
(define WIDTH 500)
(define HEIGHT 300)
(define BACKGROUND : Image (empty-scene WIDTH HEIGHT))

(define ex1-boat (make-boat 5 "Tugboat"
                            (make-posn 200 100)
                            (make-posn 0 -10)
                            (make-color 200 100 175)
                            25))


(check-expect (boat-radius ex1-boat) 25)

; byte-clamp: Integer -> Byte
; turn an integer into a Byte [0,255]
; colors and font size are required to be in the range [0,255]
; this makes that always happen
(define (byte-clamp [n : Integer]) : Byte
  (min 255 (max 0 n)))

(check-expect (byte-clamp -5) 0)
(check-expect (byte-clamp 256) 255)

(define (random-byte [n : Byte]) : Byte
  (byte-clamp (random n)))

; racket needs to be told that 1 adding 1 to a byte gives a positive byte
(define (add1-byte [n : Byte]) : Positive-Byte
  (cast (byte-clamp (add1 n))
        Positive-Byte))

(check-expect (add1-byte 0) 1)
(check-expect (add1-byte 255) 255)

; boat->font-size : Boat -> [0,255]
; make the name of the boat fit inside the circle (hopefully), but also
; get larger as the circle gets larger
(define (boat->font-size [model : Boat]) : Positive-Byte
   (add1-byte
    (byte-clamp
     (quotient (* 3 (boat-radius model))
               (string-length (boat-name model))))))

(define (draw-1 [model : Boat]) : Image
  (overlay (text (string-append (boat-name model)
                                " "
                                (number->string (boat-radius model)))
                 (boat->font-size model)
                 "black")
           (circle (boat-radius model)
                   "solid"
                   (boat-color model))))

(define VELOCITY-VECTOR-LENGTH 20)

(define (draw-unit-vector [vec : Posn] [c : Color]) : Image
  (define VVL VELOCITY-VECTOR-LENGTH)
  (define u (scale-posn (/ VVL (distance vec (make-posn 0 0)))))
  (define ux (posn-x u))
  (define uy (posn-y u))
  (add-line (circle VVL "solid" (make-color 0 0 0 0))
            VVL VVL
            (+ VVL ux) (+ VVL uy)
            c))

(define (draw-1-fancy [model : Boat]) : Image
  (overlay (draw-unit-vector (boat-vel model) (make-color 255 0 0))
           (draw-1 model)))
;
; step-[abcd] is to set the circle speed to be 10 in the direction of the mouse click
;

(define (step-a [v : Posn] [w : Posn])
  : Posn
  (sub-posn v w))

(define (step-b [v : Posn] [w : Posn])
  : Real
  (distance v w))

(define (step-c [v : Posn] [w : Posn])
  : Posn
  (scale-posn (/ 1 (step-b v w))
              (step-a v w)))

(define (step-d [v : Posn] [w : Posn])
  : Posn
  (scale-posn 10 (step-c v w)))

(define v1 (make-posn 0 0))
(define w1 (make-posn 5 12))

(check-expect (step-a w1 v1)
              w1)

(check-expect (step-b w1 v1)
              13)

(check-expect (step-c w1 v1)
              (make-posn 5/13 12/13))

(check-expect (step-d w1 v1)
              (make-posn 50/13 120/13))

;
; end of step-[abcd]
;

(define (draw-h [model : Boat]) : Image
  (place-image/posn (draw-1-fancy model)
                    (boat-pos model)
                    BACKGROUND))


;
; new-vel-from-click: Posn Posn -> Posn
; purpose: produce a new velocity given the current posn and the posn where the mouse click occurred
; should be length 10 and in direction (click-current)
;
(define (new-vel-from-click [current : Posn]
                            [click : Posn])
  : Posn
  (scale-posn (/ CLICK-SPEED (distance current click))
              (sub-posn click current)))

(define ex1-current (make-posn 6 10))
(define ex1-click (make-posn 506 1210))

(define (check-nearly-zero [p : Posn]): Boolean
  (and (<= (abs (posn-x p))
           EPSILON)
       (<= (abs (posn-y p))
           EPSILON)))

(define (posns-close? [p : Posn] [q : Posn]) : Boolean
  (check-nearly-zero (sub-posn p q)))

(check-expect (posns-close? (new-vel-from-click ex1-current ex1-click)
                            (make-posn 25/13 60/13))
              true)

(define (radius-change [key : String]) : Integer
  (match key
    ["w" 5]
    ["s" -5]
    [_ 0]))

(check-expect (radius-change "w") 5)
(check-expect (radius-change "s") -5)

(define (clamp-positive [n : Integer]) : Positive-Integer
  (max 1 n))

(check-expect (clamp-positive 0) 1)
(check-expect (clamp-positive 20) 20)

(define (maybe-new-color [m : Boat] [key : String]): Color
  (match key
    ["c" (make-color (random-byte 255) (random-byte 255) (random-byte 255))]
    [_ (boat-color m)]))

(define (maybe-change-speed [m : Boat] [key : String]) : Posn
  (match key
    ["j" (scale-posn 0.9 (boat-vel m))]
    ["k" (scale-posn 1.1 (boat-vel m))]
    [_ (boat-vel m)]))

(define (key-h [model : Boat] [key : String]) : Boat
  (struct-copy boat model
               [vel (maybe-change-speed model key)]
               [color (maybe-new-color model key)]
               [radius (clamp-positive
                        (+ (boat-radius model)
                           (radius-change key)))]))

(check-expect (key-h (make-boat 2 "tugboat" (make-posn 4 13 ) (make-posn 10 4) (make-color 200 190 180) 30)
                     "w")
              (make-boat 2 "tugboat" (make-posn 4 13 ) (make-posn 10 4) (make-color 200 190 180) 35))

(define (mouse-h [model : Boat] [x : Integer] [y : Integer] [event : Mouse-Event])
  : Boat
  (if (not (string=? "button-down" event))
      model
      (struct-copy boat model [vel (new-vel-from-click (boat-pos model)
                                                       (make-posn x y))])))

(check-expect (posns-close? (boat-vel (mouse-h (make-boat 2 "tugboat" (make-posn 4 13 ) (make-posn 10 4) (make-color 200 190 180) 30)
                                               16 8 "button-down"))
                            (boat-vel (make-boat 2 "tugboat" (make-posn 4 13) (make-posn 60/13 -25/13) (make-color 200 190 180) 30)))
              true)
                       
(: should-bounce*? (Real Real Real Real . -> . Boolean))
(define (should-bounce*? px py vx vy)
  (or (and (<= px 0)
           (< vx 0))
      (and (<= py 0)
           (< vy 0))
      (and (<= WIDTH px)
           (< 0 vx))
      (and (<= HEIGHT py)
           (< 0 vy))))

(define (should-bounce? [ pos : Posn ]
                        [ vel : Posn ])
  : Boolean
  (should-bounce*? (posn-x pos) (posn-y pos)
                   (posn-x vel) (posn-y vel)))

(: bounce-vel* (Real Real Real Real . -> . Posn))
(define (bounce-vel* px py vx vy)
  (cond [(or (<= px 0)
             (<= WIDTH px))
         (make-posn (- vx) vy)]
        [else
         (make-posn vx (- vy))]))

(check-expect (should-bounce*? 0 10 -4 3)
              true)
(check-expect (should-bounce*? 0 10 4 3)
              false)
(check-expect (should-bounce*? 40 0 3 8)
              false)
(check-expect (should-bounce*? 40 0 3 -8)
              true)

(check-expect (bounce-vel* 0 10 -4 3)
              (make-posn 4 3))
(check-expect (bounce-vel* 40 0 3 -8)
              (make-posn 3 8))

(: bounce-vel (Posn Posn . -> . Posn))
(define (bounce-vel pos vel)
  (if (should-bounce? pos vel)
      (bounce-vel* (posn-x pos) (posn-y pos)
                   (posn-x vel) (posn-y vel))
      vel))

(define (tick-bounce [model : Boat]) : Boat
  (struct-copy boat model [vel (bounce-vel (boat-pos model)
                                           (boat-vel model))]))

(define (tick-move [model : Boat]) : Boat
  (struct-copy boat model [pos (add-posn (boat-pos model)
                                         (boat-vel model))]))

(define (tick-h [model : Boat]) : Boat
  (tick-bounce (tick-move model)))

#;(big-bang ex1-boat : Boat
  (to-draw draw-h)
  (on-mouse mouse-h)
  (on-key key-h)
  (on-tick tick-h))

(provide tick-h tick-move tick-bounce bounce-vel should-bounce? mouse-h key-h
         draw-1 draw-1-fancy draw-h
         WIDTH HEIGHT BACKGROUND
         (struct-out boat)
         Boat
         update-boat-vel)


                   
(test)

