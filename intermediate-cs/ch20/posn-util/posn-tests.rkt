(require picturing-programs)
(require "posn-util.rkt")

(define ex1 (make-posn 5 12))
(define ex2 (make-posn 8 15))
(define ex3 (make-posn 7 24))
(define pzero (make-posn 0 0))

(check-expect (posn-add ex1 ex2)
              (make-posn 13 27))

(check-expect (posn-sub ex2 ex1)
              (make-posn 3 3))
(check-expect (posn-sub ex2 ex3)
              (make-posn 1 -9))

(check-expect (posn-scale 2 ex1)
              (make-posn 10 24))
(check-expect (posn-scale 3 ex2)
              (make-posn 24 45))

(check-within (posn-distance pzero ex1)
              13
              0.01)

(check-within (posn-distance ex2 ex3)
              9.055
              0.001)

(define c1 (circle 5 "solid" "blue"))
(define r1 (rectangle 300 200 "solid" "yellow"))
(define spot (make-posn 50 75))

(define answer1 (place-image c1 50 75 r1))
(check-expect (place-image/posn c1 spot r1)
              answer1)



(check-expect (posn-add (make-posn 5 12)
                        (make-posn 8 15))
              (make-posn 13 27))

(check-expect (place-image/posn (circle 5 "solid" "red")
                                (make-posn 150 200)
                                (empty-scene 300 400))
              (overlay (circle 5 "solid" "red")
                       (empty-scene 300 400)))

(check-expect (posn-scale 2 (make-posn 5 12))
              (make-posn 10 24))


;(check-expect (posn-length-squared (make-posn 5 12)) 169)

;(check-within (posn-length (make-posn 5 12)) 13 0.001)

;; testing alias
#;(check-expect (posn-subtract (make-posn 20 21)
                             (make-posn 5 12))
              (make-posn 15 9))


(check-expect (posn=? (make-posn 3 4) (make-posn 3 4)) true)
(check-expect (posn=? (make-posn 3 4) (make-posn 4 3)) false)

(check-within (posn-distance (make-posn 3 9)
                             (make-posn 23 30))
              29
              0.001)

