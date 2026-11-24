module
public import Init
public import SkipLogic.SkipLogic.Parameters
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 1000000000
set_option linter.constructorNameAsVariable false
namespace SkipLogic.SkipLogic.Subsystems

public structure SubsystemArchitectureLayout where
  logicSubsystemId : Nat
  platformSubsystemId : Nat
  viewSubsystemId : Nat
  resourceSubsystemId : Nat
  snapshotBufferCapacity : Nat
  viewHasWriteAccess : Bool

@[expose] public def defaultSubsystemsLayout : SubsystemArchitectureLayout := ({ logicSubsystemId := 1, platformSubsystemId := 2, viewSubsystemId := 3, resourceSubsystemId := 4, snapshotBufferCapacity := 3, viewHasWriteAccess := false } : SubsystemArchitectureLayout)

@[expose] public def isQuadLayerSubsystem (s : SubsystemArchitectureLayout) : Bool := ((Nat.beq ((s).logicSubsystemId) (1)) && ((Nat.beq ((s).platformSubsystemId) (2)) && ((Nat.beq ((s).viewSubsystemId) (3)) && (Nat.beq ((s).resourceSubsystemId) (4)))))

@[expose] public def isViewIsolatedReadOnly (s : SubsystemArchitectureLayout) : Bool := (!(s).viewHasWriteAccess)

@[expose] public def rotateTripleBufferIndex (currentIndex : Nat) : Nat := (if (Nat.beq (currentIndex) (2)) then 0 else (currentIndex + 1))

public theorem quad_layer_subsystems_sound : (isQuadLayerSubsystem (defaultSubsystemsLayout) = true) := by
  rfl

public theorem view_isolated_read_only_sound : (isViewIsolatedReadOnly (defaultSubsystemsLayout) = true) := by
  rfl

public theorem triple_buffer_rotation_sound : (((Nat.beq (rotateTripleBufferIndex (0)) (1)) && ((Nat.beq (rotateTripleBufferIndex (1)) (2)) && (Nat.beq (rotateTripleBufferIndex (2)) (0)))) = true) := by
  rfl

end SkipLogic.SkipLogic.Subsystems
