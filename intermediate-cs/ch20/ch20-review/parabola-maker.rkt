(require picturing-programs)

(define (f x)
  (+ 200 (* -1/200 (- x 200) (- x 200))))

(define BLACK (colorize "black"))
(define WHITE (colorize "white"))

(define (graph x y)
  (if (<= (abs (- y (f x))) 4)
      BLACK
      WHITE))

(build-image 400 400 graph)

