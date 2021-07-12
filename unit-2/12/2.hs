type FirstName = String
type LastName = String
type Age = Int
type Height = Int
data Sex = Male | Female
showSex :: Sex -> String
showSex Male = "M"
showSex Female = "F"

data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType

type MiddleName = String
data Name = Name FirstName LastName
  | NameWithMiddle FirstName MiddleName LastName

data Patient = Patient { name :: Name
 , sex :: Sex
 , age :: Age
 , height :: Height
 , weight :: Int
 , bloodType :: BloodType }

canDonateTo :: BloodType -> BloodType -> Bool
canDonateTo (BloodType O _) _ = True
canDonateTo _ (BloodType AB _) = True
canDonateTo (BloodType A _) (BloodType A _) = True
canDonateTo (BloodType B _) (BloodType B _) = True
canDonateTo _ _ = False --otherwise

jackieSmith = Patient {name = Name "Jackie" "Smith"
, age = 43
, sex = Female
, height = 62
, weight = 115
, bloodType = BloodType O Neg }

michaelOld = Patient {name = Name "Michael" "Old"
, age = 28
, sex = Male
, height = 70
, weight = 90
, bloodType = BloodType AB Pos }


donorFor :: Patient -> Patient -> Bool
donorFor p1 p2 = canDonateTo (bloodType p1) (bloodType p2)

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"
showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"
showBloodType :: BloodType -> String
showBloodType (BloodType abo rh) = showABO abo ++ showRh rh

-- NOTE: use putStr to output to the console without escaping '\n'
patientSummary :: Patient -> String
patientSummary patient = "**************\n" ++
  "Sex: " ++ showSex (sex patient) ++ "\n" ++
  "Age: " ++ show (age patient) ++ "\n" ++
  "Height: " ++ show (height patient) ++ " in.\n" ++
  "Weight: " ++ show (weight patient) ++ " lbs.\n" ++
  "Blood Type: " ++ showBloodType (bloodType patient) ++
  "\n**************\n"
