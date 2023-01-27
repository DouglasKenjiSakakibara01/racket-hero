#lang racket/gui
(require gui-widget-mixins)


(define toplevel (new frame% [label "Menu"] [width 200] [height 200]
                      [border 10] [spacing 30]))



(define choices
  (new (tooltip-mixin choice%)
       [parent toplevel]
       [label "Select the music: "]
       [choices '("First Option" "Second Option" "Third Option")]
       [tooltip "The second option is the best one"]))


(define checkbox
  (new (tooltip-mixin check-box%)
       [parent toplevel]
       [label "Easy"]
       
       ))
(define checkbox2
  (new (tooltip-mixin check-box%)
       [parent toplevel]
       [label "Medium"]
       
       ))
(define checkbox3
  (new (tooltip-mixin check-box%)
       [parent toplevel]
       [label "Hard"]
       
       ))



(define button
  (new (tooltip-mixin button%)
       [parent toplevel]
       [label "Play"]))

(send toplevel show #t)