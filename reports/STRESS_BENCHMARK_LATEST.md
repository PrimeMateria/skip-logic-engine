# Skip-Logic High-Scale Stress & Invariant Benchmark Report

**Overall Status**: ✅ PASSED  
**Execution Duration**: `1.440s`  
**Timestamp**: `2026-11-24T15:16:13.655233`  

---

## Suite Results

### INV-SKIP-1: Prime State Factorization Scaling: ✅ PASS


| Path Count | Factorized States | Duration (s) | Status |
| :--- | :--- | :--- | :--- |
| 10 | 10 | 0.000 | ✅ PASS |
| 100 | 100 | 0.000 | ✅ PASS |
| 1000 | 1000 | 0.004 | ✅ PASS |
| 10000 | 10000 | 0.045 | ✅ PASS |

### INV-SKIP-2: Lock-Free Task Graph Concurrency (<2.0 us): ✅ PASS

- **avg_dispatch_us**: `0.0044437265387387015`
- **total_tasks_evaluated**: `128000`
- **duration_s**: `0.0005687969969585538`

### INV-SKIP-3: Zero-Allocation Arena & 64-Byte Cache Alignment: ✅ PASS

- **heap_allocations**: `0`
- **alignment_checks_passed**: `200000`
- **frames_tested**: `10000`
- **duration_s**: `0.04085353598929942`

### INV-SKIP-4: Telemetry Integrators & Scaffolding Convergence: ✅ PASS

- **scaffolding_triggered**: `True`
- **converged**: `True`
- **final_alpha_3**: `0.9428`
- **accumulated_efc**: `8.4`
- **steps_to_converge**: `73`

### BENCH-SKIP-5: High-Volume Diagnostic Throughput: ✅ PASS

- **suite_id**: `SUITE-S5`
- **invariant**: `BENCH-SKIP-5`
- **sla_events_per_second**: `100000`
- **sla_p99_latency_us**: `10000.0`
- **peak_events_per_second**: `866322.0084375414`
- **steady_scaling_ratio**: `0.76206106293103`
- **ring_capacity_events**: `4096`
- **duration_s**: `0.6244273369957227`

| Events | Batch Size | Scenario | Wall Time (s) | Events/sec | p50 Latency (us) | p95 Latency (us) | p99 Latency (us) | Sequence Gaps | Checksum Failures | Ring Overflows | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 10000 | 128 | steady_state | 0.012 | 866322.008 | 69.094 | 132.764 | 205.887 | 0 | 0 | 0 | ✅ PASS |
| 50000 | 256 | steady_state | 0.076 | 660190.271 | 171.193 | 376.674 | 492.561 | 0 | 0 | 0 | ✅ PASS |
| 250000 | 512 | steady_state | 0.364 | 686809.528 | 320.899 | 782.957 | 1089.054 | 0 | 0 | 0 | ✅ PASS |
| 100000 | 2048 | scaffolding_burst | 0.170 | 587776.431 | 1447.238 | 3481.144 | 4206.180 | 0 | 0 | 0 | ✅ PASS |

### BENCH-SKIP-6: Multi-Tenant Lock-Free Concurrency Scaling: ✅ PASS

- **suite_id**: `SUITE-S6`
- **invariant**: `BENCH-SKIP-6`
- **frames_per_tenant**: `8`
- **nodes_per_frame**: `128`
- **worker_counts_tested**: `1, 2, 4, 8`
- **tenant_counts_tested**: `1, 8, 32`
- **total_work_steals**: `622`
- **min_worker_scaling_ratio**: `0.7037515745754029`
- **scaling_observations**: `{'tenants': 1, 'min_max_throughput_ratio': 0.7511166047450702, 'baseline_single_worker_tps': 255576.320023728}, {'tenants': 8, 'min_max_throughput_ratio': 0.8127821201572379, 'baseline_single_worker_tps': 228177.45957447446}, {'tenants': 32, 'min_max_throughput_ratio': 0.7037515745754029, 'baseline_single_worker_tps': 303354.13787392015}`
- **scaling_ratio_gate**: `informational (GIL-serialized CPython model)`
- **duration_s**: `0.7242202060006093`

| Tenants | Workers | Frames/Tenant | Nodes/Frame | Frame Jobs | Task Steps | Wall Time (s) | Task Steps/sec | Avg Task (us) | Work Steals | Tenant Skew | Duplicate Jobs | Missing Jobs | Stalled | Thread Errors | Speedup (1W) | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | 1 | 8 | 128 | 8 | 1024 | 0.004 | 255576.320 | 3.913 | 0 | 1.000 | 0 | 0 | False | none | 1.000 | ✅ PASS |
| 1 | 2 | 8 | 128 | 8 | 1024 | 0.005 | 208610.352 | 4.794 | 8 | 1.000 | 0 | 0 | False | none | 0.816 | ✅ PASS |
| 1 | 4 | 8 | 128 | 8 | 1024 | 0.005 | 191967.618 | 5.209 | 8 | 1.000 | 0 | 0 | False | none | 0.751 | ✅ PASS |
| 1 | 8 | 8 | 128 | 8 | 1024 | 0.005 | 204053.207 | 4.901 | 8 | 1.000 | 0 | 0 | False | none | 0.798 | ✅ PASS |
| 8 | 1 | 8 | 128 | 64 | 8192 | 0.036 | 228177.460 | 4.383 | 0 | 1.000 | 0 | 0 | False | none | 1.000 | ✅ PASS |
| 8 | 2 | 8 | 128 | 64 | 8192 | 0.032 | 252194.736 | 3.965 | 31 | 1.000 | 0 | 0 | False | none | 1.105 | ✅ PASS |
| 8 | 4 | 8 | 128 | 64 | 8192 | 0.040 | 204979.372 | 4.879 | 64 | 1.000 | 0 | 0 | False | none | 0.898 | ✅ PASS |
| 8 | 8 | 8 | 128 | 64 | 8192 | 0.034 | 240432.619 | 4.159 | 41 | 1.000 | 0 | 0 | False | none | 1.054 | ✅ PASS |
| 32 | 1 | 8 | 128 | 256 | 32768 | 0.108 | 303354.138 | 3.296 | 0 | 1.000 | 0 | 0 | False | none | 1.000 | ✅ PASS |
| 32 | 2 | 8 | 128 | 256 | 32768 | 0.153 | 213485.952 | 4.684 | 121 | 1.000 | 0 | 0 | False | none | 0.704 | ✅ PASS |
| 32 | 4 | 8 | 128 | 256 | 32768 | 0.136 | 240932.409 | 4.151 | 123 | 1.000 | 0 | 0 | False | none | 0.794 | ✅ PASS |
| 32 | 8 | 8 | 128 | 256 | 32768 | 0.152 | 215104.606 | 4.649 | 218 | 1.000 | 0 | 0 | False | none | 0.709 | ✅ PASS |

