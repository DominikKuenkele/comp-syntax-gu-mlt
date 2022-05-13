--# -path=.:../abstract
concrete MicroLangSwedish of MicroLang = open MicroResSwedish, Prelude in {

-----------------------------------------------------
---------------- Grammar part -----------------------
-----------------------------------------------------
lincat
  N = Noun ;

-----------------------------------------------------
---------------- Lexicon part -----------------------
-----------------------------------------------------
lin car_N = mkN "bil" "bilen" "bilar" "bilarna" Comm ;

-----------------------------------------------------
---------------- Paradigms part ---------------------
-----------------------------------------------------
oper
  mkN = overload {
      mkN : Str -> Str -> Str -> Str -> Gender -> Noun
        = \sg_indef,sg_def,pl_indef,pl_def,gender 
          -> lin N (mkNoun sg_indef sg_def pl_indef pl_def gender) ;
  } ;

}