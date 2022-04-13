# Morphological types

|              | NOUN           | ADJ            | VERB           |
|--------------|----------------|----------------|----------------|
| **Gender**   | *inherent*     | *inflectional* | -              |
| **Definite** | *inflectional* | *inflectional* | -              |
| **Number**   | *inflectional* | *inflectional* | -              |
| **Person**   | *inherent*     | -              | -              |
| **Case**     | *inflectional* | *inflectional* | -              |
| **Degree**   | -              | *inflectional* | -              |
| **Tense**    | -              | -              | *inflectional* |
| **Mood**     | -              | -              | *inflectional* |
| **Aspect**   | -              | -              | *inflectional* |
| **Voice**    | -              | -              | *inflectional* |

## Gender
**Values:** common, neuter (, masculine, feminine)

There are two genders in Swedish, the *common* and the *neuter*. There used to be also *masculine* and *feminine* in the past, but they were merged into the *common gender*. For this reason, one can find a few artefacts, where these 'old' genders are still used. 

The noun has an **inherent** gender. This is either *common* or *neuter*. There are some rare cases, where a word can have two genders. The gender hints to a specific meaning of the noun. (e.g. *en öl* means a specific bottle of beer, while *ett öl* refers to a kind/brand of beer)

The adjective needs to agree with the gender of the noun/word it refers to. Often, the suffix *-t* is added to the adjective for the *neuter gender* 

## Definite
**Values:** definite, indefinite

The noun will inflect to the definite feature. The exact inflection depends on the **gender** of the noun and the **number**.
The following table gives an example for two words with a different **gender**:
```
|       indefinite    |       definite     |
| Singular  | Plural  | Singular | Plural  |
+-----------+---------+--------------------+
| ett hus   | hus     | huset    | husen   |
| en bok    | böcker  | boken    | bökerna |
```

Also the adjective will inflect for the *definite*. When it refers to a definite word, its plural form will be used (e.g. den röda bilen)

## Number
**Values:** singular, plural

Both noun and adjective inflect for the **number**. The exact inflection for the noun also depends on the *gender* and the *definite* of the noun. (see table in *Definite*).

The inflection of the adjective depends on the *definite* of the related word. For indefinite words, the adjectice inflects on the **number**, while for definite words, there is usually only one form, independent of the number (usually the plural indefinte form)

## Person 
**Values:** 1st, 2nd, 3rd

The **person** doesn't have any influence on these three parts of speech. Nonetheless, it can be argued that the **person** is an inherent feature of a noun, since it will always be the third person.

## Case
**Values:** nominative, genetive

When the noun is in *genetive*, usually an *-s* is appended to its end.

Also for the adjective, the **case** is an inflectional feature. When it needs to agree to a genetive word, its definite form is used.

## Degree
**Values:** positive, comperative, superlative

The **degree** is an inflectional feature for the adjective. Usually, an the suffices *-re* and *-ast* are added to the positive form of the adjective. Nonetheless, there are exceptions especially for long adjectives. In these cases the adjective does not change itself, but *mer* and *mest* are inserted before the positive form.

Examples:
- snabbt, snabbare, snabbast
- främmande, mer främmande, mest främmande

## Mood
**Value:** indicative, imperative, conjunctive

The **mood** is an inflectional feature for the verb. 
The imperative can only be built in the present tense. It is often build as the infinitve or as the infinitve without the last vowel.

Technically, there also exists a morphological conjunctive. Today, it is usually replaced by constructions with *skulle* (would), which is inserted before the indicative form of the verb. There are only some verbs like *vore* and *finge*, which are inflected for the conjunctive. Therefore, the conjuctive should be mentioned here as an inflectional feature, even though it isn't widely used as such in modern Swedish.

## Tense/Aspect
**Values:** plusquamperfect, perfect, preteritum, present, future

The **tense** is an inflectional feature for the verb.
It is hard to differentiate it from the **aspect**, since there are arguments to include values in both features.

Verbs can be classified in different inflection classes, depending on the rules, how they are built. In the following, I will only give a general rule, what the inflection for each tense/aspect is. 

The preteritum and presens are the only forms, in which only the verb is inflected. All three other forms (plusquamperfect, perfect and future) require additionally an auxilary verb.

The preteritum is build, by adding the suffix *-de* to the infinitve form of the verb. 
Perfect and plusquamperfect use the *supinum* form of the verb (usually the suffix *-t* to the infinitve) with a preceding *har* or *hade* (preteritum of *har*). 
The future form is using the auxilary verbs *ska*/*kommer att* and the infintive form of the verb. 

## Voice
**Value:** active, mediopassive

The **voice** is an inflectional feature of the verb. 
Usually, the mediopassive form of a verb is built, by adding the suffix *-s* to the end of the active form.

# Comparison with PUD
The following features were present in the PUD for Swedish:
- **Abbr=Yes**
- Case=Acc
- Case=Gen
- Case=Nom
- Definite=Def
- Definite=Ind
- Degree=Cmp
- Degree=Pos
- Degree=Sup
- **Foreign=Yes**
- Gender=Com
- Gender=Masc
- Gender=Neut
- Mood=Imp
- Mood=Ind
- Number=Plur
- Number=Sing
- **NumType=Card**
- **NumType=Ord**
- **Polarity=Neg**
- **Poss=Yes**
- **PronType=Art**
- **PronType=Ind**
- **PronType=Int,Rel**
- **PronType=Prs**
- Tense=Past
- Tense=Pres
- VerbForm=Fin
- VerbForm=Inf
- VerbForm=Part
- VerbForm=Sup
- Voice=Act
- Voice=Pass

Most of the features fit to the hypothesis made in the first chapter. There are noentheless some features, which are interesting and need a closer look.
The **gender** feature contains mostly of the *common* or *neuter* gender. But there are still 22 occurences of the masculine gender. These are all adjectives and refer to actual persons.

As excpected, the PUD only contains the *imperative* or *indicative* **mood**. The conjunctive is not used in this corpus.

In the previous chapter, I didn't differentiate between **tense** and **aspect**. The annotation in the corpus actually did use the features **tense** and **VerbForm**. Interestingly, the tense has only *present* and *past* as values. The auxiliary verb in sentences, which use the future (*ska* or *kommer att*) are annotated as present. The reason for that is probably that the verb form is the present form and there is no 'real' future form of a verb in Swedish.

The feature **person** does not appear in the annotated corpus. This is probably due to the fact that there is no inflection on any POS for the person in Swedish.

***

Furthermore, there appear some more features, which I didn't mention in the previous chapter (marked in bold).
There are e.g. the **polarity** which is only annotated for the negations *inte* and *ej* or a feature that marks **abbreviations**.  
Also, there is a feature, which annotates the exact type of the pronouns.