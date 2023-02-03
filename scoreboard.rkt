#lang racket/gui
(require 2htdp/image)
(require test-engine/racket-tests)
; Information  
(define WIDTH 40)
(define HEIGHT 40)
(define INFO-FONT-SIZE 20)  ; font size of game information (score)
(define INIT-SCORE 0) ; pontuação inicial
(define TAMANHO-FONTE-INFO 20)  ; tamanho da fonte das informaçoes (score)
(define SCORE-INIT-X 8)     ; coordenada x da pontuação inicial
(define INFO-Y 68)          ; coordenada y das informaçoes

; Background
(define GRID-WIDTH 10)
(define MAX-X 74)   ; max x coordinate of the background
(define MAX-Y 70)   ; max y coordinate of the background
(define (draw x y img1 img2)
  (place-image img1 (* GRID-WIDTH x) (* GRID-WIDTH y) img2))
                   

;; draw-score: Number Image -> Image
;; produce the game score as an image

(define (draw-score score img)
  (draw SCORE-INIT-X INFO-Y
        (text (string-append "Score: " (number->string score))
              INFO-FONT-SIZE 'green)
        img))

;;(make-info (change-score (info-score (world-info aw))))

;; change-score: Score -> Score
;;Use the difficult to decide how fast the score change
(define (change-score score)
  (+ score 1))
