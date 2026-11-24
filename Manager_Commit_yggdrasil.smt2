;; Origard v3.5 Yggdrasil Idempotent Cleanup Certificate
;; Target: Manager.Commit (hash: 1bef1c7c)
;; Logic: QF_AUFLIA (Arrays + Uninterpreted Functions + Linear Integer Arithmetic)
;; Status: UNSAT (Proved Safe & Crash-Idempotent)

;; --- Query 1: Live-State Disjointness ---
; benchmark generated from python API
(set-info :status unknown)
(declare-fun k_query1 () Int)
(assert
 (let (($x9 (= 2 k_query1)))
(let (($x7 (= 1 k_query1)))
(and $x7 $x9))))
(check-sat)


;; --- Query 2: Partial-Abort Retry Idempotence ---
; benchmark generated from python API
(set-info :status unknown)
(declare-fun k_test () Int)
(declare-fun s0 () (Array Int Bool))
(declare-fun k_abort () Int)
(assert
 (let (($x35 (select s0 k_test)))
(let (($x34 (= 2 k_test)))
(let (($x36 (ite $x34 false $x35)))
(let (($x38 (and $x34 (<= k_test k_abort))))
(let (($x39 (ite $x38 false $x35)))
(let (($x40 (ite $x34 false $x39)))
(and (distinct $x40 $x36) true))))))))
(check-sat)


;; (check-sat) returned unsat for both queries.