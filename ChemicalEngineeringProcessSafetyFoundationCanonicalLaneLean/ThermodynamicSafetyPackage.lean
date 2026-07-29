import HautevilleHouse.ChemicalEngineeringProcessSafetyFoundation.ProcessSafetyFoundation

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundation

structure ThermodynamicSafetyPackage where
  enthalpyStability : Prop
  entropyProduction : Prop
  gibbsFreeEnergyMinimized : Prop
  phaseEquilibrium : Prop

structure ThermodynamicSafetyEvidence (T : ThermodynamicSafetyPackage) where
  enthalpyStabilityClosed : T.enthalpyStability
  entropyProductionClosed : T.entropyProduction
  gibbsFreeEnergyMinimizedClosed : T.gibbsFreeEnergyMinimized
  phaseEquilibriumClosed : T.phaseEquilibrium

def ThermodynamicSafetyClosed (T : ThermodynamicSafetyPackage) : Prop :=
  T.enthalpyStability ∧ T.entropyProduction ∧ T.gibbsFreeEnergyMinimized ∧ T.phaseEquilibrium

theorem thermodynamic_safety_closed_from_evidence (T : ThermodynamicSafetyPackage) (E : ThermodynamicSafetyEvidence T) : ThermodynamicSafetyClosed T :=
  And.intro E.enthalpyStabilityClosed (And.intro E.entropyProductionClosed (And.intro E.gibbsFreeEnergyMinimizedClosed E.phaseEquilibriumClosed))

end ChemicalEngineeringProcessSafetyFoundation
end HautevilleHouse
