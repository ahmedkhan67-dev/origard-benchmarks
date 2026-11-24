;; Origard v3.5 Spacer CHC Proof Certificate
;; Target: counter_loop
;; Solver: Z3 Fixedpoint (Spacer)
;; Status: UNSAT (Proved Inductive Invariant)

(declare-rel Inv (Int Int))
(declare-rel Error ())
(declare-var A Int)
(declare-var B Int)
(declare-var C Int)
(declare-var D Int)
(rule (! (=> (and (= B 0) (= A 0)) (Inv B A)) :named rule_init))
(rule (! (=> (and (Inv D C) (< D 10) (= A (+ C 2)) (= B (+ D 1))) (Inv B A)) :named rule_trans))
(rule (! (=> (and (Inv B A) (not (>= A 0))) Error) :named rule_error))
(query Error)
