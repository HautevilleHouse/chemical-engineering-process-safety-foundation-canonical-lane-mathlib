import ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : ChemicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ChemicalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
