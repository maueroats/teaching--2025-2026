#lang typed/racket
(require typed/lang/posn)
(require typed/2htdp/image)

; functions provided:
;
; add-posn sub-posn scale-posn posn=?
; distance dist-posn dist-squared-posn
; place-image/posn place-images/posn
;
; norm = distance from origin

(provide (all-defined-out))

(: add-posn (-> Posn Posn Posn))
(define (add-posn a b)
  (make-posn (+ (posn-x a) (posn-x b))
             (+ (posn-y a) (posn-y b))))

(: scale-posn (-> Real Posn Posn))
(define (scale-posn k v)
  (make-posn (* k (posn-x v))
             (* k (posn-y v))))

(: sub-posn (-> Posn Posn Posn))
(define (sub-posn a b)
  (add-posn a (scale-posn -1 b)))

(: norm-squared (-> Posn Nonnegative-Real))
(define (norm-squared a)
  (+ (sqr (posn-x a))
     (sqr (posn-y a))))

(: norm (-> Posn Nonnegative-Real))
(define (norm a)
  (sqrt (+ (sqr (posn-x a))
           (sqr (posn-y a)))))

(: dist-squared-posn (-> Posn Posn Nonnegative-Real))
(define (dist-squared-posn a b)
  (norm-squared (sub-posn a b)))

(: dist-posn (-> Posn Posn Nonnegative-Real))
(define (dist-posn a b)
  (sqrt (dist-squared-posn a b)))

(: distance (-> Posn Posn Nonnegative-Real))
(define (distance p q)
  (sqrt (+ (sqr (- (posn-x p)
                   (posn-x q)))
           (sqr (- (posn-y p)
                   (posn-y q))))))

(: place-image/posn (-> Image Posn Image Image))
(define (place-image/posn img p bg)
  (place-image img
               (posn-x p)
               (posn-y p)
               bg))

(: unit-vector (-> Posn Posn))
(define (unit-vector p)
  (scale-posn (/ 1 (norm p)) p))

(: place-images/posn (-> (Listof Image) (Listof Posn) Image Image))
(define (place-images/posn list-of-img list-of-p bg)
  (if (empty? list-of-img)
      bg
      (place-image/posn (first list-of-img)
                        (first list-of-p)
                        (place-images/posn (rest list-of-img)
                                           (rest list-of-p)
                                           bg))))

(: add-posns (-> Posn Posn Posn))
(define (add-posns p1 p2)
  (add-posn p1 p2))

(: sub-posns (-> Posn Posn Posn))
(define (sub-posns p1 p2)
  (sub-posn p1 p2))

(: posn=? (-> Posn Posn Boolean))
(define (posn=? p q)
  (and (= (posn-x p) (posn-x q))
       (= (posn-y p) (posn-y q))))

(: posn-dot (-> Posn Posn Real))
(define (posn-dot p1 p2)
  (+ (* (posn-x p1) (posn-x p2))
     (* (posn-y p1) (posn-y p2))))

; the component of v1 in the direction of v2
; divides length of v2 so OK to use non-unit vector
; result = vector parallel to v2
(: projection-scalar (-> Posn Posn Real))
(define (projection-scalar v1 v2)
  (/ (posn-dot v1 v2)
     (norm v2)))

(: projection-vector (-> Posn Posn Posn))
(define (projection-vector v1 v2)
  (scale-posn (/ (posn-dot v1 v2)
                 (posn-dot v2 v2))
              v2))
  
#;(check-expect (posn-push-along (make-posn 5 12)
                               (make-posn 30 0))
              (make-posn 5 0))



          