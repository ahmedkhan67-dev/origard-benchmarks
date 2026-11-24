# Origard Verification Benchmarks & Proof Certificates
This repository hosts a standalone Z3/Spacer `.smt2` proof certificates and benchmarks reports produced by **Origard**, a zero harness static formal verification and neuro-symbolic auditing engine for Go and Rust Infrastructure 
*(Note: The core Origard engine is currently in a private repository during Phase 4 compiler IR and deadlock development. Public CLI tools, SARIF 2.1.0 integration, and historical CVE benchmarks will be released here as milestones complete.)*
# EMPIRICAL  BENCHMARKS (< 50 Mb RAM. COMMODITY HARDWARE)
| Target Repository | Language | Peak RAM | Wall-Clock Time | Result |
|---|---|---|---|---|
| `sei-tendermint/consensus` | Go | 3.95 MB | Fast | 4 / 346 candidates (`SetRound` panic-defer verified) |
| `sei-db` | Go | 45.89 MB | ~4.8m | 32 / 3,413 candidates (22 false positives formally discharged) |
| `go-f3` (Filecoin Finality) | Go | < 50 MB | Fast | 6 candidates (`PowerTable.rescale` & `Subscriber.Start` surfaced) |
| `reth` (`consensus` & `evm`) | Rust | < 50 MB | Fast | 0 consensus / 2 EVM candidates |
| `ref-fvm` (`fvm/src`) | Rust | 3.08 MB | 10.68s | `DefaultExecutor.execute_message` formally verified (`1/475` verified, `73` partial coverage) |
# INCLUDED PROOF CERTIFICATES AND REPORTS
* `counter_lemur_lemur.smt2` — 3-gate proof-carrying invariant certificate (Non-Vacuity, Inductiveness, Sufficiency)[cite: 21].
* `counter_loop_spacer.smt2` — Z3 Fixedpoint (Spacer) CHC inductive safety proof[cite: 22].
* `Manager_Commit_yggdrasil.smt2` & `PruneOldVersions_yggdrasil.smt2` — `QF_AUFLIA` crash-idempotence certificates[cite: 23, 24].
* `origard_v2_report.json` — Summary scan output from `ref-fvm` (`fvm/src`)[cite: 25].
# VERIFYING OFFLINE WITH Z3
anyone with z3 installed can independently check the proof certificates locally:
```bash
z3 counter_lemur_lemur.smt2
z3 counter_loop_spacer.smt2
z3 Manager_Commit_yggdrasil.smt2
z3 PruneOldVersions_yggdrasil.smt2
