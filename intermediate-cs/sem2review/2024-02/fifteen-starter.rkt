
(require picturing-programs)
; (require wy-posn-util)
; (require "posn-util.rkt")

;; A. NAME:

;; B. Save definitions... and rename to LastnameFirst-Final.rkt 

;; Your submitted code must RUN (no errors) and including all check-expects.


;; Struct Ft
;; p - posn - the location of the tile. upper left is (1,1)
;; n - number - the number on the tile. 0 means blank

(define-struct ft (p n))

;; Struct Move
;; a, b - posn
;; represents a move swapping positions a and b
(define-struct move (a b))

;; Struct G
;; ft-list - (Listof Ft) - the tiles on the board
;; last - Posn - last click location or (-1,-1)
;; hist - (Listof Move) - all of the moves made
(define-struct g (ft-list last hist))

(define INVALID (make-posn -1 -1))

(define SIZE 50) ;; side length of one square

;; size of the board
(define WIDTH 4)
(define HEIGHT 4)

;; Given conversion functions

(define (computer->grid p)
  (make-posn (add1 (quotient (posn-x p) SIZE))
             (add1 (quotient (posn-y p) SIZE))))
(define (grid->computer p)
  (make-posn (* SIZE (+ -1/2 (posn-x p)))
             (* SIZE (+ -1/2 (posn-y p)))))

;; Variables for check-expects

(define STARTER-1-FT-LIST
   (list (make-ft (make-posn 3 2) 8) (make-ft (make-posn 1 3) 7)
         (make-ft (make-posn 2 3) 6) (make-ft (make-posn 2 2) 5)
         (make-ft (make-posn 1 2) 4) (make-ft (make-posn 3 3) 3)
         (make-ft (make-posn 2 1) 2) (make-ft (make-posn 1 1) 1)
         (make-ft (make-posn 3 1) 0)))

(define STARTER-1
  (make-g STARTER-1-FT-LIST
          INVALID
          empty))

(define STARTER-2-FT-LIST
  (list (make-ft (make-posn 3 3) 8) (make-ft (make-posn 1 3) 7)
        (make-ft (make-posn 3 1) 6) (make-ft (make-posn 2 3) 5) 
        (make-ft (make-posn 1 1) 4) (make-ft (make-posn 2 1) 3)
        (make-ft (make-posn 1 2) 2) (make-ft (make-posn 3 2) 0)
        (make-ft (make-posn 2 2) 1)))

(define STARTER-2
  (make-g STARTER-2-FT-LIST
          INVALID
          empty))

;; ## Questions

#|
1. (`ft-n-str`) The string you should print out for the number on the
   square. When the number is 0, return the empty string.
|#
;; ft-n-str : Ft -> String
(define (ft-n-str w) "wrong")
#|
(check-expect (ft-n-str (make-ft (make-posn 3 4) 5)) "5")
(check-expect (ft-n-str (make-ft (make-posn 2 3) 0)) "")
|#

#|
2. (`correct-location`) The `correct-location` function takes in a
   number and puts out the `posn` that the number should be in when
   the puzzle is solved.

   For credit on this problem you must use some kind of math or
   recursion. For full credit your method must be easily adaptable to a
   different sized board.
|#
;; correct-location : Number -> Posn
(define (correct-location n)
  INVALID)

#|
(check-expect (correct-location 1) (make-posn 1 1))
(check-expect (correct-location 2) (make-posn 2 1))
(check-expect (correct-location 4) (make-posn 4 1))
(check-expect (correct-location 5) (make-posn 1 2))
(check-expect (correct-location 15) (make-posn 3 4))
(check-expect (correct-location 0) (make-posn 4 4))
|#

#|
3. (`ft-color`) The background of a square should be white if the
   number n is 0, orange if the tile is in the correct position (based on its
   number), and blue otherwise.
|#
;; ft-color : Ft -> String (Color)
(define (ft-color w)
  "gray")

#|
(check-expect (ft-color (make-ft (make-posn 2 3) 0)) "white")
(check-expect (ft-color (make-ft (make-posn 4 1) 4)) "orange")
(check-expect (ft-color (make-ft (make-posn 3 1) 2)) "light blue")
|#

#|
4. (`ft-draw-one`) Draw a single tile on the given background. Use the
   color and string from above.
|#

;; ft-draw-one : Ft Image -> Image
(define (ft-draw-one w bg)
  bg)

#|
(define fig4a
  (draw-one (make-ft (make-posn 4 1) 4)
            (rectangle 200 200 "solid" "pink")))
fig4a

(define fig4b
  (draw-one (make-ft (make-posn 2 3) 5)
            (empty-scene 200 200)))
fig4b
|#


#|
5. (`ft-draw-all`) Draw a list of tiles on the given background.
|#
;; ft-draw-all : (Listof Ft) Image -> Image
(define (ft-draw-all ws bg)
  bg)

#|
(draw-all (list (make-ft (make-posn 4 1) 4)
                (make-ft (make-posn 2 3) 5))
          (rectangle 200 200 "solid" "light green"))
|#

#|
6. (`make-correct`) Make a list with `ft` structures representing the
   numbers from 0 through n in their correct final locations.

   **Write one more check-expect** as well as the code.
|#
;; make-correct : Number -> (Listof Ft)
(define (make-correct n)
  empty)

#|
;; for a 4x4 board
(check-expect (make-correct 0) (list (make-ft (make-posn 4 4) 0)))
(check-expect (make-correct 1) (list (make-ft (make-posn 1 1) 1) (make-ft (make-posn 4 4) 0)))
|#

#|
7. (`get-num`) Given a list of Ft and a Posn, return the number at
   that posn. Give -1 if that posn is not in the list.
|#
;; get-num : (Listof Ft) Posn -> Number
(define (get-num ft-list p)
  -1)

#|
8. (`legal-swap?`) Given two posns and a list of Ft representing the
   tiles on the board, return true if it is legal to swap the tiles at
   those positions.

   A swap is legal when:
   1. both posns are actually *on* the board;
   2. the posns are next to each other on the board; and
   3. one of the numbers is zero.
|#

(define (legal-swap? ft-list p q)
  false)

;; WRITE YOUR OWN CHECK-EXPECTS HERE

#|
9. (`do-swap`) Given the same information as in the previous problem,
   actually perform the swap that changes the positions of the two
   tiles. This function is not concerned whether or not the swap is
   actually legal.
   The order of terms in the result does not matter.
|#

;; do-swap : (Listof Ft) Posn Posn -> (Listof Ft)
(define (do-swap ft-list p q)
  (apply-move ft-list (make-move p q)))

#|
(define SWAPCHECK-1 (do-swap (g-ft-list STARTER-1) (make-posn 3 1) (make-posn 3 2)))
(check-expect (get-num SWAPCHECK-1 (make-posn 3 1)) 8)
(check-expect (get-num SWAPCHECK-1 (make-posn 3 2)) 0)

(define SWAPCHECK-2 (do-swap (g-ft-list STARTER-2) (make-posn 3 2) (make-posn 2 2)))
(check-expect (get-num SWAPCHECK-2 (make-posn 3 2)) 1)
(check-expect (get-num SWAPCHECK-2 (make-posn 2 2)) 0)
|#


#|
10. Now you should be in a position where you can write the mouse
    handler and create an animation so that you can play the game.
|#
