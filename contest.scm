;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: AQI: 10
;;;
;;; Description:
;;;   No Smoke
;;;   Just Trees
;;;   And Sunlight

(define (draw)
  (penup)
  (speed 10)
  (foreground (list "#E4FFFE" "#C1F0F9" "#92E3E9" "#73C7D0") -400 200)
  (sun 25 "#FFCC33"-240 165)
  (draw_campanelie 220 -40 (list "#695A46" "#7E6C54" "#937D62"))  
  (tree -360 -120 15 70 30 30 10 "#A1C423") ;medtree
  (tree 320 -100 20 90 45 40 15 "#2E4500") ;bigtree
  (tree 13 -50 20 90 45 40 15 "#466900") ;bigtree
  (tree -100 -70 15 70 30 30 10 "#A1C423") ;midtree
  (tree -230 -160 20 90 45 40 15  "#2E4500") ;bigtree
  (tree 200 -180 20 90 45 40 15 "#A1C423") ;bigtree
  (tree -45 -180 15 70 30 30 10 "#2E4500");midtree
  (hideturtle)
  (exitonclick))

(define (foreground list x y)
    (cond ((null? list)  (draw_rekt -400 -40 800 -160 "#B9D980"))
    (else (foreground (cdr list) x (- y 60)) (draw_rekt x y 800 -60 (car list)))
))

(define (sun size colour x y)
    (color colour)
    (goto x y)
    (begin_fill)
    (circle size)
    (end_fill)
)

(define (tree x y x_bark y_bark x_leaf y_leaf cushion colour)
    (draw_rekt x y x_bark y_bark "#7C4325")
    (define new_x (+ x x_bark))
    (define new_y (+ y y_bark))
    (goto new_x new_y)
    (color colour)
    (begin_fill)
    (goto (+ new_x x_leaf) new_y)
    (goto (+ new_x cushion) (+ new_y y_leaf))
    (goto (+ new_x x_leaf) (+ new_y y_leaf))
    (goto (+ new_x cushion) (+ new_y (* 2 y_leaf)))
    (goto (+ new_x x_leaf) (+ new_y (* 2 y_leaf)))
    (goto (+ x (/ x_bark 2)) (+ new_y (* 3 y_leaf)))
    (goto (- (- new_x x_bark) x_leaf) (+ new_y (* 2 y_leaf)))
    (goto (- (- new_x x_bark) cushion) (+ new_y (* 2 y_leaf)))
    (goto (- (- new_x x_bark) x_leaf) (+ new_y y_leaf))
    (goto (- (- new_x x_bark) cushion) (+ new_y y_leaf))
    (goto (- (- new_x x_bark) x_leaf) new_y)
    (end_fill)
)


(define (draw_tri x1 y1 x2 y2 x3 y3 colour)
    (color colour)
    (goto x1 y1)
    (begin_fill)
    (goto x2 y2)
    (goto x3 y3)
    (end_fill)
)

(define (draw_rekt x y x_fact y_fact colour)
    (goto x y)
    (color colour)
    (begin_fill)
    (goto (+ x x_fact) y)
    (goto (+ x x_fact) (+ y y_fact))
    (goto x (+ y y_fact))
    (end_fill)
)

(define (draw_campanelie x y colors)
    (cond ((null? colors) (draw_rekt 210 110 60 10 "#937D62") (draw_rekt 239 88 -7 15 "#000000") (draw_rekt 241 88 7 15 "#000000") (draw_rekt 220 120 40 10 "#695A46") (draw_tri 224 130 256 130 240 180 "#C0C0C0") (draw_tri 250 130 260 130 255 140 "#696969") (draw_tri 220 130 230 130 225 140 "#696969"))
    (else (draw_rekt x y 40 50 (car colors)) (draw_campanelie x (+ y 50) (cdr colors)))
    )
)


; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)