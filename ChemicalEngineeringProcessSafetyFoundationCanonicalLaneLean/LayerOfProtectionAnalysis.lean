import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure LayerOfProtectionAnalysisPackage where
  independentProtectionLayers : Prop
  initiatingEventFrequency : Prop
  consequenceSeverity : Prop
  riskReductionFactor : Prop

structure LayerOfProtectionAnalysisEvidence (L : LayerOfProtectionAnalysisPackage) where
  independentProtectionLayersClosed : L.independentProtectionLayers
  initiatingEventFrequencyClosed : L.initiatingEventFrequency
  consequenceSeverityClosed : L.consequenceSeverity
  riskReductionFactorClosed : L.riskReductionFactor

def LayerOfProtectionAnalysisClosed (L : LayerOfProtectionAnalysisPackage) : Prop :=
  L.independentProtectionLayers ∧ L.initiatingEventFrequency ∧ L.consequenceSeverity ∧ L.riskReductionFactor

theorem layer_of_protection_analysis_closed_from_evidence
    (L : LayerOfProtectionAnalysisPackage) (E : LayerOfProtectionAnalysisEvidence L) :
    LayerOfProtectionAnalysisClosed L := by
  exact And.intro E.independentProtectionLayersClosed
    (And.intro E.initiatingEventFrequencyClosed
      (And.intro E.consequenceSeverityClosed E.riskReductionFactorClosed))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse