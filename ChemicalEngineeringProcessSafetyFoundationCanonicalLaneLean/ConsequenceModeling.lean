import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure ConsequenceModelingPackage where
  sourceTermModel : Prop
  dispersionModel : Prop
  fireExplosionModel : Prop
  toxicEffectsModel : Prop

structure ConsequenceModelingEvidence (C : ConsequenceModelingPackage) where
  sourceTermModelClosed : C.sourceTermModel
  dispersionModelClosed : C.dispersionModel
  fireExplosionModelClosed : C.fireExplosionModel
  toxicEffectsModelClosed : C.toxicEffectsModel

def ConsequenceModelingClosed (C : ConsequenceModelingPackage) : Prop :=
  C.sourceTermModel ∧ C.dispersionModel ∧ C.fireExplosionModel ∧ C.toxicEffectsModel

theorem consequence_modeling_closed_from_evidence
    (C : ConsequenceModelingPackage) (E : ConsequenceModelingEvidence C) :
    ConsequenceModelingClosed C := by
  exact And.intro E.sourceTermModelClosed
    (And.intro E.dispersionModelClosed
      (And.intro E.fireExplosionModelClosed E.toxicEffectsModelClosed))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse