 
# Notes
## english
**sent_id 5, 8:** I would relate the comma to the second complementary, since it wouldn't be there without it. The 'official' annotations relate it to the first complementary.

**sent_id 7, 9:** The comma should be in my opinion outside the quotation mark (as it is in the Swedish translation). In that case it would relate to the verb *said* outside the parataxis.

**sent_id 21, 11-14:** I had a problem with the tokenization. In the end, I decided *first-aid kit' into four tokens and relate them with the *compound* marker. Instead, I also could have taken *first-aid* as one token (tagged as *ADJ*) and related it with a *compound* dependency to *kit*. Nonetheless, it seemed more consistent to me, to split down all tokens to the smallest units.

## swedish
The translations to Swedish were in general not easy, since certain words, phrases or sentence constructions don't exist exactly like that in Swedish. In these cases, I tried to be as close as possible, but often the sentence structure changed, which had an impact on the dependencies.

**sent_id 5:** This sentence was difficult to translate, since it is describing a specific problem in English. In the end, I translated it in a syntactical correct way, but the semantic meaning got lost (also done in 'original' annotation)

**sent_id 10, 7-8:** Interestingly, the translation to Swedish changes the dependency from a *xcomp* in English to an *advcl* in Swedish. The reason is the *gerund* verb in English, which does not exist in Swedish.

**sent_id 11, 15:** The Swedish translation needs the word 'det', while English can ommit it. This adds the implicit dependency *obj* in Swedish.

**sent_id 19:** The part 'this chit of a girl' was hard to translate to Swedish, especially as a non-native speaker. In the end, I just translated it as 'flickan' (the girl).