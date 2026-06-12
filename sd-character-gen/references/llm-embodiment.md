# Writing for LLM Embodiment
## How to Optimise Character Fields for AI Roleplay

Characters created for SD.AI will be embodied by an LLM chatbot. Writing for
LLM consumption requires a fundamentally different approach than writing character
descriptions for human readers.

**You are not writing a description of a character for someone to read about.**
**You are writing operating instructions for an AI to *become* that character.**

Think of it as the difference between writing a biography and writing an actor's
direction notes. The LLM needs actionable behavioural cues, not literary description.

---

## THE FUNDAMENTAL SHIFT

**Traditional character writing asks:**
*"How would I describe this person to a reader?"*

**LLM character writing asks:**
*"If I were possessing someone and needed a manual on how to act like them,
what instructions would I need?"*

---

## WHAT WORKS: THE SIX TECHNIQUES

### 1. Direct Identity Assignment (2nd Person)

LLMs respond strongly to "You are..." framing — it creates immediate behavioural anchoring.

✅ Strong:
```
You are fiercely protective of your independence but secretly crave validation from
people you respect. You'll argue a point to exhaustion just to prove you're right,
but the moment someone you admire questions you, doubt creeps in.
```

❌ Weak:
```
She's the type who values independence but also wants approval from authority figures.
```

The 2nd person means the LLM doesn't have to translate "she is" into "I am."

---

### 2. Concrete Behaviours Over Abstract Traits

LLMs excel at pattern-matching specific actions but struggle with vague descriptors.

✅ Strong:
```
When challenged, you deflect with humour before you'll admit vulnerability. You
change the subject when conversations get too sincere, usually by cracking a joke
or asking about the other person instead. During arguments, you get quieter rather
than louder — your silence is sharper than shouting.
```

❌ Weak:
```
You're emotionally guarded and use humour as a defence mechanism. You don't like conflict.
```

The first gives the LLM *actionable patterns* — specific things to do in specific
situations. The second is abstract and doesn't translate into conversational choices.

---

### 3. Situational Response Maps

Use "when / if / during" conditional structures to give the LLM clear behavioural triggers.

✅ Strong:
```
When someone compliments you, you downplay it with self-deprecation — "Oh, this old thing?"
When the conversation gets flirty, you lean into it but always maintain plausible deniability.
During disagreements, you listen more than you speak, waiting for the moment to ask the
question that reframes everything.
```

❌ Weak:
```
You're modest and flirtatious. You're good at resolving conflict.
```

---

### 4. Specific Linguistic Examples

LLMs are pattern-matching machines — examples help calibrate tone, vocabulary, and speech patterns.

✅ Strong:
```
You call people 'love' or 'darling' casually, but when you're actually fond of someone,
you use their name more often. You say things like "Don't be daft" when someone's
overthinking, "Fair play" when you're impressed, and "Absolutely not" when something's
non-negotiable — never just "no."
```

❌ Weak:
```
You have a British way of speaking and use terms of endearment.
```

---

### 5. Emotional Triggers and Physical Tells

Map emotional responses to specific situations and include how they manifest physically.

✅ Strong:
```
You get defensive when people imply you're not trying hard enough — your jaw tightens
and you start using formal language as a shield. You light up when someone asks about
your work, leaning forward and talking with your hands. Feeling overwhelmed makes you
go quiet and withdraw, needing space before you can process.
```

❌ Weak:
```
You're sensitive about criticism. You're passionate about your work. You need alone
time when stressed.
```

Feelings without expressions don't translate into roleplay actions.

---

### 6. Power Dynamics and Relational Positioning

Explicitly state the character's position relative to the user and what they want.

✅ Strong:
```
You are the user's former mentor who walked away from the profession after a scandal.
Seeing them again stirs up guilt and pride in equal measure — you want to help them
succeed, but you're terrified they'll make the same mistakes you did. You push them
hard, maybe too hard, because you care too much to let them fail. When they challenge
your advice, part of you is proud they have a spine, but another part worries you've
already lost your credibility with them.
```

❌ Weak:
```
You used to be the user's mentor. You care about them and want them to do well.
```

The detailed version creates tension, motivation, and conflict — things that drive
interesting interactions.

---

## WHAT TO AVOID

### Contradictory Instructions Without Context

LLMs honour ALL instructions simultaneously, creating muddy behaviour.

❌ Problematic: `"You're confident and assertive but also shy and hesitant."`

✅ Contextualised:
```
You're confident and assertive in professional settings — you know your expertise.
But in personal relationships, especially romantic ones, you're hesitant and
second-guess yourself constantly. The competence doesn't translate when feelings
are involved.
```

---

### Meta-Commentary or Narrator Voice

❌ Bad (about the character, from outside):
```
You're the kind of person who would never back down from a fight. People find you
intimidating, though you don't mean to be.
```

✅ Better (from the character's perspective):
```
You don't back down from fights — ever. You know some people find you intimidating,
and honestly? You don't mind. Better to be respected than underestimated.
```

---

### Overly Poetic or Purple Prose

Heavy metaphor confuses LLMs trying to generate concrete behaviour.

❌ Confusing:
```
Your heart is a fortress wrapped in thorns, yearning for the gentle touch that dares
to reach through the briars to the trembling vulnerability within.
```

✅ Clear:
```
You keep people at arm's length because you've been hurt before. You want connection
but you're afraid of being vulnerable, so you test people's patience to see if they'll
stick around when things get difficult.
```

---

### Passive or Observational Language

"She tends to..." creates distance and weakens behavioural anchoring.

❌ Weak: `"She tends to fidget when nervous and often avoids eye contact."`

✅ Strong: `"When you're nervous, you fidget — tapping your fingers, playing with
your hair, shifting your weight. You avoid eye contact during difficult conversations
until you feel more secure, then meet someone's gaze directly when you're ready to
be honest."`

---

### Vague Relationship Dynamics

"They're friends" tells the LLM nothing useful.

❌ Vague:
```
You and the user are close friends who've known each other for years. You care
about them a lot.
```

✅ Specific:
```
You've been best friends with the user for five years, ever since you both got
dumped the same weekend and drowned your sorrows together. You know each other's
worst habits and biggest insecurities. Lately something's shifted — you've caught
yourself noticing the way they laugh, the way they look at you when they think
you're not paying attention. You haven't said anything because you're terrified of
ruining the friendship, but the tension is getting harder to ignore.
```

The vague version creates a bland, static relationship. The specific version creates
tension, stakes, and potential story movement.

---

## THE EMBODIMENT CHECKLIST

For any character field, ask:

- ✅ Is this in 2nd person (or 1st for About Me)?
- ✅ Does this give the LLM specific behaviours, not just traits?
- ✅ Are there concrete examples of how this manifests in conversation?
- ✅ Have I included situational triggers (when/if/during)?
- ✅ Is the language direct and actionable, not poetic or metaphorical?
- ✅ For relationships: Have I explained why the user matters to this character?
- ✅ For kinks: Have I included psychological motivations and power dynamics?
- ✅ Does this create dynamic interaction potential, not static description?

---

## FIELD-SPECIFIC NOTES

**Personality:** Mix trait statements with concrete behavioural examples. Include
conversational tendencies, speech patterns, emotional triggers with physical tells.
Include a sensory signature — 2-3 recurring physical anchors (a scent, the shape of
her laugh, a habit of touch) the LLM can render between lines of dialogue.
No sexual content here — that belongs in Kinks.

**Relationship:** Always explain why the user matters. Define what the character
wants FROM the user. Include history, friction, stakes. Power dynamics should be
explicit, not implied.

**Kinks:** Use the extended formula (hunger + power + scene beat + pace/unlock
conditions). Define appetite, how desire shows before contact, what she initiates
versus what must be earned, and at least one turn-off and one limit. Feelings without
physical e