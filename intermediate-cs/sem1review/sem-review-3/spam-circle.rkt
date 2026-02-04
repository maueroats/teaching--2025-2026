;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname spam-circle) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

; model:
;
; color = which color to draw
; image = picture drawn so far

(define-struct mm (col img))

(define BG (empty-scene 400 300))
(define v1 (make-mm (make-color 255 0 0)
                    BG))

(define CIRCLE1 (circle 40
                        "solid"
                        (make-color 255 0 0)))

; after clicking mouse at (100,200) you get -->
(define v2 (make-mm (make-color 0 255 0)
                    (place-image CIRCLE1
                                 100 200
                                 (mm-img v1))))

(check-expect (mouse-h v1 100 200 "button-down")
              v2)


; mouse-h: mm(model) num(x) num(y) string(event)
;          -> mm(new-model)

(define (mouse-h model x y event)
  (cond [(string=? event "button-down")
         (make-mm
          (new-color (mm-col model))
          (new-image (mm-img model)
                     (mm-col model)
                     x y))]
        [else
         model]))
; new-color: color -> color
; gives next color in sequence red-green-blue-red-green-etc.

(define (new-color c)
  (cond [(color=? c (make-color 255 0 0))
         (make-color 0 255 0)]
        [(color=? c (make-color 0 255 0))
         (make-color 0 0 255)]
        [(color=? c (make-color 0 0 255))
         (make-color 255 0 0)]
        [else (error "you stink - use R G or B")]))

(check-expect (new-color (make-color 255 0 0))
              (make-color 0 255 0))
(check-expect (new-color (make-color 0 255 0))
              (make-color 0 0 255))
(check-expect (new-color (make-color 0 0 255))
              (make-color 255 0 0))




; new-image: image color x y  -> image
; draw a new circle at (x,y) on top of old image

(define (new-image img c x y)
  (place-image (circle 40 "solid" c)
               x y
               img))

(define (draw-h model)
  (mm-img model))

(big-bang v1
  (on-mouse mouse-h)
  (on-draw draw-h)
  (check-with mm?))


