import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ProcessSafetyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
