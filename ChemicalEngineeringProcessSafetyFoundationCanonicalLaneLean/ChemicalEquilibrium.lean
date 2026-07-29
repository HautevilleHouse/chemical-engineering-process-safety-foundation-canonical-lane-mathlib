import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure ChemicalEquilibriumPackage where
  equilibriumConstantDefined : Prop
  leChatelierPrincipleApplied : Prop
  reactionQuotientCompared : Prop
  temperatureEffectModeled : Prop

structure ChemicalEquilibriumEvidence (C : ChemicalEquilibriumPackage) where
  equilibriumConstantDefinedClosed : C.equilibriumConstantDefined
  leChatelierPrincipleAppliedClosed : C.leChatelierPrincipleApplied
  reactionQuotientComparedClosed : C.reactionQuotientCompared
  temperatureEffectModeledClosed : C.temperatureEffectModeled

def ChemicalEquilibriumClosed (C : ChemicalEquilibriumPackage) : Prop :=
  C.equilibriumConstantDefined ∧ C.leChatelierPrincipleApplied ∧
  C.reactionQuotientCompared ∧ C.temperatureEffectModeled

theorem chemical_equilibrium_closed_from_evidence (C : ChemicalEquilibriumPackage)
    (E : ChemicalEquilibriumEvidence C) : ChemicalEquilibriumClosed C := by
  exact And.intro E.equilibriumConstantDefinedClosed
    (And.intro E.leChatelierPrincipleAppliedClosed
      (And.intro E.reactionQuotientComparedClosed
        E.temperatureEffectModeledClosed))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse