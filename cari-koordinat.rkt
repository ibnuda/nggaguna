#lang racket

(define (hipotenusa-inggang x)
  (sqrt (+ (* x x) (* 9.525 9.525))))

(define (derajat-tambahan inggang)
  (atan (/ inggang 9.525)))

(define (koordinat kiri? x-sekarang y-sekarang inggang)
  (let* ([delta (derajat-tambahan inggang)]
         [derajat-sisi (if kiri? -76 -104)]
         [derajat-radian (degrees->radians derajat-sisi)]
         [derajat (+ derajat-radian (if kiri? (- delta) delta))]
         [hipotenusa (hipotenusa-inggang inggang)]
         [x (* hipotenusa (cos derajat))]
         [y (* hipotenusa (sin derajat))]
         [x-baru (- x-sekarang x)]
         [y-baru (- y-sekarang y)])
    (list x-baru y-baru)))

(koordinat false 211.103599 34.608609 -9.525)
