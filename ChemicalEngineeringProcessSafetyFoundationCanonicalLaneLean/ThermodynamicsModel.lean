import ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure ThermodynamicsPackage where
  internalEnergy : ℝ
  enthalpy : ℝ
  entropy : ℝ
  gibbsEnergy : ℝ
  pressure : ℝ
  volume : ℝ
  temperature : ℝ

structure ThermodynamicsEvidence (T : ThermodynamicsPackage) where
  enthalpyDefined : T.enthalpy = T.internalEnergy + T.pressure * T.volume
  gibbsEnergyDefined : T.gibbsEnergy = T.enthalpy - T.temperature * T.entropy
  entropyPositive : T.entropy > 0
  temperaturePositive : T.temperature > 0

def ThermodynamicsClosed (T : ThermodynamicsPackage) : Prop :=
  T.enthalpy = T.internalEnergy + T.pressure * T.volume ∧
  T.gibbsEnergy = T.enthalpy - T.temperature * T.entropy ∧
  T.entropy > 0 ∧ T.temperature > 0

theorem thermodynamics_closed_from_evidence (T : ThermodynamicsPackage) (E : ThermodynamicsEvidence T) :
    ThermodynamicsClosed T := by
  exact And.intro E.enthalpyDefined (And.intro E.gibbsEnergyDefined (And.intro E.entropyPositive E.temperaturePositive))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
