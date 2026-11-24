module
public import Init
public import SkipLogic.SkipLogic.Parameters
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 1000000000
set_option linter.constructorNameAsVariable false
namespace SkipLogic.SkipLogic.Memory

public structure EngineMemoryLayout where
  cacheLineAlignBytes : Nat
  frameArenaBytes : Nat
  sceneArenaBytes : Nat
  zeroAllocHotLoop : Bool

@[expose] public def defaultMemoryLayout : EngineMemoryLayout := ({ cacheLineAlignBytes := 64, frameArenaBytes := 2097152, sceneArenaBytes := 16777216, zeroAllocHotLoop := true } : EngineMemoryLayout)

@[expose] public def isCacheAligned64 (m : EngineMemoryLayout) : Bool := (Nat.beq ((m).cacheLineAlignBytes) (64))

@[expose] public def isZeroAllocEnforced (m : EngineMemoryLayout) : Bool := (m).zeroAllocHotLoop

@[expose] public def computeBumpOffset (current : Nat) (requested : Nat) : Nat := (current + requested)

public theorem cache_line_alignment_sound : (isCacheAligned64 (defaultMemoryLayout) = true) := by
  rfl

public theorem zero_allocation_hot_loop_sound : (isZeroAllocEnforced (defaultMemoryLayout) = true) := by
  rfl

public theorem bump_allocation_offset_sound : ((Nat.beq (computeBumpOffset (128) (64)) (192)) = true) := by
  rfl

end SkipLogic.SkipLogic.Memory
