;; Origard v3.5 LEMUR Invariant Proof Certificate
;; Target: counter_lemur
;; Proposed Invariant: y >= 0
;; Gates Checked: Non-Vacuity (Init => q), Inductiveness (q ∧ T => q'), Sufficiency (q => Safe)
;; All Solver Queries: UNSAT

;; --- Gate 3a: Init => q ---
; benchmark generated from python API
(set-info :status unknown)
(declare-fun y () Int)
(declare-fun x () Int)
(assert
 (let (($x11 (= y 0)))
(let (($x10 (= x 0)))
(let (($x12 (and $x10 $x11)))
(and $x12 (not (<= 0 y)))))))
(check-sat)


;; --- Gate 3b: Inductive Step (q ∧ T => q') ---
; benchmark generated from python API
(set-info :status unknown)
(declare-fun y_p () Int)
(declare-fun y () Int)
(declare-fun x () Int)
(declare-fun x_p () Int)
(assert
 (let (($x21 (and (< x 10) (= x_p (+ x 1)) (= y_p (+ y 2)))))
(let (($x23 (<= 0 y)))
(and $x23 $x21 (not (<= 0 y_p))))))
(check-sat)


;; --- Gate 3c: Safety Goal (q => Safe) ---
; benchmark generated from python API
(set-info :status unknown)
(declare-fun y () Int)
(assert
 (let (($x22 (>= y 0)))
(let (($x44 (not $x22)))
(let (($x23 (<= 0 y)))
(and $x23 $x44)))))
(check-sat)
