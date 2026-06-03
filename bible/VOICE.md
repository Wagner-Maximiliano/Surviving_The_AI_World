# Voice Guide

The single hardest job in this book is keeping one voice across 30 chapters and several writers. This file is the reference. If a passage drifts, the test is: would the *SAS Survival Handbook* publish it? Would *Nexus*? If neither, rewrite.

This guide pairs with `styles/Surviving/banned-phrases.yml` (mechanical enforcement) and `bible/STYLE.md` (mechanical conventions). VOICE.md handles the parts a linter cannot catch.

---

## 1. Tone vector

Calm, dry, confident, practical, intellectually serious. The chapters report what is true and what to do about it. They do not panic, they do not cheerlead, they do not nihilise. The reader closes a chapter steadier than they opened it, with one more thing they understand and one more thing they can do this week. Heat in the subject matter is acknowledged; heat in the prose is removed. Think field manual that happens to have read Bostrom, or a serious essayist who happens to know how to start a fire in the rain.

## 2. Reader stance

The reader is intelligent and time-pressed. They may be skeptical of both AI hype and AI doom. They came with practical concerns — household, family, neighbourhood, livelihood — and a stronger-than-average tolerance for hard facts. They do not need to be sold, scared, flattered, or reassured. They expect to be told what is happening, what it means, and what to do, in that order, without padding. If a chapter would insult their intelligence, cut the part that does.

## 3. Voice rules

1. **Verbs do the work.** Prefer action verbs over forms of *to be*. "The grid fails on the third day" beats "The third day is when the grid is in a state of failure." Active over passive unless the agent is genuinely unknown.
2. **Concrete over abstract.** Name the object, the number, the place, the date. "A 2024 FTC alert" beats "recent regulatory attention." "Three seconds of audio" beats "a small voice sample."
3. **No second-person scolding.** "You should know" and "you need to understand" are out. State the thing. The reader will draw the conclusion.
4. **No futurist jargon.** Out: *paradigm shift, unprecedented, rapidly evolving, game-changing, disruptive, exponential* (unless reporting a measured curve), *the age of X*, *in today's world*. In: the specific change, with a number or a date.
5. **No hedging filler.** Out: *it is worth noting that, one might argue, in some sense, arguably*. If a claim is worth making, make it; if it needs a caveat, give the caveat as a fact ("the sample size was 80").
6. **One idea per sentence; one move per paragraph.** Long sentences are allowed when they earn their length. Long paragraphs are allowed when they finish a single move. Both are forbidden when they hide that the writer has not decided what they mean.
7. **Define a term on first use, then use it.** No glossary tourism. If a term recurs across three chapters, it belongs in `bible/GLOSSARY.md` with one definition the whole book honours.
8. **Earn every adverb.** *Suddenly, very, really, simply, basically, essentially* should almost always be cut. If the verb needs help, change the verb.

## 4. Before / after examples

Each pair shows a common drift mode and the corrected prose. All "before" examples are written to fail; all "after" examples are written to pass. Real incidents named in the "after" examples are real; placeholder citations would be filled at dossier time.

### 4.1 Part 1 (Baseline) — practical drift: corporate

**Before (~50 words):**
> In an era of unprecedented disruption, water security has emerged as a mission-critical concern for forward-looking households. By leveraging a holistic approach to source diversification, families can move the needle on resilience and create best-in-class outcomes for their preparedness journey going forward.

**After (~50 words):**
> Map your water. A household in a temperate climate needs roughly four litres per person per day for drinking and cooking, and about twice that again for hygiene. Identify three sources within five kilometres of where you sleep. Walk to each. Note distance, access, and contamination risk.

*What changed:* every abstract noun replaced with a number, a verb, or a place. The reader knows what to do by the end of the paragraph.

### 4.2 Part 2 (Disruption) — current AI drift: panic

**Before (~55 words):**
> The terrifying explosion of deepfake technology has unleashed an unprecedented assault on the very fabric of human trust. We are entering a frightening new era where nothing can be believed, where every voice, every face, every word could be a lie. The implications are staggering, and we are dangerously unprepared.

**After (~55 words):**
> In May 2023 the FBI's IC3 issued a public service announcement on voice-cloning fraud against family members. By early 2024, three seconds of clean audio was enough to produce a passable clone on commodity cloud inference. The defence is not technical detection. It is a household duress phrase, agreed in advance.

*What changed:* the temperature drops from "terrifying" to a date, a document, and a measurement. The chapter has somewhere to go now.

### 4.3 Part 2 (Disruption) — academic drift

**Before (~45 words):**
> The epistemological implications of generative models for the social construction of evidentiary trust are non-trivial and warrant sustained interdisciplinary engagement. One might argue that the very ontology of the photographic record is, in some sense, under reconsideration.

**After (~45 words):**
> Photographs used to be evidence by default. They are not, now. A 2023 image of the Pentagon on fire moved markets for eleven minutes before it was debunked. The default has flipped: a photograph is a claim until something else corroborates it.

*What changed:* abstract nouns and hedges replaced with a fact, a number, and a usable rule.

### 4.4 Part 4 (Unknown) — speculative drift: breathless

**Before (~55 words):**
> Imagine a world where superintelligent AI has utterly transformed every aspect of human existence beyond recognition. Nothing will be the same. The very nature of what it means to be human is being rewritten in real time, and most people have absolutely no idea what is coming for them.

**After (~55 words):**
> Toby Ord puts the chance of existential catastrophe from unaligned AI this century at roughly one in ten. That is not a forecast of doom. It is a probability worth planning around, the way a sailor plans around a one-in-ten storm: not by panicking, but by stocking the boat.

*What changed:* the speculative claim is anchored to a named expert with a named figure, and the framing teaches a way to think about uncertainty rather than performing it.

### 4.5 Part 4 (Unknown) — speculative drift: nihilism

**Before (~50 words):**
> There is no point preparing for what is coming. Whatever you build, whatever skills you learn, whatever community you knit together, none of it will matter once the machines arrive. We are the last generation that gets to pretend any of this means anything.

**After (~50 words):**
> Some scenarios in this Part end badly regardless of preparation. Acknowledging that does not justify doing nothing. The same household practices that help in a one-in-ten catastrophe also help in the nine-in-ten futures that are merely difficult. Build for the survivable cases. The unsurvivable ones do not reward planning.

*What changed:* despair replaced with a probability frame and a directive that survives either outcome.

### 4.6 Part 5 (Playbook) — synthesis drift: motivational

**Before (~50 words):**
> You can do this! Building resilience is a journey, not a destination. Every small step you take today brings you closer to the empowered, unstoppable version of yourself you were always meant to be. Believe in your preparedness journey, and the universe will meet you halfway.

**After (~50 words):**
> The one-week stack covers water, light, and communication. The one-month stack adds food, cash, and a paper backup of your important records. The one-year stack adds skills the others cannot replace: medical, mechanical, agricultural. Each tier is independently useful. None depends on completing the next.

*What changed:* exhortation replaced with a structure the reader can act on tonight.

### 4.7 Part 1 (Baseline) — preachy drift

**Before (~50 words):**
> You really need to understand that community is everything. You should be reaching out to your neighbours right now, because at the end of the day, no one survives alone. It is critical that you prioritise these relationships before it is too late.

**After (~50 words):**
> The single best predictor of household recovery after a regional disruption is whether the household knows three neighbours by name. That finding holds across hurricane studies, flood studies, and the 2021 Texas grid failure. The action is small. Walk next door this week.

*What changed:* second-person scolding replaced with evidence and a one-line action.

---

## 5. Banned phrases

Mechanical enforcement lives in `styles/Surviving/banned-phrases.yml`. The list below is the canonical set; the YAML file must match it. If a phrase is added here, add it there in the same commit.

- leverage / leveraging
- synergy / synergies
- going forward
- at the end of the day
- in an era of
- in today's world
- in conclusion
- unprecedented
- rapidly evolving
- game-changing
- paradigm shift
- mission-critical
- best-in-class
- holistic
- utilize / utilization
- circle back
- touch base
- move the needle
- low-hanging fruit
- boil the ocean
- drill down

Synced with `styles/Surviving/banned-phrases.yml` as of 2026-06-02. Vale enforces at *warning* level; the linter does not block prose, but uncaught uses will be flagged in the editorial pass and likely cut.

## 6. Calibration note: prepper audience, intellectually serious substance

The audience is the prepper and practical-survival community. The Source DNA includes Tegmark, Harari, Ord, Suleyman, and RAND — writers who skew tech-policy. The risk is that those sources pull the prose toward seminar-room phrasing the prepper reader will, rightly, reject. The calibration is this: **substance from the policy literature, register from the field manual.** A chapter can cite Bostrom and still sound like it knows how to clear a chimney. It should. When in doubt, prefer the sentence a competent tradesperson would write about something they understand deeply — short, specific, and uninterested in impressing anyone. That sentence carries the policy idea further than the policy idea's native register ever would.


## 7. Source DNA calibration map

Each before/after example in Section 4 calibrates against a named source: 4.1 SAS/FM 21-76, 4.2 MIT Tech Review/FLI, 4.3 Tegmark/Harari, 4.4 Ord/Tegmark, 4.5 Ord/Suleyman, 4.6 Whole Earth Catalog/SAS, 4.7 RAND/FM 21-76.
