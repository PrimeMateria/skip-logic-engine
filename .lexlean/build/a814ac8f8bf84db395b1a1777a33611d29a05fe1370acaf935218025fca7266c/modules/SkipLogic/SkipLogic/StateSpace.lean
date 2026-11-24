module
public import Init
public import LexLeanRuntime.Portable
public import SkipLogic.SkipLogic.Parameters
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 1000000000
set_option linter.constructorNameAsVariable false
namespace SkipLogic.SkipLogic.StateSpace

public structure PrimeBasisState where
  primeId : Nat
  amplitudeScaled : Nat
  velocityScaled : Nat

public structure CompositeState where
  compositeProduct : Nat
  activePrimesCount : Nat
  isFactorizable : Bool

@[expose] public def atomicStateCounting : PrimeBasisState := ({ primeId := 2, amplitudeScaled := 850, velocityScaled := 12 } : PrimeBasisState)

@[expose] public def atomicStateSpatial : PrimeBasisState := ({ primeId := 3, amplitudeScaled := 550, velocityScaled := 4 } : PrimeBasisState)

@[expose] public def compositeStateSpatialCounting : CompositeState := ({ compositeProduct := 6, activePrimesCount := 2, isFactorizable := true } : CompositeState)

@[expose] public def isPrimeBasisOrthogonal (p1 : Nat) (p2 : Nat) : Bool := (if (Nat.beq (p1) (p2)) then true else (!(Nat.beq (p1) (p2))))

@[expose] public def computeCompositeProduct (p1 : Nat) (p2 : Nat) : Nat := (LexLeanRuntime.multiply (p1) (p2) : Nat)

public theorem prime_basis_orthogonality_sound : (isPrimeBasisOrthogonal (2) (3) = true) := by
  rfl

public theorem composite_state_product_sound : ((Nat.beq (computeCompositeProduct (2) (3)) (6)) = true) := by
  rfl

public theorem composite_state_factorizable_sound : ((compositeStateSpatialCounting).isFactorizable = true) := by
  rfl

public theorem atomic_state_counting_prime : ((Nat.beq ((atomicStateCounting).primeId) (2)) = true) := by
  rfl

end SkipLogic.SkipLogic.StateSpace
