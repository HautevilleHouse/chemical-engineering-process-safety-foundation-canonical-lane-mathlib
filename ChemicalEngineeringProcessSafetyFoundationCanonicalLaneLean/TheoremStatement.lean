import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure ProcessSafetySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ProcessSafetyAdmittedObject where
  space : ProcessSafetySpace
  processSafetyCondition : Prop
  hazardModel : Type
  hazardTopology : TopologicalSpace hazardModel
  safetyCertificate : Prop
  conclusion : safetyCertificate

def ProcessSafetyWitnessClosed (O : ProcessSafetyAdmittedObject) : Prop :=
  O.safetyCertificate

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
