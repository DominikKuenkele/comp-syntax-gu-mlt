resource MicroResSwedish = open Prelude in {

param
  Number = Singular | Plural ;
  Gender = Common | Neuter ;
  Case = Nominative | Accusative | Genitive ;
  Species = Definite | Indefinite ;
  Degree = Positive | Comparative | Superlative ;
  Voice = Active | Passive ;

  VerbForm = VI VInf | VF VFin ;
  VInf = Infinitive Voice | Supine Voice | Imperative ; 
  VFin = Present Voice | Past Voice ;

  Art = Article | NoArticle ;

oper
  Noun : Type = {
      s : Number => Species => Case => Str ; 
      g : Gender ;
      a : Art
  } ;

  mkNoun1 : Str -> Gender -> Noun
    = \sg_indef,gender -> case gender of {
      Neuter => case sg_indef of {
        x + "en" => mkNoun4 sg_indef (x + "net") sg_indef (x + "nen") gender ;
        _        => mkNoun4 sg_indef (sg_indef + "et") sg_indef (sg_indef + "en") gender
      } ;
      Common  =>  case sg_indef of {
        x + "a"  => mkNoun2 sg_indef (x + "or") gender ;
        x + "el" => mkNoun2 sg_indef (x + "lar") gender ;
        x + "e"  => mkNoun2 sg_indef (x + "ar") gender ;
        _ + "o"  => mkNoun2 sg_indef (sg_indef + "r") gender ;
        _        => mkNoun2 sg_indef (sg_indef + "ar") gender
      }
    } ;
  
  mkNoun2 : Str -> Str -> Gender -> Noun
    = \sg_indef,pl_indef,gender -> case gender of {
      Neuter => case sg_indef of {
        _ + "e" => mkNoun4 sg_indef (sg_indef + "t") pl_indef (pl_indef + "a") gender ;
        _       => mkNoun4 sg_indef (sg_indef + "et") pl_indef (pl_indef + "na") gender
      } ;
      Common => case sg_indef of {
        _ + ("r"|"a"|"el"|"e"|"o"|"å") => mkNoun4 sg_indef (sg_indef + "n") pl_indef (pl_indef + "na") gender ;
        _                              => mkNoun4 sg_indef (sg_indef + "en") pl_indef (pl_indef + "na") gender
      }
    } ;

  mkNoun4 : Str -> Str -> Str -> Str -> Gender -> Noun 
    = \sg_indef,sg_def,pl_indef,pl_def,gender -> {
      s = table {
          Singular => table {
            Indefinite => table {
              Genitive => case sg_indef of {
                _ + "s" => sg_indef ;
                _ => sg_indef + "s"
              } ;
              _ => sg_indef
            } ; 
            Definite   => table {
              Genitive => case sg_def of {
                _ + "s" => sg_def ;
                _ => sg_def + "s"
              } ;
              _ => sg_def
            }
          } ; 
          Plural => table {
            Indefinite => table {
              Genitive => case pl_indef of {
                _ + "s" => pl_indef ;
                _ => pl_indef + "s"
              } ;
              _ => pl_indef
            } ;
            Definite   => table {
              Genitive => case pl_def of {
                _ + "s" => pl_def ;
                _ => pl_def + "s"
              } ;
              _ => pl_def
            }  
          } 
        } ;
      g = gender ;
      a = NoArticle
    } ;


  Adjective : Type = {
      s : Degree => Number => Gender => Species => Str ; 
  } ;

  mkAdjective1 : Str -> Adjective
    = \pos_comm -> case pos_comm of {
      x =>  mkAdjective2 pos_comm (x + "t")
    } ;

  mkAdjective2 : Str -> Str -> Adjective
    = \pos_comm,second -> case second of {
      x + "re" => mkAdjective4 pos_comm (pos_comm + "t") (pos_comm + "a") second ;
      _        => mkAdjective7 pos_comm second (pos_comm + "a") (pos_comm + "a") (pos_comm + "are") (pos_comm + "ast") (pos_comm + "aste")
    } ;

  mkAdjective4 : Str -> Str -> Str -> Str -> Adjective
    = \pos_comm,pos_neutr,pos_plu,comp -> case comp of {
      "mer " + x => mkAdjective7 pos_comm pos_neutr pos_plu pos_plu comp ("mest " ++ x) ("mest " ++ x) ;
      x + "re"   => mkAdjective7 pos_comm pos_neutr pos_plu pos_plu comp (x + "st") (x + "sta")
    } ;

  mkAdjective6 : Str -> Str -> Str -> Str -> Str -> Str -> Adjective
    = \pos_comm,pos_neutr,pos_plu,def_plu,comp,sup_indef -> 
      mkAdjective7 pos_comm pos_neutr pos_plu def_plu comp sup_indef (sup_indef + "a")
    ;

  mkAdjective7 : Str -> Str -> Str -> Str -> Str -> Str -> Str -> Adjective
    = \pos_comm,pos_neutr,pos_plu,def_plu,comp,sup_indef,sup_def -> {
      s = table {
        Positive => table {
          Singular => table {
            Common  => table {
              Definite => def_plu ;
              Indefinite => pos_comm
            } ;
            Neuter => table {
              Definite => def_plu ;
              Indefinite => pos_neutr
            }
          } ;
          Plural => table {
            _ => table {
              Definite => def_plu ;
              Indefinite => pos_plu
            }
          }
        } ;
        Comparative => table {
          _ => table {
            _ => table {
              _ => comp
            }
          }
        } ;
        Superlative => table {
          _ => table {
            _=> table {
              Indefinite => sup_indef ;
              Definite => sup_def
            }
          }
        }
      }
    } ;


  Verb : Type = {
    s : VerbForm => Str ;
    p : Particle
  } ;

  Verb2 : Type = Verb ** {c : Str} ;

  mkVerb1 : Str -> Verb 
    = \inf -> mkVerb6 inf (inf + "t") inf (inf + "r") (inf + "de") (inf + "s");
  
  mkVerb2 : Str -> Str -> Verb 
    = \inf,past -> case inf of {
      x + "a" => case x of {
        _ + "s" => mkVerb6 inf (x + "t") x (x + "er") past (x + "es") ;
        _       => mkVerb6 inf (x + "t") x (x + "er") past (x + "s")
      } ;
      _       => mkVerb6 inf (inf + "tt") inf (inf + "r") past (inf + "s")
    } ;

  mkVerb3 : Str -> Str -> Str -> Verb 
    = \inf,sup,past -> case inf of {
      _ + "a" => mkVerb6 inf sup (init inf) ((init inf) + "er") past ((init inf) + "s") ;
      _       => mkVerb6 inf sup inf (inf + "r") past (inf + "s")
    } ; 

  mkVerb6 : Str -> Str -> Str -> Str -> Str -> Str -> Verb
    = \inf,supine,imp,pres,past,pres_pass -> {
      s = table {
        VI (Infinitive Active) => inf ;
        VI (Infinitive Passive) => (inf + "s") ;
        VI (Supine Active) => supine ;
        VI (Supine Passive) => (supine + "s") ;
        VI (Imperative) => imp ;
        VF (Present Active) => pres ;
        VF (Present Passive) => pres_pass ;
        VF (Past Active) => past ;
        VF (Past Passive) => (past + "s")
      } ;
      p = mkParticle ""
    } ;

    
  Pronoun : Type = {
    s : Case => Str ;
    n : Number
  } ;

  mkPronoun : Str -> Str -> Str -> Number -> Pronoun
    = \nom,acc,gen,number -> {
      s = table {
        Nominative => nom ;
        Accusative => acc ;
        Genitive => gen
      } ;
      n = number
    } ;

  Particle : Type = {
    s : Str
  } ;

  mkParticle : Str -> Particle
    = \part -> {
      s = part
    } ;
}