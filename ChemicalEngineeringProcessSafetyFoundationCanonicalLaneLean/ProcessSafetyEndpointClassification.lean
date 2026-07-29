import HautevilleHouse.ChemicalEngineeringProcessSafetyFoundation.HazardAnalysisBridge

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundation

structure EndpointClassificationPackage where
  acceptableRiskTarget : Prop
  safetyIntegrityLevel : Prop
  consequenceThresholds : Prop
  regulatoryCompliance : Prop

structure EndpointClassificationEvidence (E : EndpointClassificationPackage) where
  acceptableRiskTargetClosed : E.acceptableRiskTarget
  safetyIntegrityLevelClosed : E.safetyIntegrityLevel
  consequenceThresholdsClosed : E.consequenceThresholds
  regulatoryComplianceClosed : E.regulatoryCompliance

def EndpointClassificationClosed (E : EndpointClassificationPackage) : Prop :=
  E.acceptableRiskTarget ∧ E.safetyIntegrityLevel ∧ E.consequenceThresholds ∧ E.regulatoryCompliance

theorem endpoint_classification_closed_from_evidence (E : EndpointClassificationPackage) (Ev : EndpointClassificationEvidence E) : EndpointClassificationClosed E :=
  And.intro Ev.acceptableRiskTargetClosed (And.intro Ev.safetyIntegrityLevelClosed (And.intro Ev.consequenceThresholdsClosed Ev.regulatoryComplianceClosed))

end ChemicalEngineeringProcessSafetyFoundation
end HautevilleHouse
