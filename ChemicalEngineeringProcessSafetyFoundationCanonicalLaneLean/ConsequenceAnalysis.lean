import ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean.HAZOP_LOPA

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure ConsequenceAnalysisPackage {D : ProcessSafetyDomain} {I : InherentSafetyPackage D} {H : HAZOP_LOPAPackage I} where
  sourceTermModeling : Prop
  dispersionModeling : Prop
  fireExplosionModeling : Prop
  toxicExposureModeling : Prop
  escalationAnalysis : Prop

structure ConsequenceAnalysisEvidence {D : ProcessSafetyDomain} {I : InherentSafetyPackage D} {H : HAZOP_LOPAPackage I} (C : ConsequenceAnalysisPackage H) where
  sourceTermModelingClosed : C.sourceTermModeling
  dispersionModelingClosed : C.dispersionModeling
  fireExplosionModelingClosed : C.fireExplosionModeling
  toxicExposureModelingClosed : C.toxicExposureModeling
  escalationAnalysisClosed : C.escalationAnalysis

def ConsequenceAnalysisClosed {D : ProcessSafetyDomain} {I : InherentSafetyPackage D} {H : HAZOP_LOPAPackage I} (C : ConsequenceAnalysisPackage H) : Prop :=
  C.sourceTermModeling ∧ C.dispersionModeling ∧ C.fireExplosionModeling ∧ C.toxicExposureModeling ∧ C.escalationAnalysis

theorem consequence_analysis_closed_from_evidence
    {D : ProcessSafetyDomain} {I : InherentSafetyPackage D} {H : HAZOP_LOPAPackage I} (C : ConsequenceAnalysisPackage H) (E : ConsequenceAnalysisEvidence C) :
    ConsequenceAnalysisClosed C := by
  exact And.intro E.sourceTermModelingClosed
    (And.intro E.dispersionModelingClosed
      (And.intro E.fireExplosionModelingClosed
        (And.intro E.toxicExposureModelingClosed E.escalationAnalysisClosed)))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
