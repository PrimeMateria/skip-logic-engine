module
public import Init
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 1000000000
set_option linter.constructorNameAsVariable false
namespace SkipLogic.SkipLogic.Parameters

public structure SkipLogicEngineParameters where
  universalMultiplicityScaled : Nat
  fixedTimestepUs : Nat
  maxActivePrimes : Nat
  frameArenaCapacityBytes : Nat
  cacheLineAlignmentBytes : Nat
  targetFrameFps : Nat
  rlgStallThresholdScaled : Nat
  efcMinBoundScaled : Nat
  efcMaxBoundScaled : Nat

@[expose] public def defaultEngineParams : SkipLogicEngineParameters := ({ universalMultiplicityScaled := 729, fixedTimestepUs := 16666, maxActivePrimes := 64, frameArenaCapacityBytes := 2097152, cacheLineAlignmentBytes := 64, targetFrameFps := 60, rlgStallThresholdScaled := 500, efcMinBoundScaled := 800, efcMaxBoundScaled := 1200 } : SkipLogicEngineParameters)

@[expose] public def highPerformanceEngineParams : SkipLogicEngineParameters := ({ universalMultiplicityScaled := 850, fixedTimestepUs := 8333, maxActivePrimes := 64, frameArenaCapacityBytes := 4194304, cacheLineAlignmentBytes := 64, targetFrameFps := 120, rlgStallThresholdScaled := 400, efcMinBoundScaled := 850, efcMaxBoundScaled := 1150 } : SkipLogicEngineParameters)

@[expose] public def isTiming60Fps (p : SkipLogicEngineParameters) : Bool := ((Nat.beq ((p).fixedTimestepUs) (16666)) && (Nat.beq ((p).targetFrameFps) (60)))

@[expose] public def isAlignmentValid (p : SkipLogicEngineParameters) : Bool := (Nat.beq ((p).cacheLineAlignmentBytes) (64))

@[expose] public def isCapacitySufficient (p : SkipLogicEngineParameters) : Bool := (Nat.ble (1048576) ((p).frameArenaCapacityBytes))

public theorem default_params_timing_stable : (isTiming60Fps (defaultEngineParams) = true) := by
  rfl

public theorem default_alignment_valid : (isAlignmentValid (defaultEngineParams) = true) := by
  rfl

public theorem default_capacity_sufficient : (isCapacitySufficient (defaultEngineParams) = true) := by
  rfl

public theorem high_performance_alignment_valid : (isAlignmentValid (highPerformanceEngineParams) = true) := by
  rfl

end SkipLogic.SkipLogic.Parameters
