---
draft: true
---
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname screen-distance) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(require wy-posn-util)
;; td : Number - total distance
;; lp : Posn - last posn clicked
;; mp : Posn - current mouse posn 
(define-struct g (td lp mp))

(define NO-CLICK (make-posn -1 -1))

(define TARGET (circle 5 "solid" "dark green"))
(define DEMO-BG
  (place-images (list TARGET TARGET TARGET
                      (text "Perimeter is about 300"
                            24 "black"))
                (list (make-posn 40 80)
                      (make-posn 160 130)
                      (make-posn 160 80)
                      (make-posn 150 180))
                (empty-scene 300 200)))
(define BACKGROUND DEMO-BG)

(define (add-line/posn img p q pen-or-color)
  (add-line img
            (posn-x p) (posn-y p)
            (posn-x q) (posn-y q)
            pen-or-color))

(define (gap delta img)
  (overlay img
           (rectangle (+ delta (image-width img))
                      (+ delta (image-height img))
                      "solid"
                      "transparent")))

(define in-g (make-g 47 (make-posn 30 90) (make-posn 150 140)))

(define (maybe-add-line img p q c)
  (if (posn=? NO-CLICK p)
      img
      (add-line/posn img p q c)))

(define (draw-h in-g)
  (overlay/align "left" "top"
                 (gap 4
                      (text (number->string (g-td in-g))
                            24
                            "black"))
                 (maybe-add-line BACKGROUND
                                 (g-lp in-g)
                                 (g-mp in-g)
                                 "crimson")))


(draw-h in-g)

(define (mouse-h model x y event)
  (cond [(and (mouse=? event "button-down")
              (posn=? NO-CLICK (g-lp model)))
         (make-g (g-td model)
            (make-posn x y)
            (make-posn x y))]
        [(mouse=? event "button-down")
         (make-g (+ (g-td model)
                    (posn-distance (g-lp model)
                                   (make-posn x y)))
                 NO-CLICK
                 NO-CLICK)]
        [(and (mouse=? event "move")
              (not (posn=? NO-CLICK (g-lp model))))
         (make-g (g-td model)
                 (g-lp model)
                 (make-posn x y))]
        [else model]))

(define (run x)
  (big-bang (make-g x NO-CLICK NO-CLICK)
    (to-draw draw-h)
    (on-mouse mouse-h)))

(run 0)



