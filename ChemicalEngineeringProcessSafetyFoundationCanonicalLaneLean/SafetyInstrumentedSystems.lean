import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure SafetyInstrumentedSystemsPackage where
  safetyIntegrityLevel : Prop
  reliabilityModeling : Prop
  proofTesting : Prop
  systematicCapability : Prop

structure SafetyInstrumentedSystemsEvidence (S : SafetyInstrumentedSystemsPackage) where
  safetyIntegrityLevelClosed : S.safetyIntegrityLevel
  reliabilityModelingClosed : S.reliabilityModeling
  proofTestingClosed : S.proofTesting
  systematicCapabilityClosed : S.systematicCapability

def SafetyInstrumentedSystemsClosed (S : SafetyInstrumentedSystemsPackage) : Prop :=
  S.safetyIntegrityLevel ∧ S.reliabilityModeling ∧ S.proofTesting ∧ S.systematicCapability

theorem safety_instrumented_systems_closed_from_evidence
    (S : SafetyInstrumentedSystemsPackage) (E : SafetyInstrumentedSystemsEvidence S) :
    SafetyInstrumentedSystemsClosed S := by
  exact And.intro E.safetyIntegrityLevelClosed
    (And.intro E.reliabilityModelingClosed
      (And.intro E.proofTestingClosed E.systematicCapabilityClosed))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse