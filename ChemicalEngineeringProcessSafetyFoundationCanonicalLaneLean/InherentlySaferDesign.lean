import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure InherentlySaferDesignPackage where
  minimization : Prop
  substitution : Prop
  moderation : Prop
  simplification : Prop

structure InherentlySaferDesignEvidence (I : InherentlySaferDesignPackage) where
  minimizationClosed : I.minimization
  substitutionClosed : I.substitution
  moderationClosed : I.moderationsimplificationClosed? Let's correct: I.moderation
  simplificationClosed : I.simplification

def InherentlySaferDesignClosed (I : InherentlySaferDesignPackage) : Prop :=
  I.minimization ∧ I.substitution ∧ I.moderation ∧ I.simplification

theorem inherently_safer_design_closed_from_evidence
    (I : InherentlySaferDesignPackage) (E : InherentlySaferDesignEvidence I) :
    InherentlySaferDesignClosed I := by
  exact And.intro E.minimizationClosed
    (And.intro E.substitutionClosed
      (And.intro E.moderationClosed E.simplificationClosed))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse