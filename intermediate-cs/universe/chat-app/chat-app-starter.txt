;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2024-03-19-chat-app-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(require "chat-message.rkt")

;; Basic Features
;; --------------
;; Write a check before writing the function! Beginning with step 2.
;;
;; 0. Read requirements and decide on a model.
;; 1. Set up the model with updater functions like `update-co: player new-co -> player`.
;; 2. Write a draw handler to display a list of messages.
;; 3. Write a key handler so you can type a message (locally)
;; 3a. Backspace deletes letters. (CHECK EXPECT!)
;; 3b. Keys like "shift" and "control" with more than one letter in their names are ignored. (CHECK!)
;; 3c. Enter sends the message. (CHECK!)

(define-struct player (name co history))

;; name - string - "Doc Mo"
;; co - string   - "Typin"
;; history - list of string - (list "Amanda: are you in history?" "Fernando: What are you doing Amanda?")

(define ex1-p
  (make-player "Doc Mo"
               "Typin"
               (list "Amanda: are you in history?"
                     "Fernando: What are you doing Amanda?")))

(define simple-ex1-p
  (make-player "A"
               "B"
               (list "2. DDD" "1. CC")))
(define simple-ex2-p
  (make-player "A"
               "B"
               (list "3. EEEE" "2. DDD" "1. CC")))
(define BG (empty-scene 400 300))
(define ex1-p
  (make-player "Doc Mo"
               "Typin"
               (list "Amanda: are you in history?"
                     "Fernando: What are you doing Amanda?")))
(define step1a
  (above/align "left"
               (text "1. CC" 32 "black")
               (text "2. DDD" 32 "black")))


(define step1b (text "3. EEEE" 32 "black"))

(define step1c (above/align "left" step1a step1b))

(define step2
  (overlay/align "left" "top"
                 step1c
                 BG))


;; draw-messages: list of string -> image
(define (draw-messages lom)
  empty-image)
         

(check-expect (draw-messages empty)
              empty-image)

(check-expect (draw-messages (list "1. CC"))
              (text "1. CC" 32 "black"))

(check-expect (draw-messages  (list "2. DDD" "1. CC"))
              (above/align "left"
                           (text "1. CC" 32 "black")
                           (text "2. DDD" 32 "black")))

;; draw-h : player -> image
(define (draw-h p)
  BG)

(check-expect (draw-h simple-ex1-p)
              (overlay/align "left" "top"
                             (above/align "left"
                                          (text "1. CC" 32 "black")
                                          (text "2. DDD" 32 "black"))
                             BG))



;; key-handler : player key -> player or package(player, chat-message)
(define (key-h model k)
  model)

(define ex3-p (make-player "Doc Mo" "Typin" empty))

;; 1. Basic typing: add the letter you type to the message that you are typing

(check-expect (key-h ex3-p "g")
              (make-player "Doc Mo" "Typing" empty))

;; 2. Backspace deletes a letter.
(check-expect (key-h ex3-p "\b")
              (make-player "Doc Mo" "Typi" empty))

(check-expect (key-h (make-player "Doc Mo" "" empty) "\b")
              (make-player "Doc Mo" "" empty))

;; 3. Enter sends the message.

(check-expect (key-h ex3-p "\r")
              ;; result has two parts
              (make-package ;; (a) new model
                            (make-player "Doc Mo" "" empty)
                            ;; (b) message to send
                            (make-chat-message "Doc Mo" "Typin")))



;; receive-handler: model message -> new model
(define (receive-h model msg)
  model)

(define ex4-p (make-player "Doc Mo" "Typin" (list "A")))
(define ex4-msg (make-chat-message "Marguerite" "B"))
;; put "Marguerite: B" in the chat history

(check-expect (receive-h ex4-p ex4-msg)
              (make-player "Doc Mo" "Typin"
                           (list "Marguerite: B"
                                 "A")))


;; ingredients:
;; string-append - for adding on to a string
;;
;; substring     - for removing from a string
;; string-length - to find the length so you can remove most of it












(define ex2-pa
  (make-player "Player2"
               "A"
               empty))
(define ex2-pab
  (make-player "Player2"
               "AB"
               empty))

;; update-co: player new-co -> player
(define (update-co who new-co)
  who)

#;(check-expect (update-co ex2-pa "AB")
                ex2-pab)




;; Advanced Features
;; -----------------
;; 1. Chat-style layout, where your own messages appear on the right and others on the left.
;; 2. Scrollback using up and down arrows.
;;    Add a number field to the player structure - how many lines to skip before showing any.
;; 3. Muting a sender.
;;    Keep a list of senders to ignore. Add to it my sending a message command like:
;;        /mute docmo
;;    Note: this does not have to be sent to other worlds. Think how you would do this before coding!
