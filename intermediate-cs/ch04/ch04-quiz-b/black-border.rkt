#lang racket
;(require 2htdp/image)
(require picturing-programs)
(define (pretty im)
  (overlay im
           (rectangle (+ 2 (image-width im))
                      (+ 2 (image-height im))
                      "solid"
                      "white")))
(define (black-border im)
  (pretty (overlay im
           (rectangle (image-width im) (image-height im) "outline" "black"))))

(pretty pic:stick-figure)
(black-border pic:stick-figure)

(define y (ellipse 100 50 "outline" "black"))
(define x1 (pretty y))
;(define x2 (text "(check-expect )"))
#;(save-image (pretty y) "ellipse-1.png")
#;(save-image (black-border y) "ellipse-2.png")
