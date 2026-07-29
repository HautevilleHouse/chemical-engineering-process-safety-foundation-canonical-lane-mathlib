import HautevilleHouse.ChemicalEngineeringProcessSafetyFoundation.ReliefSystemDynamics

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundation

structure HazardAnalysisPackage where
  hazardIdentification : Prop
  riskAssessment : Prop
  layerOfProtection : Prop
  mitigationEffectiveness : Prop

structure HazardAnalysisEvidence (H : HazardAnalysisPackage) where
  hazardIdentificationClosed : H.hazardIdentification
  riskAssessmentClosed : H.riskAssessment
  layerOfProtectionClosed : H.layerOfProtection
  mitigationEffectivenessClosed : H.mitigationEffectiveness

def HazardAnalysisClosed (H : HazardAnalysisPackage) : Prop :=
  H.hazardIdentification ∧ H.riskAssessment ∧ H.layerOfProtection ∧ H.mitigationEffectiveness

theorem hazard_analysis_closed_from_evidence (H : HazardAnalysisPackage) (E : HazardAnalysisEvidence H) : HazardAnalysisClosed H :=
  And.intro E.hazardIdentificationClosed (And.intro E.riskAssessmentClosed (And.intro E.layerOfProtectionClosed E.mitigationEffectivenessClosed))

end ChemicalEngineeringProcessSafetyFoundation
end HautevilleHouse
