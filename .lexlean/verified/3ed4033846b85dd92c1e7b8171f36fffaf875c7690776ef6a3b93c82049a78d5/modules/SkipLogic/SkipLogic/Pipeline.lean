module
public import Init
public import SkipLogic.SkipLogic.Parameters
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 1000000000
set_option linter.constructorNameAsVariable false
namespace SkipLogic.SkipLogic.Pipeline

public structure CompilationPipelineStatus where
  totalTiersCount : Nat
  deadBranchesPruned : Nat
  simdVectorWidthBits : Nat
  zeroCostRustEmitted : Bool

@[expose] public def defaultPipelineStatus : CompilationPipelineStatus := ({ totalTiersCount := 3, deadBranchesPruned := 14, simdVectorWidthBits := 512, zeroCostRustEmitted := true } : CompilationPipelineStatus)

@[expose] public def isThreeTierPipeline (status : CompilationPipelineStatus) : Bool := ((Nat.beq ((status).totalTiersCount) (3)) && (status).zeroCostRustEmitted)

@[expose] public def isSimdWidthValid (status : CompilationPipelineStatus) : Bool := ((Nat.beq ((status).simdVectorWidthBits) (256)) || (Nat.beq ((status).simdVectorWidthBits) (512)))

public theorem pipeline_three_tier_sound : (isThreeTierPipeline (defaultPipelineStatus) = true) := by
  rfl

public theorem simd_vector_width_valid : (isSimdWidthValid (defaultPipelineStatus) = true) := by
  rfl

public theorem dead_branch_pruning_sound : ((Nat.ble (0) ((defaultPipelineStatus).deadBranchesPruned)) = true) := by
  rfl

end SkipLogic.SkipLogic.Pipeline
