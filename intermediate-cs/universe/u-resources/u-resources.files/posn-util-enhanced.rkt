#lang racket
(require 2htdp/image)
(provide (all-defined-out))

(define-struct posn (x y) #:prefab)

(define (add-posn a b)
  (make-posn (+ (posn-x a) (posn-x b))
             (+ (posn-y a) (posn-y b))))
(define (scale-posn k v)
  (make-posn (* k (posn-x v))
             (* k (posn-y v))))
(define (sub-posn a b)
  (add-posn a (scale-posn -1 b)))

(define (norm a)
  (+ (sqr (posn-x a))
     (sqr (posn-y a))))

(define (dist-squared-posn a b)
  (norm (sub-posn a b)))

(define (dist-posn a b)
  (sqrt (dist-squared-posn a b)))

(define (distance p q)
  (sqrt (+ (sqr (- (posn-x p)
                   (posn-x q)))
           (sqr (- (posn-y p)
                   (posn-y q))))))

(define (place-image/posn img p bg)
  (place-image img
               (posn-x p)
               (posn-y p)
               bg))
