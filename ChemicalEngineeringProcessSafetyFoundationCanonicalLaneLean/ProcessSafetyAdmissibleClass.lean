import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure ProcessSafetyObject where
  process : Type
  hazardIdentified : Prop
  controlMeasureImplemented : Prop
  residualRiskRecorded : Prop

structure ProcessSafetyAdmittedObject where
  processSafetyObject : ProcessSafetyObject
  hazardIdentifiedClosed : processSafetyObject.hazardIdentified
  controlMeasureImplementedClosed : processSafetyObject.controlMeasureImplemented
  residualRiskRecordedClosed : processSafetyObject.residualRiskRecorded
  conclusion : hazardIdentifiedClosed ∧ controlMeasureImplementedClosed ∧ residualRiskRecordedClosed

def ProcessSafetyWitnessClosed (O : ProcessSafetyAdmittedObject) : Prop :=
  O.conclusion

structure AdmissibleClass where
  object : ProcessSafetyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ProcessSafetyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
