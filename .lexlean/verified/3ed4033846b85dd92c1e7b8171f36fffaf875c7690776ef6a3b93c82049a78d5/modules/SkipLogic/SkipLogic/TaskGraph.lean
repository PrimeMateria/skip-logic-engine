module
public import Init
public import SkipLogic.SkipLogic.Parameters
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 1000000000
set_option linter.constructorNameAsVariable false
namespace SkipLogic.SkipLogic.TaskGraph

public structure TaskGraphScheduleConfig where
  maxTaskNodesCapacity : Nat
  workerThreadsCount : Nat
  maxDependencyDepth : Nat
  isLockFreeScheduler : Bool

@[expose] public def defaultTaskGraphConfig : TaskGraphScheduleConfig := ({ maxTaskNodesCapacity := 256, workerThreadsCount := 8, maxDependencyDepth := 16, isLockFreeScheduler := true } : TaskGraphScheduleConfig)

@[expose] public def isSchedulerLockFree (c : TaskGraphScheduleConfig) : Bool := (c).isLockFreeScheduler

@[expose] public def isDagAcyclicBounded (c : TaskGraphScheduleConfig) : Bool := (Nat.ble ((c).maxDependencyDepth) (64))

@[expose] public def canSatisfyDependency (depRemaining : Nat) : Bool := (Nat.beq (depRemaining) (0))

public theorem task_graph_lock_free_sound : (isSchedulerLockFree (defaultTaskGraphConfig) = true) := by
  rfl

public theorem task_graph_acyclic_bounded : (isDagAcyclicBounded (defaultTaskGraphConfig) = true) := by
  rfl

public theorem dependency_satisfaction_sound : ((canSatisfyDependency (0) && (!canSatisfyDependency (1))) = true) := by
  rfl

end SkipLogic.SkipLogic.TaskGraph
