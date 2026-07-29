import ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean.AdmissibleClass
import ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean.ReactionKineticsModel
import ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean.ThermodynamicsModel

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure ProcessSafetyFoundationPackage where
  kinetics : ReactionKineticsPackage
  thermodynamics : ThermodynamicsPackage
  safetyConstraints : Prop
  hazardIdentified : Prop

structure ProcessSafetyFoundationEvidence (P : ProcessSafetyFoundationPackage) where
  kineticsClosed : ReactionKineticsClosed P.kinetics
  thermodynamicsClosed : ThermodynamicsClosed P.thermodynamics
  safetyConstraintsClosed : P.safetyConstraints
  hazardIdentifiedClosed : P.hazardIdentified

def ProcessSafetyFoundationClosed (P : ProcessSafetyFoundationPackage) : Prop :=
  ReactionKineticsClosed P.kinetics ∧ ThermodynamicsClosed P.thermodynamics ∧
  P.safetyConstraints ∧ P.hazardIdentified

theorem process_safety_foundation_closed_from_evidence (P : ProcessSafetyFoundationPackage) (E : ProcessSafetyFoundationEvidence P) :
    ProcessSafetyFoundationClosed P := by
  exact And.intro E.kineticsClosed (And.intro E.thermodynamicsClosed (And.intro E.safetyConstraintsClosed E.hazardIdentifiedClosed))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
