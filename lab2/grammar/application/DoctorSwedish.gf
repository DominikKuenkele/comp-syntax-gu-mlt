concrete DoctorSwedish of Doctor =
  open
    SyntaxSwe,
    ParadigmsSwe,
    Prelude
  in {

-- application using standard RGL

lincat
  Phrase = Utt ;
  Fact = Cl ;
  Action = VP ;
  Property = VP ;
  Profession = CN ;
  Person = NP ;
  Place = {at,to : Adv} ;
  Substance = NP ;
  Illness = NP ;

lin
  presPosPhrase fact = mkUtt (mkS fact) ;
  presNegPhrase fact = mkUtt (mkS negativePol fact) ;
  pastPosPhrase fact = mkUtt (mkS anteriorAnt fact) ;
  pastNegPhrase fact = mkUtt (mkS anteriorAnt negativePol fact) ;
  presQuestionPhrase fact = mkUtt (mkQS (mkQCl fact)) ;
  pastQuestionPhrase fact = mkUtt (mkQS anteriorAnt (mkQCl fact)) ;

  impPosPhrase action = mkUtt (mkImp action) ;
  impNegPhrase action = mkUtt negativePol (mkImp action) ;

  actionFact person action = mkCl person action ;
  propertyFact person property = mkCl person property ;

  isProfessionProperty profession = mkVP (mkNP a_Det profession) ;
  needProfessionProperty profession = mkVP need_V2 (mkNP a_Det profession) ;
  isAtPlaceProperty place = mkVP place.at ;
  haveIllnessProperty illness = mkVP have_V2 illness ;

  theProfessionPerson profession = mkNP the_Det profession ;

  iMascPerson = i_NP ;
  iFemPerson = i_NP ;
  youMascPerson = you_NP ;
  youFemPerson = you_NP ;
  hePerson = he_NP ;
  shePerson = she_NP ;

  goToAction place = mkVP (mkVP go_V) place.to ;
  stayAtAction place = mkVP (mkVP stay_V) place.at ;
  vaccinateAction person = mkVP vaccinate_V2 person ;
  examineAction person = mkVP examine_V2 person ;
  takeSubstanceAction substance = mkVP take_V2 substance ;

-- end of what could be a functor
--------------------------------

  coughAction = mkVP (mkV "hosta") ;
  breatheAction = mkVP (mkV "andas") ;
  vomitAction = mkVP (mkV "kräkas") ;
  sleepAction = mkVP (mkV "sova" "sovit" "sov") ;
  undressAction = reflexiveVP (mkV2 dress_V (mkPrep "av")) ;
  dressAction = reflexiveVP (mkV2 dress_V (mkPrep "på")) ;
  eatAction = mkVP (mkV "äta" "ätit" "åt") ;
  drinkAction = mkVP (mkV "dricka" "druckit" "drack") ;
  smokeAction = mkVP (mkV "röka") ;
  measureTemperatureAction = mkVP (mkV2 (mkV "mäter")) (mkNP the_Det (mkN "kroppstemperatur" utrum)) ;
  measureBloodPressureAction = mkVP (mkV2 (mkV "mäter")) (mkNP the_Det (mkN "blodtryck" neutrum)) ;

  hospitalPlace = {at = pAdv "på sjukhuset" ; to = pAdv "till sjukhuset"} ;
  homePlace = {at = pAdv "hemma" ; to = pAdv "hem"} ;
  schoolPlace = {at = pAdv "i skolan" ; to = pAdv "till skolan"} ;
  workPlace = {at = pAdv "på jobbet" ; to = pAdv "till jobbet"} ;

  doctorProfession = mkCN (mkN "doktor" utrum) ;
  nurseProfession = mkCN (mkN "sjuksköterska" utrum) ;
  interpreterProfession = mkCN (mkN "tolk" utrum) ;

  bePregnantProperty = mkVP (mkA "gravid") ;
  beIllProperty = mkVP (mkA "sjuk") ;
  beWellProperty = mkVP (mkVA (mkV "mår")) (mkAP (mkA "bra")) ;
  beDeadProperty = mkVP (mkA "död") ;
  haveAllergiesProperty = mkVP have_V2 (mkNP aPl_Det (mkN "allergi" utrum)) ;
  havePainsProperty = mkVP have_V2 (mkNP aPl_Det (mkN "smärta" utrum)) ;
  haveChildrenProperty = mkVP have_V2 (mkNP aPl_Det (mkN "barn" neutrum)) ;

  feverIllness = mkNP (mkN "feber" utrum) ;
  fluIllness = mkNP (mkN "influense" utrum) ;
  headacheIllness = mkNP (mkN "huvudvärk" utrum) ;
  diarrheaIllness = mkNP (mkN "diarré" utrum) ;
  heartDiseaseIllness = mkNP a_Det (mkN "hjärtsjukdom" utrum) ;
  lungDiseaseIllness = mkNP a_Det (mkN "lungsjukdom" utrum) ;
  hypertensionIllness = mkNP (mkCN (mkA "hög") (mkN "blodtryck" neutrum)) ;

  alcoholSubstance = mkNP (mkN "alkohol" utrum) ;
  medicineSubstance = mkNP a_Det (mkN "medicin" utrum) ;
  drugsSubstance = mkNP aPl_Det (mkN "drog" utrum) ;

oper
  pAdv : Str -> Adv = ParadigmsSwe.mkAdv ;

  go_V = mkV "gå" "gick" ;
  stay_V = mkV "stanna" ;
  need_V2 = mkV2 (mkV "behöva") ;
  take_V2 = mkV2 (mkV "tar") ;
  dress_V = mkV "klär" ;
  put_V2 = mkV2 (mkV "sätta") ;
  vaccinate_V2 = mkV2 (mkV "vaccinera") ;
  examine_V2 = mkV2 (mkV "undersöka") ;

}
