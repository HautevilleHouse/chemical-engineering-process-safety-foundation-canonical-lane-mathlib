import ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean.ProcessSafetyDomain

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean

structure InherentSafetyPackage (D : ProcessSafetyDomain) where
  minimization : Prop
  substitution : Prop
  moderation : Prop
  simplification : Prop

structure InherentSafetyEvidence {D : ProcessSafetyDomain} (I : InherentSafetyPackage D) where
  minimizationClosed : I.minimization
  substitutionClosed : I.substitution
  moderationClosed : I.moderations
  simplificationClosed : I.simplification

def InherentSafetyClosed {D : ProcessSafetyDomain} (I : InherentSafetyPackage D) : Prop :=
  I.minimization ∧ I.substitution ∧ I.moderations ∧ I.simplification

theorem inherent_safety_closed_from_evidence
    {D : ProcessSafetyDomain} (I : InherentSafetyPackage D) (E : InherentSafetyEvidence I) :
    InherentSafetyClosed I := by
  exact And.intro E.minimizationClosed
    (And.intro E.substitutionClosed
      (And.intro E.moderationsClosed E.simplificationClosed))

end ChemicalEngineeringProcessSafetyFoundationCanonicalLaneLean
end HautevilleHouse
