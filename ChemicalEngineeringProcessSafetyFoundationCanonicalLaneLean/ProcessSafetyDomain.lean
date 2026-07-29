import ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure ProcessSafetyDomain where
  hazardIdentification : Prop
  riskAssessment : Prop
  layerOfProtectionAnalysis : Prop
  safetyInstrumentedSystems : Prop
  consequenceModeling : Prop

structure ProcessSafetyEvidence (D : ProcessSafetyDomain) where
  hazardIdentificationClosed : D.hazardIdentification
  riskAssessmentClosed : D.riskAssessment
  layerOfProtectionAnalysisClosed : D.layerOfProtectionAnalysis
  safetyInstrumentedSystemsClosed : D.safetyInstrumentedSystems
  consequenceModelingClosed : D.consequenceModeling

def ProcessSafetyDomainClosed (D : ProcessSafetyDomain) : Prop :=
  D.hazardIdentification ∧ D.riskAssessment ∧ D.layerOfProtectionAnalysis ∧ D.safetyInstrumentedSystems ∧ D.consequenceModeling

theorem process_safety_domain_closed_from_evidence
    (D : ProcessSafetyDomain) (E : ProcessSafetyEvidence D) :
    ProcessSafetyDomainClosed D := by
  exact And.intro E.hazardIdentificationClosed
    (And.intro E.riskAssessmentClosed
      (And.intro E.layerOfProtectionAnalysisClosed
        (And.intro E.safetyInstrumentedSystemsClosed E.consequenceModelingClosed)))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
