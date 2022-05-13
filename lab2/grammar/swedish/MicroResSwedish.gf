resource MicroResSwedish = open Prelude in {

param
  Number = Sg | Pl ;
  Gender = Comm | Neutr ;
  Case = Nom | Gen ;
  Species = Def | Indef ;

oper
  Noun : Type = {
      s : Number => Species => Str ; 
      g : Gender
  } ;

  mkNoun : Str -> Str -> Str -> Str -> Gender -> Noun 
    = \sg_indef,sg_def,pl_indef,pl_def,gender -> {
      s = table {
          Sg => table { Indef => sg_indef ; Def => sg_def } ; 
          Pl => table { Indef => pl_indef ; Def => pl_def } 
        } ;
      g = gender 
    } ;
} 
