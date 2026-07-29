import ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean.InherentSafety

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure HAZOP_LOPAPackage {D : ProcessSafetyDomain} (I : InherentSafetyPackage D) where
  hazardIdentificationSystematic : Prop
  guideWordsApplied : Prop
  deviationAnalysis : Prop
  independentProtectionLayers : Prop
  riskReductionFactor : Prop

structure HAZOP_LOPAEvidence {D : ProcessSafetyDomain} {I : InherentSafetyPackage D} (H : HAZOP_LOPAPackage I) where
  hazardIdentificationSystematicClosed : H.hazardIdentificationSystematic
  guideWordsAppliedClosed : H.guideWordsApplied
  deviationAnalysisClosed : H.deviationAnalysis
  independentProtectionLayersClosed : H.independentProtectionLayers
  riskReductionFactorClosed : H.riskReductionFactor

def HAZOP_LOPAClosed {D : ProcessSafetyDomain} {I : InherentSafetyPackage D} (H : HAZOP_LOPAPackage I) : Prop :=
  H.hazardIdentificationSystematic ∧ H.guideWordsApplied ∧ H.deviationAnalysis ∧ H.independentProtectionLayers ∧ H.riskReductionFactor

theorem hazop_lopa_closed_from_evidence
    {D : ProcessSafetyDomain} {I : InherentSafetyPackage D} (H : HAZOP_LOPAPackage I) (E : HAZOP_LOPAEvidence H) :
    HAZOP_LOPAClosed H := by
  exact And.intro E.hazardIdentificationSystematicClosed
    (And.intro E.guideWordsAppliedClosed
      (And.intro E.deviationAnalysisClosed
        (And.intro E.independentProtectionLayersClosed E.riskReductionFactorClosed)))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
