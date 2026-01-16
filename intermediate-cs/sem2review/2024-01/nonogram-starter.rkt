;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2024-05-29-nonogram-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require picturing-programs)

;; A. NAME:

;; B. Save definitions... and rename to LastnameFirst-Final.rkt 

;; Your submitted code must RUN (no errors) and including all check-expects.

;; STARTER CODE
(define-struct nono (n c))

(define w "white")
(define b "black")
(define row-1-hints (list (make-nono 4 b)))
(define row-2-hints (list (make-nono 1 b) (make-nono 3 b)))

(define 0b (make-nono 0 b))
(define 1b (make-nono 1 b))
(define 2b (make-nono 2 b))
(define 3b (make-nono 3 b))
(define 0w (make-nono 0 w))
(define 1w (make-nono 1 w))
(define 2w (make-nono 2 w))
(define 3w (make-nono 3 w))


#|
;;;; 1. 
;; useless? : nono -> boolean
(define (useless? x) false)
(check-expect (useless? (make-nono 4 b)) false)
(check-expect (useless? (make-nono 0 b)) true)
(check-expect (useless? (make-nono 0 w)) true)
(check-expect (useless? (make-nono 3 b)) false)
(check-expect (useless? (make-nono 2 w)) false)

|#


;;;; 2.
#|
2. (`use-one`) As another warmup, we are writing a function to reduce the
   count in a `nono` by one. If there are 0 (or fewer) squares
   represented by the `nono`, then there is no change.
|#
#|
;; use-one: nono -> nono
(define (use-one x) x)
(check-expect (use-one (make-nono 4 b)) (make-nono 3 b))
(check-expect (use-one 3w) 2w)
(check-expect (use-one 2b) 1b)
(check-expect (use-one 1b) 0b)
(check-expect (use-one 0b) 0b)
|#

#|
3. (`draw-complete-row`) As a first step, we will make a function to draw a
   "complete row of hints". This means that the hints will tell you
   how many black squares and how many white squares you need to draw.
   INCLUDE TWO CHECK-EXPECTS.
|#

;; draw-complete-row: (Listof Nono) -> Image
(define (draw-complete-row hintlist)
  empty-image)
(define row-2-complete-h (list 1b 1w 3b))
;; (draw-complete-row row-2-complete-h)


#|
4. (`condense`) When you write out a "complete row", there might be
   more than one way to say the same thing. The list (3 black) would
   result in the same drawing as the list (1 black, 1 black, 1
   black). The `condense` function takes in a list and combines adjacent
   `nono` of the same color.
|#

;; condense : (Listof Nono) -> (Listof Nono)
(define (condense xs)
  xs)

#|
(check-expect (condense (list 1b 1b 1b))
              (list 3b))
(check-expect (condense (list 1b 1b 1w 1b 1b))
              (list 2b 1w 2b))
(check-expect (condense (list 2b 1b))
              (list 3b))
|#


#|
5. (`matches-hint?`) When a person is solving a nonogram, sometimes
   they will make mistakes. The `matches-hint?` function is supposed
   to tell if a given list of `nono` fits the requirements of a hint.

   For example, if the hint is that there are 2 black and then 1
   black, the list (2 black, 2 white, 1 black) would match that
   hint. According to the rules of nonograms, the list (2 black, 1
   black) would **not** match that hint, because there has to be at
   least one white square between black ones.
|#


(define (matches-hint? hints actuals)
  false)

#|
(define r2h (list 1b 3b))
(define r2ex0 (list))
(define r2ex1 (list 1b 1w 3b))
(define r2ex2 (list 1b 1w 3b 1w))
(define r2ex3 (list 1b 2w 3b))
(define r2ex4 (list 1b 1w 1b 1b 1b))
(define r2ex5 (list 1b 2w 2b))
(check-expect (matches-hint? r2h r2ex0) false)
(check-expect (matches-hint? r2h r2ex1) true)
(check-expect (matches-hint? r2h r2ex2) true)
(check-expect (matches-hint? r2h r2ex3) true)
(check-expect (matches-hint? r2h r2ex4) true)
(check-expect (matches-hint? r2h r2ex5) false)
|#


#|
VERIFY THIS IS ASSIGNED:

6. (Color-setting.) (**See notes in source.**)
   When a person plays a nonogram puzzle on the
   computer, they type a key to select the color (typically 0=white,
   1=black), and then click to set the square to that color.

    Suppose your model originally contains a list of the posns that
    are black.

        (define-struct game (pos))

    1. What additions to the `game` struct would allow you to add in
       the color-setting mechanic described above?
    2. Write the name and purpose of each handler that you would have
       to create in order to implement the color-setting mechanic.


|#




