# Statistics
## POS
Looking at the comparison of Swedish and English, one can see that the general distribution of POS tags are very similar between these two languages. Nonetheless, there are some major differences. For one, the English corpus contains double the number of determiners than the Swedish corpus. The reason for that is that the Swedish language does not have any definite determiners like *the*. These are instead integrated in the noun itself. Additionally, many of the english determiners are assigned to the pronoun class (for example *de* as translation of *these* or *alla* as translation for *all*).

Furthermore, the English language uses a lot more punctuation, more specifically more commas. While the Swedish corpus contains 623 commas, the English corpus contains 995 commas. The number of full stops are the same, which hints to the fact that English sentences use more commas per sentence.

The third observation is that the English language containes around 400 more proper nouns. Looking at specific examples reveals that these are often words like *English* or *Catholic* which are assigned in Swedish to the adjective class. In other cases, these are compound words like *Nations culture* (two words in English) which is translated to *Nations-kultur*, and assigned to the noun class.

Moreover, English contains more words in the class **AUX**. Here, it was harder, to find the reasons. One seemed to be a different construction of the passive form. While English is using *to be* as an auxiliary verb, Swedish is often using a specific passive form of the verb instead. 

```
   |  SWEDISH          |  ENGLISH
---+-------------------+------------------
1  |  (["NOUN"],4035)  |  (["NOUN"],4036)
2  |  (["ADP"],2448)   |  (["ADP"],2493)
3  |  (["VERB"],1974)  |  (["PUNCT"],2451)
4  |  (["PUNCT"],1941) |  (["VERB"],2156)
5  |  (["ADJ"],1561)   |  (["DET"],2086)
6  |  (["PRON"],1318)  |  (["PROPN"],1741)
7  |  (["PROPN"],1216) |  (["ADJ"],1530)
8  |  (["DET"],1021)   |  (["PRON"],1021)
9  |  (["ADV"],1019)   |  (["AUX"],1014)
10 |  (["AUX"],732)    |  (["ADV"],849)
11 |  (["CCONJ"],638)  |  (["CCONJ"],576)
12 |  (["PART"],414)   |  (["NUM"],455)
13 |  (["NUM"],402)    |  (["PART"],426)
14 |  (["SCONJ"],364)  |  (["SCONJ"],290)
15 |  (["INTJ"],1)     |  (["SYM"],42)
16 |  (["SYM"],1)      |  (["X"],16)
17 |                   |  (["INTJ"],1)
```
## DEPREL
As for the **POS**, the **DEPREL** of Swedish looks quiet similar to English. Some differences can already be explained with the same reasons as in the **POS** (for example the punctuation or determiners).

One interesting difference is the dependency label for compound words. There are over 800 *compound* labels for the English corpus. In Swedish, compound words don't exist or are rather concatenated to one word.

Furthermore, there is a big difference in the *mark* labels. When looking at the specific examples, it can be seen that often in English the gerund form is used instead of the infinitive and a preceding *to* (which only is used in Swedish). This results in a higher usage of the *to/att* in Swedish, which is labeled as *mark* dependency.
> **Swedish:** 
> [...] resulterade i *att man gav* upp planen [...]
> 
> **English:**
> [...] resulted in *giving* up the invasion plan [...]

```
   |  SWEDISH              |  ENGLISH
---+-----------------------+--------------------
1  |  (["case"],2158)      |  (["case"],2499)
2  |  (["punct"],1941)     |  (["punct"],2451)
3  |  (["nsubj"],1511)     |  (["det"],2047)
4  |  (["obl"],1287)       |  (["nsubj"],1393)
5  |  (["amod"],1235)      |  (["amod"],1336)
6  |  (["nmod"],1089)      |  (["obl"],1237)
7  |  (["det"],1017)       |  (["nmod"],1076)
8  |  (["root"],1000)      |  (["root"],1000)
9  |  (["advmod"],912)     |  (["obj"],876)
10 |  (["obj"],900)        |  (["advmod"],852)
11 |  (["mark"],867)       |  (["compound"],810)
12 |  (["conj"],650)       |  (["conj"],634)
13 |  (["cc"],595)         |  (["cc"],574)
14 |  (["nmod:poss"],461)  |  (["mark"],555)
15 |  (["aux"],369)        |  (["aux"],410)
16 |  (["cop"],343)        |  (["nmod:poss"],365)
17 |  (["advcl"],337)      |  (["cop"],316)
18 |  (["acl:relcl"],300)  |  (["advcl"],293)
19 |  (["nummod"],275)     |  (["aux:pass"],274)
20 |  (["nsubj:pass"],254) |  (["xcomp"],271)
```

# Word Alignments
Looking at the word alignments of English and Swedish, it can be seen that the syntax is very similar. The word order is the same in both languages for these examples. The only difference in the first sentence is the determiner. In Swedish, the definite determiner is a suffix in the noun, which results in one less word in the sentence. 