import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringProcessSafetyFoundation.ProcessSafetyFoundation

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundation

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SafetyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end ChemicalEngineeringProcessSafetyFoundation
end HautevilleHouse
