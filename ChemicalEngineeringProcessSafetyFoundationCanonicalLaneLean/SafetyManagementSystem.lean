import ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean.ConsequenceAnalysis

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure SafetyManagementSystemPackage {D : ProcessSafetyDomain} {I : InherentSafetyPackage D} {H : HAZOP_LOPAPackage I} {C : ConsequenceAnalysisPackage H} where
  processSafetyCulture : Prop
  managementOfChange : Prop
  incidentInvestigation : Prop
  emergencyPlanning : Prop
  continuousImprovement : Prop

structure SafetyManagementSystemEvidence {D : ProcessSafetyDomain} {I : InherentSafetyPackage D} {H : HAZOP_LOPAPackage I} {C : ConsequenceAnalysisPackage H} (S : SafetyManagementSystemPackage C) where
  processSafetyCultureClosed : S.processSafetyCulture
  managementOfChangeClosed : S.managementOfChange
  incidentInvestigationClosed : S.incidentInvestigation
  emergencyPlanningClosed : S.emergencyPlanning
  continuousImprovementClosed : S.continuousImprovement

def SafetyManagementSystemClosed {D : ProcessSafetyDomain} {I : InherentSafetyPackage D} {H : HAZOP_LOPAPackage I} {C : ConsequenceAnalysisPackage H} (S : SafetyManagementSystemPackage C) : Prop :=
  S.processSafetyCulture ∧ S.managementOfChange ∧ S.incidentInvestigation ∧ S.emergencyPlanning ∧ S.continuousImprovement

theorem safety_management_system_closed_from_evidence
    {D : ProcessSafetyDomain} {I : InherentSafetyPackage D} {H : HAZOP_LOPAPackage I} {C : ConsequenceAnalysisPackage H} (S : SafetyManagementSystemPackage C) (E : SafetyManagementSystemEvidence S) :
    SafetyManagementSystemClosed S := by
  exact And.intro E.processSafetyCultureClosed
    (And.intro E.managementOfChangeClosed
      (And.intro E.incidentInvestigationClosed
        (And.intro E.emergencyPlanningClosed E.continuousImprovementClosed)))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
