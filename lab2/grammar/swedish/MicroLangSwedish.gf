--# -path=.:../abstract
concrete MicroLangSwedish of MicroLang = open MicroResSwedish, Prelude in {

-----------------------------------------------------
---------------- Grammar part -----------------------
-----------------------------------------------------
lincat
  Utt = {s : Str} ;
  S = {s : Str} ;
  NP = {s : Case => Str ; n : Number ; g : Gender} ;
  VP = {verb : Verb ; compl : Degree => Number => Gender => Str} ;
  Adv = {s : Str} ;

  N = Noun ;
  A = Adjective ;
  V = Verb ;
  V2 = Verb2 ;
  Adv = {s : Str} ;
  Prep = {s : Str} ;
  Det = {s : Gender => Art => Str ; n : Number ; sp : Species} ;
  Pron = Pronoun ;

  CN = Noun ;
  AP = Adjective ;
  Comp = Adjective ;


lin
-- Phrase
  UttS s = s ;
  UttNP np = {s = np.s ! Accusative} ;

-- Sentence
  PredVPS np vp = {
    s = np.s ! Nominative ++ vp.verb.s ! (VF (Present Active)) ++ vp.compl ! Positive ! np.n ! np.g
  } ;

-- Verb
  UseV v = {
    verb = v ;
    compl = table {
      d => table {
        n => table {
          g => ""
        }
      }
    }
  } ;

  ComplV2 v np = {
    verb = v ;
    compl = table {
      d => table {
        n => table {
          g => v.p.s ++ v.c ++ np.s ! Accusative
        }
      }
    }
  } ;


  UseComp compl = {
    verb = be_Verb ;
    compl = table {
      d => table {
        n => table {
          g => compl.s ! d ! n ! g ! Indefinite
        }
      }
    }
  } ;

  CompAP ap = ap ;

  AdvVP vp adv = {
    verb = vp.verb ;
    compl = table {
      d => table {
        n => table {
          g => vp.compl ! d ! n ! g ++ adv.s
        }
      }
    }
  } ;


-- Noun
  DetCN det cn = {
    s = table {
      c => det.s ! cn.g ! cn.a ++ cn.s ! det.n ! det.sp ! c
    } ;
    n = det.n ; 
    g = cn.g
  } ;

  UsePron p = {
    s = table {
      c => p.s ! c
    } ;
    n = p.n ;
    g = Common
  } ;

  UseN n = n ;

  -- TODO Degree
  AdjCN ap cn = {
    s = table {
      n => table {
        sp => table {
          c => ap.s ! Positive ! n ! cn.g ! sp ++ cn.s ! n ! sp ! c
        } 
      }
    } ;
    g = cn.g ;
    a = Article
  } ;

  a_Det = {
    s = table {
      Common => table {
        _ => "en"
      } ;
      Neuter => table {
        _ => "ett"
      }
    } ;
    n = Singular ;
    sp = Indefinite
  } ;

  aPl_Det = {
    s = table {
      _ => table {
        _ => ""
      }
    } ;
    n = Plural ;
    sp = Indefinite
  } ;

  the_Det = {
    s = table {
      Common => table {
        Article => "den" ;
        NoArticle => ""
      } ;
      Neuter => table {
        Article => "det" ;
        NoArticle => ""
      }
    } ;
    n = Singular ;
    sp = Definite
  } ;

  thePl_Det = {
    s = table {
      _ => table {
        Article => "de" ;
        NoArticle => ""
      }
    } ;
    n = Plural ;
    sp = Definite
  } ;

-- Adjective
  PositA a = a ;

-- Adverb
  PrepNP prep np = {
    s = prep.s ++ np.s ! Accusative
  } ;

-- Structural
  he_Pron = mkPron "han" "honom" "hans" Singular ;
  she_Pron = mkPron "hon" "henne" "hennes" Singular ;
  they_Pron = mkPron "de" "dem" "deras" Plural ;

  in_Prep = mkPrep "i" ;
  on_Prep = mkPrep "på" ;
  with_Prep = mkPrep "med" ;



-----------------------------------------------------
---------------- Lexicon part -----------------------
-----------------------------------------------------
-- Nouns
lin animal_N = mkN "djur" Neuter ;
lin apple_N = mkN "äpple" "äpplen" Neuter ;
lin baby_N = mkN "bebis" Common ;
lin beer_N = mkN "öl" Neuter ;
lin bike_N = mkN "cykel" Common ;
lin bird_N = mkN "fågel" Common ;
lin blood_N = mkN "blod" nonExist Neuter ; -- only singular
lin boat_N = mkN "båt" Common ;
lin book_N = mkN "bok" "böcker" Common ;
lin boy_N = mkN "pojke" Common ;
lin bread_N = mkN "bröd" Neuter ;
lin car_N = mkN "bil" Common ;
lin cat_N = mkN "katt" "katter" Common ;
lin child_N = mkN "barn" Neuter ;
lin city_N = mkN "stad" "städer" Common ;
lin cloud_N = mkN "moln" Neuter ;
lin computer_N = mkN "dator" "datorer" Common ;
lin cow_N = mkN "ko" Common;
lin dog_N = mkN "hund" Common ;
lin fire_N = mkN "eld" Common ;
lin fish_N = mkN "fisk" Common ;
lin flower_N = mkN "blomma" Common ;
lin friend_N = mkN "vän" "vännen" "vänner" "vännerna" Common ;
lin girl_N = mkN "flicka" Common ;
lin grammar_N = mkN "grammatik" "grammatiker" Common ;
lin horse_N = mkN "häst" Common ;
lin house_N = mkN "hus" Neuter ;
lin language_N = mkN "språk" Neuter ;
lin man_N = mkN "man" "mannen" "män" "männen" Common ;
lin milk_N = mkN "mjölk" "mjölket" nonExist nonExist Common; -- only singular
lin music_N = mkN "musik" nonExist Common ; -- only singular
lin river_N = mkN "å" Common ;
lin sea_N = mkN "hav" Neuter ;
lin ship_N = mkN "skepp" Neuter ;
lin star_N = mkN "stjärna" Common ;
lin train_N = mkN "tåg" Neuter ;
lin tree_N = mkN "träd" Neuter ;
lin water_N = mkN "vatten" Neuter ;
lin wine_N = mkN "vin" "viner" Neuter ;
lin woman_N = mkN "kvinna" Common ;

-- Adjectives
lin bad_A = mkA "dålig" "sämre" ;
lin big_A = mkA "stor" "större" ;
lin black_A = mkA "svart" "svart" ;
lin blue_A = mkA "blå" "blått" ;
lin clean_A = mkA "ren" ;
lin clever_A = mkA "klok" ;
lin cold_A = mkA "kall" ;
lin dirty_A = mkA "smutsig" ;
lin good_A = mkA "god" "gott" ;
lin green_A = mkA "grön" ;
lin heavy_A = mkA "tung" "tyngre" ;
lin hot_A = mkA "het" ;
lin new_A = mkA "ny" "nytt" ;
lin old_A = mkA "gammal" "gammalt" "gamla" "äldre" ;
lin ready_A = mkA "färdig" ;
lin red_A = mkA "röd" "rött" ;
lin small_A = mkA "liten" "litet" "små" "lilla" "mindre" "minst" ;
lin warm_A = mkA "varm" ;
lin white_A = mkA "vit" ;
lin yellow_A = mkA "gul" ;
lin young_A = mkA "ung" "yngre" ;

-- Verbs
lin break_V2 = mkV2 (mkV "slå" "slagit" "slog") "sönder";
lin buy_V2 = mkV2 (mkV "köpa" "köpte") ;
lin come_V = mkV "komma" "kommit" "kom" ; -- not working perfectly
lin drink_V2 = mkV2 (mkV "dricka" "druckit" "drack") ;
lin eat_V2 = mkV2 (mkV "äta" "ätit" "åt") ;
lin find_V2 = mkV2 (mkV "finna" "funnit" "fann") ;
lin go_V = mkV "gå" "gick" ;
lin jump_V = mkV "hoppa" ;
lin kill_V2 = mkV2 (mkV "döda") ;
lin live_V = mkV "leva" "levde";
lin love_V2 = mkV2 (mkV "älska") ;
lin play_V = mkV "leka" "lekte" ;
lin read_V2 = mkV2 (mkV "läsa" "läste") ;
lin run_V = mkV "springa" "sprungit" "sprang" ;
lin see_V2 = mkV2 (mkV "se" "såg") ;
lin sleep_V = mkV "sova" "sovit" "sov" ;
lin swim_V = mkV "simma" ;
lin teach_V2 = mkV2 (mkV "undervisa") ;
lin travel_V = mkV "resa" "reste" ;
lin understand_V2 = mkV2 (mkV "förstå" "förstod") ;
lin wait_V2 = mkV2 (mkV "vänta") (mkParticle "på") ;
lin walk_V = go_V ;

oper be_Verb : Verb = mkV "vara" "varit" "var" "är" "var" "" ;

-- Adverbs
lin already_Adv = mkAdv "redan" ;
lin now_Adv = mkAdv "nu" ;

-----------------------------------------------------
---------------- Paradigms part ---------------------
-----------------------------------------------------
oper
  mkN = overload {
    mkN : Str -> Gender -> Noun
      = \sg_indef,gender 
        -> lin N (mkNoun1 sg_indef gender) ;
    mkN : Str -> Str -> Gender -> Noun
      = \sg_indef,pl_indef,gender 
        -> lin N (mkNoun2 sg_indef pl_indef gender) ;
    mkN : Str -> Str -> Str -> Str -> Gender -> Noun
      = \sg_indef,sg_def,pl_indef,pl_def,gender 
        -> lin N (mkNoun4 sg_indef sg_def pl_indef pl_def gender) ;
  } ;

  mkA = overload {
    mkA : Str -> Adjective
      = \pos_comm
        -> lin A (mkAdjective1 pos_comm) ;
    mkA : Str -> Str -> Adjective
      -- second either pos_neutr or comparative
      = \pos_comm,second
        -> lin A (mkAdjective2 pos_comm second) ;
    mkA : Str -> Str -> Str -> Str -> Adjective
      = \pos_comm,pos_neutr,pos_plu,comp 
        -> lin A (mkAdjective4 pos_comm pos_neutr pos_plu comp) ;
    mkA : Str -> Str -> Str -> Str -> Str -> Str -> Adjective
      = \pos_comm,pos_neutr,pos_plu,def_plu,comp,sup_indef
        -> lin A (mkAdjective6 pos_comm pos_neutr pos_plu def_plu comp sup_indef) ;
  } ;

  mkV = overload {
    mkV : Str -> Verb
      = \inf 
        -> lin V (mkVerb1 inf) ;
    mkV : Str -> Str -> Verb
      = \inf,past
        -> lin V (mkVerb2 inf past) ;
    mkV : Str -> Str -> Str -> Verb
      = \inf,supine,past
        -> lin V (mkVerb3 inf supine past) ;
    mkV : Str -> Str -> Str -> Str -> Str -> Str -> Verb
      = \inf,supine,imp,pres,past,pres_pass
        -> lin V (mkVerb6 inf supine imp pres past pres_pass) ;
  } ;

  mkV2 = overload {
    mkV2 : Verb -> Verb2 
      = \verb -> lin V2 (verb ** {c = []}) ;
    mkV2 : Verb -> Str -> Verb2
      = \verb,comp -> lin V2 (verb ** {c = comp}) ;
    mkV2 : Verb -> Particle -> Verb2
      = \verb,part -> lin V2 (verb ** {p = part ; c = []})
  } ;

  mkAdv : Str -> Adv
    = \adv -> lin Adv {s = adv} ;

  mkPrep : Str -> Prep
    = \prep -> lin Prep {s = prep} ;

  mkPron : Str -> Str -> Str -> Number -> Pronoun
    = \nom,acc,gen,number
      -> lin Pron (mkPronoun nom acc gen number) ;
}