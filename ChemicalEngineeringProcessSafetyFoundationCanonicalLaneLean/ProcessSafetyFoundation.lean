import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundation

structure AdmissibleClass where
  object : ChemicalSafetyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SafetyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalEngineeringProcessSafetyFoundation
end HautevilleHouse
