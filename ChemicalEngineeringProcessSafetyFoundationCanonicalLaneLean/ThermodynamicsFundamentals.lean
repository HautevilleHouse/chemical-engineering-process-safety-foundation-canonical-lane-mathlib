import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure ThermodynamicsFundamentalsPackage where
  firstLawConservation : Prop
  secondLawEntropyNondecreasing : Prop
  gibbsFreeEnergyMinimized : Prop
  phaseEquilibriumCondition : Prop

structure ThermodynamicsFundamentalsEvidence (T : ThermodynamicsFundamentalsPackage) where
  firstLawConservationClosed : T.firstLawConservation
  secondLawEntropyNondecreasingClosed : T.secondLawEntropyNondecreasing
  gibbsFreeEnergyMinimizedClosed : T.gibbsFreeEnergyMinimized
  phaseEquilibriumConditionClosed : T.phaseEquilibriumCondition

def ThermodynamicsFundamentalsClosed (T : ThermodynamicsFundamentalsPackage) : Prop :=
  T.firstLawConservation ∧ T.secondLawEntropyNondecreasing ∧
  T.gibbsFreeEnergyMinimized ∧ T.phaseEquilibriumCondition

theorem thermodynamics_fundamentals_closed_from_evidence
    (T : ThermodynamicsFundamentalsPackage)
    (E : ThermodynamicsFundamentalsEvidence T) : ThermodynamicsFundamentalsClosed T := by
  exact And.intro E.firstLawConservationClosed
    (And.intro E.secondLawEntropyNondecreasingClosed
      (And.intro E.gibbsFreeEnergyMinimizedClosed
        E.phaseEquilibriumConditionClosed))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse