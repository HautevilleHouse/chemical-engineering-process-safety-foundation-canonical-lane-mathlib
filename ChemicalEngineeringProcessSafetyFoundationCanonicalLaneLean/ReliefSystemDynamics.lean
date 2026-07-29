import HautevilleHouse.ChemicalEngineeringProcessSafetyFoundation.ThermodynamicSafetyPackage

namespace HautevilleHouse
namespace ChemicalEngineeringProcessSafetyFoundation

structure ReliefSystemPackage (T : ThermodynamicSafetyPackage) where
  overpressureScenario : Prop
  reliefValveSizing : Prop
  dynamicDischarge : Prop
  containmentBoundary : Prop

structure ReliefSystemEvidence {T : ThermodynamicSafetyPackage} (R : ReliefSystemPackage T) where
  overpressureScenarioClosed : R.overpressureScenario
  reliefValveSizingClosed : R.reliefValveSizing
  dynamicDischargeClosed : R.dynamicDischarge
  containmentBoundaryClosed : R.containmentBoundary

def ReliefSystemClosed {T : ThermodynamicSafetyPackage} (R : ReliefSystemPackage T) : Prop :=
  R.overpressureScenario ∧ R.reliefValveSizing ∧ R.dynamicDischarge ∧ R.containmentBoundary

theorem relief_system_closed_from_evidence {T : ThermodynamicSafetyPackage} (R : ReliefSystemPackage T) (E : ReliefSystemEvidence R) : ReliefSystemClosed R :=
  And.intro E.overpressureScenarioClosed (And.intro E.reliefValveSizingClosed (And.intro E.dynamicDischargeClosed E.containmentBoundaryClosed))

end ChemicalEngineeringProcessSafetyFoundation
end HautevilleHouse
