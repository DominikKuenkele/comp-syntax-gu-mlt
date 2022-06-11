# Evaluation
## English
```bash
❯ cat English_tagged_corpus.txt | gf-ud dbnf English_nolex.dbnf Utt > English.conllu
❯ gf-ud eval macro LAS ../assignment_3/english.conllu English.conllu
evaluating macro LAS ../assignment_3/english.conllu English.conllu
UDScore {udScore = 0.6616381642073342, udMatching = 22, udTotalLength = 307, udSamesLength = 199, udPerfectMatch = 2}
```

## Swedish
```bash
❯ cat Swedish_tagged_corpus.txt | gf-ud dbnf Swedish_nolex.dbnf Utt > Swedish.conllu
❯ gf-ud eval macro LAS ../assignment_3/swedish.conllu Swedish.conllu
evaluating macro LAS ../assignment_3/swedish.conllu Swedish.conllu
UDScore {udScore = 0.5869486178309707, udMatching = 24, udTotalLength = 295, udSamesLength = 171, udPerfectMatch = 2}
```