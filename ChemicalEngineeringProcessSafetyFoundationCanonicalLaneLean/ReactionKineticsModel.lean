import ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure ReactionKineticsPackage where
  rateConstant : ℝ
  activationEnergy : ℝ
  temperature : ℝ
  forwardRate : ℝ
  reverseRate : ℝ
  equilibriumConstant : ℝ

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  rateConstantClosed : R.rateConstant > 0
  activationEnergyClosed : R.activationEnergy > 0
  temperatureClosed : R.temperature > 0
  forwardRateClosed : R.forwardRate = R.rateConstant * Real.exp (-R.activationEnergy / R.temperature)
  reverseRateClosed : R.reverseRate = R.forwardRate / R.equilibriumConstant
  equilibriumConstantClosed : R.equilibriumConstant > 0

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  R.rateConstant > 0 ∧ R.activationEnergy > 0 ∧ R.temperature > 0 ∧
  R.forwardRate = R.rateConstant * Real.exp (-R.activationEnergy / R.temperature) ∧
  R.reverseRate = R.forwardRate / R.equilibriumConstant ∧ R.equilibriumConstant > 0

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsPackage) (E : ReactionKineticsEvidence R) :
    ReactionKineticsClosed R := by
  exact And.intro E.rateConstantClosed (And.intro E.activationEnergyClosed (And.intro E.temperatureClosed (And.intro E.forwardRateClosed (And.intro E.reverseRateClosed E.equilibriumConstantClosed))))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
