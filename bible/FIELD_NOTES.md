# Field Notes Rubric

Every chapter of *Surviving the AI World* closes its main body with a "field notes" block: a small, numbered list of concrete actions the reader can take in the next week. This file defines what counts as a field-notes item. It prevents the most common failure mode, practical advice drifting into vague exhortation.

This file pairs with `bible/CHAPTER_TEMPLATE.md` §`## Field notes` (shape) and `bible/VOICE.md` (register).

---

## 1. The rule

A field-notes item must meet all three tests:

1. **Testable in under a week** by an individual or small group, working with materials and access most readers already have.
2. **Phrased as an imperative verb + a concrete object.** "Map your water." "Agree a duress phrase." "Cap wire-transfer authority." Not "be aware", not "consider", not "stay informed".
3. **Measurable.** A reader can determine, by Sunday night, whether they did the thing. The outcome is observable.

An item that fails any of the three is not a field-notes item. It is either a Knowledge claim ("most households underestimate X") or a Further-reading pointer ("read Y"), and belongs in those sections instead.

## 2. Format

- Pandoc fenced div with class `field-notes`:
  ````
  ::: field-notes
  1. **Imperative opening clause.** One to three sentences.
  2. ...
  :::
  ````
- **Count:** 5 to 8 numbered items per chapter. Hard ceiling at 8. Fewer than 5 indicates the chapter has not earned its field-notes block; merge with a sibling chapter or expand.
- **Each item:** 1 to 3 sentences. Bold the imperative opening clause. Plain prose afterward.
- **Order:** roughly easiest-to-hardest, or roughly soonest-to-latest in a 7-day window. The first item should be doable tonight.

## 3. Patterns

### Acceptable

- **"Identify three water sources within five kilometres of where you sleep. Walk to each. Note distance, access, and likely contamination risk."**
  Testable (walk, note); imperative + concrete object (water sources, distance); measurable (the notes either exist or they don't).
- **"Agree a family duress phrase tonight. Pick a sentence none of you would say in casual conversation. Use it only when a caller's identity is in doubt."**
  Testable (set a phrase); imperative + concrete object (phrase); measurable (the phrase exists; the family knows it).
- **"Print your three most important documents this week, birth certificate, deed or lease, insurance policy. Store the copies in a sealed envelope outside your home."**
  Testable (print, store); imperative + concrete objects; measurable (the envelope exists at the second location).

### Not acceptable

- **"Be aware of water security."** No verb in the actionable sense. No measurable outcome. Vague.
- **"Live sustainably."** No test. No object. Open-ended.
- **"Consider your options."** No imperative-object pair. The reader cannot know whether they did it.
- **"Reflect on what AI means for your family."** Reflection is not a field-notes action; if reflection produces an artefact (a written list, a household policy), the artefact is the action.
- **"Buy a backup generator."** Fails the "materials most readers already have" test for most readers. If the chapter's economics make this realistic, rephrase: "Price three backup-power options for your household this week and write down which one you would buy at what trigger."

### The reflection test

If an item asks the reader to think, ask: what artefact does the thinking produce? If the answer is "a written list", "a phone call placed", "a meeting held", "a policy agreed in the household", the artefact is the action. Write the field-notes item in terms of the artefact. If the answer is "a feeling" or "an awareness", it is not a field-notes item.

## 4. Worked examples, 5 per Part

These are *examples*, not the actual field-notes the chapters will use. Dossier authors adapt them. Each example is shaped to pass §1.

### Part 1, Baseline (fire, shelter, water, navigation, community)

1. **Map your water.** Identify three sources within five kilometres of where you sleep. Walk to each. Record distance, access, and likely contamination risk in a single page kept with your household documents.
2. **Light one fire without a lighter this week.** Use a ferrocerium rod and natural tinder you gather on the day. If it takes more than ten minutes, practise again on the weekend.
3. **Sleep one night in your emergency shelter.** A tarp, a sleeping bag, the back of a vehicle, whatever your household plan calls for. Find what fails. Fix it before next month.
4. **Walk the route from your home to your work without using a phone or GPS.** Take a printed map. Note where you guessed wrong. Repeat once in the dark.
5. **Learn three neighbours by name and one fact each.** A name, a household, one fact about how they cope under stress. Note them on paper. Greet them by name the next time you pass.

### Part 2, Disruption (current AI incidents)

1. **Agree a family duress phrase tonight.** Pick a sentence none of you would say in casual conversation. Test it on one family member by Sunday with no warning. If they remember it, the phrase is live.
2. **Move three accounts off SMS two-factor authentication this week.** Use an authenticator app or a hardware key. Bank, email, primary social account first.
3. **Cap wire-transfer authority at your bank.** Visit your branch this week. Set a daily ceiling that requires a 24-hour cooling-off period to raise.
4. **Print a paper backup of your password vault recovery codes.** Store one copy outside your home. If your vault provider fails, this is what you have left.
5. **Write a 200-word OPSEC sheet for your household.** Who posts what, when, on which platforms. Include the children's school, your work address, and your travel patterns. Review monthly.

### Part 3, Predictable Future (5–15 year scenarios from policy literature)

1. **Time your last grocery run.** From leaving the house to returning. Note how many days of food the trip bought you. Decide what number you want that to be.
2. **List every supplier your household depends on in one column.** In the second column, list the next-nearest substitute. Note any column 1 entry without a column 2 entry. Those are the ones to work on.
3. **Run a 48-hour grid-down drill this month.** No mains power, no internet, no scheduled deliveries. Use only what you have on hand. Record what failed; fix one thing before the next drill.
4. **Open a second bank account at a different institution.** Move one paycheck's worth into it. Confirm the cards and online access work. Keep both live.
5. **Write down, on one page, what your household would do in the first 72 hours of a regional outage.** Water, food, light, communication, money, neighbours. Share the page with everyone in the household.

### Part 4, Unknown (speculative, per the Part 4 extrapolation rule)

1. **Establish an in-person verification ritual with your three most important contacts.** A code word, a shared memory, a question whose answer is not searchable. Use it whenever a request arrives by digital channel and the stakes are non-trivial.
2. **Identify which of your records exist only in digital form.** Pick the three most important. Produce a paper original this week. Notarise if appropriate.
3. **Hand-copy one document you care about by hand this week.** A poem, a recipe, a passage. Notice what reading-by-copying does that reading does not. Decide which other documents are worth this.
4. **Designate a "no-AI" channel with one trusted person.** A specific phone number, a specific physical meeting place, a specific signal. Use it for decisions you want to make as humans, with humans.
5. **Pick one practical skill your household currently outsources entirely to a screen.** Navigation, arithmetic, recipe scaling, language translation. Practise it without the screen, weekly, for the next month.

### Part 5, Playbook (assembling the 1-week / 1-month / 1-year stacks)

1. **Build the one-week stack this weekend.** Water (14 litres per person), light (one headlamp per person plus spares), communication (a charged radio, paper contact list). Photograph the kit; review monthly.
2. **Build the one-month stack within 30 days.** Add food (2,000 kcal per person per day for 30 days, rotated), cash (one month of expenses in small bills, kept at home), paper records (birth certificates, deeds, insurance, medical, in a sealed envelope).
3. **Pick one skill from the one-year stack and start it this month.** Medical (Stop the Bleed, basic wilderness first aid), mechanical (small-engine repair, basic carpentry), agricultural (one bed of food you actually eat). Schedule the first session by Sunday.
4. **Hold a 60-minute household resilience review every quarter.** What changed in our exposures? What changed in our stack? What did we test? What did we skip? Record decisions on one page.
5. **Identify the two households outside your home you would coordinate with in a hard week.** Tell them. Ask them to do the same. Agree one shared protocol (e.g., "if the cellular network is down for >12 hours, meet at X at noon").

## 5. Common drifts to catch in review

- **Awareness items.** "Be aware that…", not an action. Cut.
- **Open-ended consideration.** "Consider whether your household…", not measurable. Either it produces an artefact or it does not belong here.
- **Resource-heavy items.** "Buy a backup generator." Most readers cannot in a week. Reshape as a pricing exercise or remove.
- **Skill items disguised as actions.** "Learn first aid." Reshape as "Book a Stop the Bleed class for this month" or "Read FM 21-76 chapter 4 this week and practise three knots".
- **Compound items.** A single item that contains four actions in a sentence. Split into separate items or trim to the load-bearing action.
- **Items the reader already does.** If 90% of readers already do it, drop it. The block is for moves they have not yet made.

## 6. Audit checklist (used by the editorial pass)

For each item in a field-notes block:

- [ ] Imperative verb in the opening bold clause.
- [ ] Concrete object named.
- [ ] Outcome observable within a week.
- [ ] Materials and access realistic for the target audience.
- [ ] 1 to 3 sentences. Not a paragraph.
- [ ] Sits inside `::: field-notes` ... `:::` fenced div.

A block where any item fails any line is sent back to the chapter's author.
