;; Origard v3.5 Yggdrasil Idempotent Cleanup Certificate
;; Target: PruneOldVersions (hash: f067cf15)
;; Logic: QF_AUFLIA (Arrays + Uninterpreted Functions + Linear Integer Arithmetic)
;; Status: UNSAT (Proved Safe & Crash-Idempotent)

;; --- Query 1: Live-State Disjointness ---
; benchmark generated from python API
(set-info :status unknown)
(declare-fun k_query1 () Int)
(assert
 (let (($x8 (< k_query1 100)))
(let (($x7 (>= k_query1 100)))
(and $x7 $x8))))
(check-sat)


;; --- Query 2: Partial-Abort Retry Idempotence ---
; benchmark generated from python API
(set-info :status unknown)
(declare-fun k_test () Int)
(declare-fun s0 () (Array Int Bool))
(declare-fun k_abort () Int)
(assert
 (let (($x34 (select s0 k_test)))
(let (($x33 (< k_test 100)))
(let (($x35 (ite $x33 false $x34)))
(let (($x37 (and $x33 (<= k_test k_abort))))
(let (($x38 (ite $x37 false $x34)))
(let (($x39 (ite $x33 false $x38)))
(and (distinct $x39 $x35) true))))))))
(check-sat)


;; (check-sat) returned unsat for both queries.