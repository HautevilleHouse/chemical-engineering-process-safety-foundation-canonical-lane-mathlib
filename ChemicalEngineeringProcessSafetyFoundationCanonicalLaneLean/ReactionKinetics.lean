import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure ReactionKineticsPackage where
  rateLawFormulated : Prop
  activationEnergyBounded : Prop
  equilibriumConstantDriven : Prop
  temperatureDependenceModeled : Prop

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  rateLawFormulatedClosed : R.rateLawFormulated
  activationEnergyBoundedClosed : R.activationEnergyBounded
  equilibriumConstantDrivenClosed : R.equilibriumConstantDriven
  temperatureDependenceModeledClosed : R.temperatureDependenceModeled

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  R.rateLawFormulated ∧ R.activationEnergyBounded ∧
  R.equilibriumConstantDriven ∧ R.temperatureDependenceModeled

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsPackage)
    (E : ReactionKineticsEvidence R) : ReactionKineticsClosed R := by
  exact And.intro E.rateLawFormulatedClosed
    (And.intro E.activationEnergyBoundedClosed
      (And.intro E.equilibriumConstantDrivenClosed
        E.temperatureDependenceModeledClosed))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse