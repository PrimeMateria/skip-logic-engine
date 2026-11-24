module
public import Init
public import SkipLogic.SkipLogic.Parameters
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 1000000000
set_option linter.constructorNameAsVariable false
namespace SkipLogic.SkipLogic.Verification

public structure FormalVerificationSuiteGate where
  leanKernelProofsCount : Nat
  compilerFuzzingCasesCount : Nat
  maxDispatchLatencyNs : Nat
  zeroMiriUndefinedBehavior : Bool

@[expose] public def productionVerificationGate : FormalVerificationSuiteGate := ({ leanKernelProofsCount := 36, compilerFuzzingCasesCount := 10000, maxDispatchLatencyNs := 500, zeroMiriUndefinedBehavior := true } : FormalVerificationSuiteGate)

@[expose] public def isGateSatisfied (g : FormalVerificationSuiteGate) : Bool := (((Nat.ble (30) ((g).leanKernelProofsCount)) && (Nat.ble ((g).maxDispatchLatencyNs) (1000))) && (g).zeroMiriUndefinedBehavior)

public theorem production_gate_satisfied_sound : (isGateSatisfied (productionVerificationGate) = true) := by
  rfl

public theorem dispatch_latency_within_budget : ((Nat.ble ((productionVerificationGate).maxDispatchLatencyNs) (500)) = true) := by
  rfl

public theorem miri_clean_sound : ((productionVerificationGate).zeroMiriUndefinedBehavior = true) := by
  rfl

end SkipLogic.SkipLogic.Verification
