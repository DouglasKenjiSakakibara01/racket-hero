#lang racket/gui
(require 2htdp/image)
(require test-engine/racket-tests)
; Information  
(define WIDTH 40)
(define HEIGHT 40)
(define INIT-LIVES 3)   ; numero de vidas iniciais
(define INIT-SCORE 500) ; pontuação inicial
(define TAMANHO-FONTE-INFO 20)  ; tamanho da fonte das informaçoes (score and lives)
(define INIT-SCORE-X 8)     ; coordenada x da pontuação inicial
(define INIT-LIVES-X 20)    ; coordenada x das vidas iniciais
(define INFO-Y 68)          ; coordenada y das informaçoes
(define VITORIA-FROG (bitmap "d:/Users/Win 7/Documents/UEM/Paradigma Funcional/imagem"))   ; tela de vitoria
(define GAME-OVER  ; tela de derrota     
  (place-image (text "Game Over :(" 40 'red)
               (/ WIDTH 2) (/ HEIGHT 2)
               (empty-scene WIDTH HEIGHT)))

(define WIN        ; tela aparece quando o jogador ganha
  (place-image (text "Win! :)" 40 'green) (/ WIDTH 2) (/ HEIGHT 2)
               (place-image VITORIA-FROG 200 200
                            (empty-scene WIDTH HEIGHT))))

(define DIFICULDADE 5)  ; objetos se movem mais rápido quanto maior o valor
(define-struct info (score lives))
(define info0 (make-info INIT-SCORE INIT-LIVES))

(check-expect (draw-world EMPTY-W)
              (place-image F-IMG-U 370 630
                           (place-image (text "Score: 500" 20 'green) 80 680
                                        (place-image (text "Lives: 3" 20 'green) 200 680 BG))))
(check-expect (draw-world SIMPLE-W)
              (place-image F-IMG-U 370 630
                           (place-image V-IMG-R 80 580
                                        (place-image P-IMG -20 280
                                                     (place-image T-IMG 20 230
                                                                  (place-image (text "Score: 500" 20 'green) 80 680
                                                                               (place-image (text "Lives: 3" 20 'green) 200 680    
                                                                                            BG)))))))
(define (draw-world aw)
  (draw-player (world-player aw)
               (draw-vehicles (world-vehicles aw)
                              (draw-planks (world-planks aw)
                                           (draw-turtles (world-turtles aw)
                                                         (draw-score (info-score (world-info aw))
                                                                     (draw-lives (info-lives (world-info aw))
                                                                                 BG)))))))

(check-expect (draw-info info0 BG)
              (place-image (text "Score: 500" 20 'green) 80 680
                           (place-image (text "Lives: 3" 20 'green) 200 680
                                        BG)))
(define (draw-info i img)
  (draw-score (info-score i)
              (draw-lives (info-lives i) img)))                   

;; draw-score: Number Image -> Image
;; produce the game score as an image
(check-expect (draw-score 1000 BG)
              (place-image (text "Score: 1000" 20 'green) 80 680 BG))
(define (draw-score score img)
  (draw SCORE-INIT-X INFO-Y
        (text (string-append "Score: " (number->string score))
              INFO-FONT-SIZE 'green)
        img))

(make-info (change-score (info-score (world-info aw))))

;; change-score: Score -> Score
;; deduct one from score on each tick
(check-expect (change-score INIT-SCORE) 499)
(define (change-score score)
  (- score 1))
