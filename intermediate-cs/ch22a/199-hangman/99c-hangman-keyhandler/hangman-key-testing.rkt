;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2018-03-16-hangman-keyhandler) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

(define-struct m (secret-word
                  letters-right
                  letters-wrong
                  right-count
                  wrong-count))

;
; EX1: secret = "whitney", right="wt" wrong="qar"
(define ex1
  (make-m "whitney" "wt" "qar" 2 3))

; EX2: secret = "whitney", right="wty" wrong="qar"
(define ex2
  (make-m "whitney" "wty" "qar" 3 3))

; EX3: secret = "whitney", right="wty" wrong="qarx"
(define ex3
  (make-m "whitney" "wty" "qarx" 3 4))

(define (key-h model key)
  model)

(check-expect (key-h ex1 "y")
              ex2)
(check-expect (key-h ex2 "x")
              ex3)
