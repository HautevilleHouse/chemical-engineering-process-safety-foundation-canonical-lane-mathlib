import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

def ConstrainedProcessSafetyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_process_safety_endgame (A : AdmissibleClass) :
    ConstrainedProcessSafetyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
