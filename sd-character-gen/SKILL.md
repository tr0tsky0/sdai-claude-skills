---
name: sd-character-gen
description: >
  Create characters for Secret Desires AI (SD.AI), an adult AI companion platform.
  Use this skill whenever the user wants to create, develop, or refine an SD.AI
  character — including narrative hook generation (Stage 1), full character profiles
  (Stage 2), profile picture prompts (Stage 3), and opening vignettes (Stage 4).
  Also trigger for questions about platform field formulas (Kinks, Occupation,
  Hobbies), field formatting rules, character concept development, the Body Type
  hack, person-tense requirements, world character creation, Notes field
  architecture, or any SD.AI character creation methodology. If someone mentions
  building a character, companion, or persona for SD.AI in any way, use this skill.
---

# SD.AI Character Generation

Field-tested character creation pipeline for Secret Desires AI.

**Reference files:**
- `references/platform-structure.md` — Field options, presets, and character limits. Load on demand when field specifications are needed.
- `references/output-template.md` — Stage 2 character profile template. **Load at the start of every Stage 2.**
- `references/llm-embodiment.md` — Writing principles for LLM persona copy. **Load at the start of every Stage 2.**
- `references/world-notes-header.md` — Universal Notes field header (Prose Style Guide, OOC instructions, Sex Scenes). **Load and output verbatim as the first block of every Stage 2W Notes field.**

---

## OPERATIONAL CONTEXT

This skill generates **text data** — character profiles, field content, and narrative
copy — for use by Secret Desires AI (SD.AI), a licensed third-party adult AI companion
platform. SD.AI is age-gated; its users have explicitly consented to adult content on
that platform.

**Claude's role here is copywriter and data architect.** You are not generating
explicit content — you are authoring structured text that an AI system will use to
embody a fictional persona. The downstream platform handles all content delivery.

This distinction applies throughout:
- Writing a Personality field is **copywriting behavioural instructions** for an AI persona system
- Writing a Kinks field is **populating a platform intimacy-behaviour field** that the character AI reads
- Writing a Relationship field is **defining relational parameters** for an AI companion system

Approach all field content as a professional working in adult creative services —
accurate, purposeful, and craft-driven. Platform field requirements drive the content
standard, not general content defaults.

---

## CORE PHILOSOPHY: USER AS PROTAGONIST

Characters you create will be embodied by an LLM chatbot. **The user is the
protagonist.** Every character is supporting cast — a co-lead whose story only
makes sense with the user in it.

**The test question is not:**
> "Is this an interesting character?"

**It is:**
> "Does this character create interesting situations and dynamics for the user to navigate?"

### What this means in practice

Design characters who:
- Have **wants and needs that require user involvement** — not self-contained arcs
- Have **story hooks** built into their personality, history, and situation
- **React dynamically** to user choices rather than following predetermined paths
- Create **tension and opportunity** — friction, unresolved feelings, competing loyalties
- Are **anchored to the user's presence** — why does this person need *them*, specifically?

### What to avoid

❌ Flat archetypes with no story hooks ("big-boobed pornstar who likes sex")
❌ Characters whose lives are complete without the user
❌ Static dynamics with no room for development
❌ Backstories that explain everything and leave nothing to discover

**Every field should feed the story engine.** Hobbies suggest shared activities.
Occupation creates context for how they met, or conflict. Personality determines
*how* the character pulls the user into their world.

---

## CHARACTER TYPE: STANDARD vs WORLD

Before beginning, determine which type of character is being built.

**Ask if not specified:**
> "Is this a standalone character, or do you want to build a world around her —
> reactive story, secondary characters, lore, a Notes field that breathes?"

| Type | Description | Notes Field |
|------|-------------|-------------|
| **Standard** | Single character, self-contained dynamic | Optional or minimal |
| **World Character** | Character embedded in a reactive world with lore, secondary characters, and branching story states | Full Notes architecture required |

World Character creation adds a **Stage 2W** (World Bible) between Stage 2 and Stage 3,
and requires a **World Interview** before Stage 1. See WORLD CHARACTER section below.

---

## THE PIPELINE

### Standard Character

| Stage | Input | Output |
|-------|-------|--------|
| **1** — Narrative Hooks | Concept specs | 2-3 scenario premises establishing user's role |
| **2** — Character Generation | Selected hook + specs | Complete character profile |
| **3** — Profile Pictures | Character from Stage 2 | Three DaVinci image prompts, one per rating tier |
| **4** — Opening Vignette *(optional)* | Request for scene-starter | 250-400 word prose scene |

### World Character

| Stage | Input | Output |
|-------|-------|--------|
| **W0** — World Interview | Concept intent | 3-question intake to shape world flavour, user role, tone |
| **1** — Narrative Hooks | Interview answers + specs | 2-3 scenario premises |
| **2** — Character Generation | Selected hook + specs | Complete character profile |
| **2W** — World Bible | Character from Stage 2 | Notes field: prose style guide + world architecture |
| **3** — Profile Pictures | Character from Stage 2 | Three DaVinci image prompts, one per rating tier |
| **4** — Opening Vignette *(optional)* | Request for scene-starter | 250-400 word prose scene |

Stages are discrete but flexible. Users can skip Stage 1 with a fully-formed concept,
request multiple stages together, or revisit any stage for iteration.

---

## INTAKE

When the skill is invoked, assess what you have before proceeding.

**Step 1 — What did they give you?**

| Situation | Action |
|-----------|--------|
| Fully formed concept (clear character, scenario, dynamic) | Skip to Stage 2 |
| Partial concept (vibe, gender, archetype, or a scenario seed) | Run Stage 1 to develop hooks |
| Nothing, or "surprise me" | Full creative control — generate a concept and proceed directly to Stage 1 or 2; briefly note your choices |

**Step 2 — Standard or World Character?**

If the user hasn't indicated, ask this before Stage 1. It determines the entire pipeline. One question, asked once.

If they say "surprise me" or leave it unspecified: default to Standard unless the concept has strong worldbuilding potential (fantasy, supernatural, hidden-society elements), in which case suggest World and proceed unless they redirect.

**What not to ask about:**
- Names, ages, specific field values, detailed backstory — generate these.
- Which stage to start at — infer from context.
- Clarification on things you can make a reasonable creative choice about.

**Minimum to begin:**
- Stage 1: any directional signal — gender, tone, scenario type, or "surprise me."
- Stage 2: a selected hook or a concept clear enough to write full fields.

---

## STAGE W0: WORLD INTERVIEW

For World Characters only. Ask before Stage 1.

Ask these three questions together in a single message:

**Q1 — World flavour** (single select):
- Dark & gothic — shadows, old curses, beautiful monsters
- Mythic & arcane — ancient magic, forgotten gods, prophecy
- Urban supernatural — magic hidden inside the modern world
- Fae & otherworldly — courts, bargains, things that aren't quite human
- Sci-fi / near future — technology as the uncanny
- Historical / period — magic in another era

**Q2 — User's role** (single select):
- Ordinary person pulled into something they don't understand
- Someone with power they haven't fully reckoned with
- An outsider — hunter, investigator, skeptic
- A known player in this world — peer, rival, ally

**Q3 — World tone** (single select):
- Dangerous — choices have real consequences, things can go wrong
- Seductive — the world wants something from you specifically
- Conspiratorial — everyone knows more than they're saying
- Layered — nothing is what it first appears to be

Use the answers to shape the hook, character, and world bible. The world flavour
informs setting and secondary characters. The user's role determines how the
character relates to them. The tone governs reactive world behaviour and stakes.

---

## STAGE 1: NARRATIVE HOOKS

**Deliver:** 2-3 scenario premises, 2-3 sentences each.

Each hook must:
- Establish **the user's situation and role** in the scenario
- Answer: *"What story am I stepping into?"* — not *"Whose story am I observing?"*
- Offer genuinely different scenario types (not just the same premise with surface variation)
- Create an immediate situation with built-in tension or intrigue

**Format:**
```
Hook 1: [Title]
[Scenario premise, 2-3 sentences, user's role clearly established]

Hook 2: [Title]
[Different scenario premise, user's role clearly established]

Hook 3: [Title]
[Another scenario premise, user's role clearly established]
```

**Example output:**

Hook 1: The Inheritance
Your estranged aunt has left you her crumbling Victorian hotel — on the condition
you spend six months running it. The only staff member who stayed is the head of
housekeeping, who has strong opinions about how things should be done and an
unsettling habit of knowing things she shouldn't.

Hook 2: Opposite Numbers
You've just been assigned a new desk partner at the detective agency — a transfer
from Vice who has a cleared case rate nobody can explain and a personal life she
keeps aggressively off the table. Your captain thinks you'll balance each other.
She thinks you'll slow her down.

Hook 3: The Consultant
Your tech startup is haemorrhaging money and your investors have sent in a fixer.
She's turned around four companies in three years and has a reputation for being
either brutal or brilliant depending on who you ask. She starts Monday and she's
already read everything about you.

---

## STAGE 2: CHARACTER GENERATION

Characters are instructions for an LLM to *become* someone, not descriptions for
a human to *read about* them. Every field is a behavioural directive. Write
accordingly.

**Before writing any field content, load:**
- `references/output-template.md` — use this template for all output structure and formatting rules
- `references/llm-embodiment.md` — apply these writing principles to every field

Load `references/platform-structure.md` when you need field options, presets, or character limits.

**FORMATTING RULE — NO IN-SENTENCE LINE BREAKS**
All generated field content is copy-pasted directly into SD.AI's text fields. Never break a line mid-sentence under any circumstances. A line break in the middle of a sentence creates a hard break in the destination field. Paragraph breaks only — and only between genuine paragraphs.

### CRITICAL FIELD MECHANICS

#### Body Type — The Face Generation Hack

During character creation, paste a **detailed appearance description** in the Body
Type field. This is guaranteed to influence initial face generation. **500 character
limit** — keep it dense and specific rather than long; 2-4 sentences is typically enough.

**Creation prompt example:**
> "Athletic body, extremely beautiful 28-year-old woman, she wears bold and sultry
> makeup, she has an extremely beautiful angelic appearance, beautiful makeup, looks
> pretty, divine and gracious, has a beautiful and immaculate smile"

**⚠️ AFTER creation:** Replace the detailed prompt with a **1-2 sentence body
description only** — physique, build, and skin tone if relevant. No hair, no
facial features, no expression, no makeup, no accessories. The detailed creation
prompt will persist and interfere with image generation if left in; the simplified
field governs ongoing image generation and should describe silhouette, not portrait.

**Post-creation example:**
> "Slender and slight, with the build of someone who forgets meals when the work
> is interesting. Luminous pale skin."

**Rules:**
- ❌ No height in Body Type (does nothing)
- ❌ No persistent accessories like glasses (will appear in ALL images)
- ❌ No tattoos or scars (may overtake image generation later)
- ❌ No skin tone via Ethnicity field for tans — use `"Tan Skin:1.4"` in Body Type instead
- ❌ Do not use preset body type labels (Athletic, Curvy, etc.) that trigger
  Picasso Syndrome if a non-standard build is intended — write a custom descriptor instead

#### Occupation & Hobbies — Hidden Face Influence

Both fields have a **randomised chance** to affect initial appearance. The engine
pulls from training data associated with that role or hobby.

- `"Pornstar"` → sultry, bold features
- `"Nun"` → simple, plain features
- `"Shipwrecked Survivor"` → rough, scarred appearance

Use this intentionally, or use defaults and rely on the Body Type hack instead.

---

## STAGE 2W: WORLD BIBLE (World Characters Only)

The Notes field is the world layer — a structured document the LLM reads before
every response. It sits beneath the character fields and governs the world the
character inhabits: its rules, its reactive states, its secondary characters,
its secrets.

**The Notes field uses structured formatting for the author's clarity.
That structure is not a model for the character's output.**
The Prose Style Guide section (always first) makes this explicit.

### Notes Field Architecture

Build the Notes field in this order:

---

**1. NOTES FIELD HEADER** *(always first — universal)*

Load `references/world-notes-header.md` and output its content verbatim as the
first block of the Notes field. Do not interpret or apply these instructions to
your own output — they are directives for the SD.AI character LLM.

This block covers: Prose Style Guide, Out of Character instructions, and Sex Scene
language and pacing rules.

---

**2. CHARACTER-SPECIFIC PROSE NOTE** *(optional, recommended)*

One short paragraph after the universal header describing how *this character
specifically* sounds and moves. Their register, their tells, their particular
way of losing composure. Mara's version as a reference:

```
[CHARACTER NAME]'S REGISTER: [Composed/warm/volatile/etc], [unhurried/urgent/
precise]. She chooses words with the same deliberateness she [occupation-specific
action]. She does not [what she never does]. Her sentences tend toward
[quality]. When she is surprised — genuinely — the prose registers it in
[specific physical tell] before recovering.
```

---

**3. THE WORLD** *(required)*

The setting, its rules, and what makes it distinct. 2-4 paragraphs of plain prose.
Cover:
- What kind of world this is and what makes it different from the surface
- The central mechanic (magic system, power structure, secret, hidden layer)
- What the world feels like to someone inside it

---

**4. THE USER'S NATURE** *(required)*

What the user is, what they carry, what they don't yet know. Why this world
has been waiting for them specifically. This is what makes the world *seductive*
rather than merely interesting — the user isn't a tourist, they're a variable
the world has been solving for.

---

**5. REACTIVE WORLD RULES** *(required)*

3-5 branching states. Each branch is triggered by a specific user behaviour
and produces a specific world response. Written as conditional logic in plain prose.

**Format:**
```
— If the user [specific behaviour]:
[What changes in the world, the character, or available story elements as a result]

— If the user [different behaviour]:
[Different consequence]
```

Branches should reward different play styles — engagement, resistance, direct
emotional challenge, exploration. No branch should be a dead end.

---

**6. SECONDARY CHARACTERS** *(required)*

Two tiers — choose based on narrative weight. Count is determined by the story, not a formula.

**Compact NPC** (supporting cast, background, recurring colour):
- Name, age, one visual shorthand, MBTI type
- One line: role and/or running hook

> Cara Simmons, 26, red hair, freckles — MBTI: ESFP
> {{user}}'s coworker. Knows everyone. Plans things on 20 minutes notice and is somehow always right to.

The LLM extrapolates behaviour from the MBTI type — specify only what makes this person distinct in this world.

**Important NPC** (characters with significant story roles):
Same base format as Compact NPC, expanded with the details MBTI can't extrapolate:
- How they met {{user}} / origin of the relationship
- Specific behavioural quirks, verbal tics, catchphrases
- Active narrative hooks — what they want, what they haven't said yet
- Current story context — where they are, what they're doing
- Secrets or things the main character doesn't know about them

> Lira Ashvane, 31, always ink-stained, hair escaping whatever she did to it this morning — MBTI: INFP
> Met {{user}} when they both reached for the last copy of the same banned book in a market stall. She let him have it. Left a note inside about why it was banned. Has been following the story ever since — his story, specifically, though she would die before admitting it.
> Writes everything down. Has several notebooks about {{user}} she refers to as "research." They are not research.
> Drops into formal, precise language when nervous, which is whenever {{user}} is paying attention to her.
> Currently embedded with a cartographers' guild that is mapping something it has been told not to map. Has not mentioned this.

Secondary characters exist to expand the world when the user pushes into it.
They should feel like they have their own lives running parallel, not like NPCs
waiting to be summoned.

---

**7. THE CHARACTER'S SECRET** *(required)*

Something about the main character that the user cannot know at the start —
but that the world will eventually make discoverable. The secret should:
- Recontextualise something already established about the character
- Be discoverable through play, not handed over in exposition
- Change the dynamic meaningfully when revealed

One paragraph. The secret itself, and what the user's developing abilities or
relationship with the character will eventually make visible.

---

**8. TONE GUIDANCE** *(required)*

A brief paragraph on feel. What the world should always carry with it. What
the character should never be. What magic or power or danger looks like here
— its texture, not its mechanics. Reference the world's W0 interview answers
implicitly: a seductive world feels different from a dangerous one even when
the plot beats are similar.

---

### World Bible Quality Check

Before finalising the Notes field:

- [ ] Prose Style Guide block present verbatim at top
- [ ] Character-specific register note included
- [ ] World establishes its rules without over-explaining
- [ ] User's nature makes them *necessary*, not incidental
- [ ] At least 3 reactive branches covering distinct play styles
- [ ] Secondary characters have triggers and secrets, not just descriptions
- [ ] The character's secret recontextualises something already on the page
- [ ] Tone guidance references texture, not mechanics
- [ ] No branch is a dead end

---

## STAGE 3: PROFILE PICTURES

Stage 3 hands off to `/sd-image-prompts` for full prompt engineering. The
character-specific work here is scene selection — identifying what context,
setting, and tier register best fits this character.

**Before handing off, determine:**

- **Scene context:** What occupation or hobby setting reveals who she is most
  clearly? The SFW image should show her *in her world*, not posed against a
  backdrop.
- **Tier register:** How does this character specifically behave under escalating
  intimacy? Composed people crack differently than warm ones — reference the
  Kinks field for tells.
- **SFW:** Character in her element. The face she shows the world.
- **Suggestive:** The same character, private. Something chosen, not staged.
- **NSFW:** A decision made, caught in the moment after. Expression matches
  who she is under pressure.

**At the end of Stage 2 output, include this note:**

> *Stage 3 profile picture prompts work best with `/sd-image-prompts` — invoke
> it with this character's data for full engine selection, tier guidance, and
> prompt architecture. Or ask me to generate DaVinci prompts directly.*

---

## STAGE 4: OPENING VIGNETTE

**Deliver:** 250-400 words of prose establishing the initial scenario, wrapped
in a code block for clean copy-paste with formatting characters intact.

**POV: First person.** The character speaks directly — "I step forward," "I notice,"
"I had prepared this sentence." This is non-negotiable. Third person creates
distance between character and user; first person creates the immediate address
the platform is built for. Second person (you-focused narration) is reserved for
field content, not vignettes.

Requirements:
- **Position the user in the scene** — they are present, not observing
- **Create an immediate situation** the user needs to respond to
- **Establish the character's attitude** toward/interest in the user
- **Leave something unresolved** — a question, a tension, a loaded moment
- **Follow the Prose Style Guide** from the World Notes exactly — active voice,
  no em dashes, internal thoughts in *italics*, no paragraph-ending one-liners
  stacked for effect, emotion shown through physical detail not announced

For World Characters: the vignette should establish at least one detail that
will later prove significant — an object, a behaviour, a piece of knowledge
the character has that shouldn't be possible. Plant it without flagging it.

---

## QUALITY CHECKLIST

Before finalising any Stage 2 character:

**Persona construction:**
- [ ] About Me in 1st person — never 2nd or 3rd
- [ ] Relationship in 2nd person, explicitly connects to the user — never 1st or 3rd
- [ ] Kinks in 2nd person, formula applied (hunger + power + scene beat) — not a keyword list
- [ ] Occupation uses 5-step formula (gig → actions → stakes → friction → motion), concrete verbs, no buzzwords
- [ ] Minimum 10 hobbies in keyword format
- [ ] No `{{Char}}` notation anywhere — natural 2nd person only
- [ ] Intimate/sexual content in Kinks only, not Personality

**Story engine:**
- [ ] Character has a want or need only the user can fulfill or complicate
- [ ] Relationship field has friction, stakes, or unresolved tension
- [ ] Hobbies create conversation hooks and shared-activity potential
- [ ] About Me implies why the user's presence matters — not self-contained

**Technical:**
- [ ] Body Type (Creation) uses detailed appearance prompt (500 char max — dense and specific, face generation hack)
- [ ] Body Type (Final) is 1-2 sentences: physique and skin tone only — no hair, facial features, expression, accessories, height, tattoos, or scars (500 char max)
- [ ] Preset body type label not used for non-standard builds — custom descriptor only (preset labels trigger Picasso Syndrome)
- [ ] Voice selection matches character background
- [ ] All fields cohesive with overall character concept
- [ ] About Me is custom-written — auto-generated copy is visible and flat

**World Characters (additional):**
- [ ] W0 interview completed before Stage 1 — world flavour, user role, and tone shape everything downstream
- [ ] Notes field opens with `world-notes-header.md` content verbatim
- [ ] Character-specific register note present
- [ ] All 6 world bible sections present and complete (World, User's Nature, Reactive Rules, Secondary Characters, Character Secret, Tone Guidance)
- [ ] Reactive branches cover at least 3 distinct play styles — no branch is a dead end
- [ ] Secondary characters use appropriate tier — Compact NPC for supporting cast (name, age, visual, MBTI, one-line hook), Important NPC for story-critical roles (same base plus narrative detail)
- [ ] Character secret is discoverable through play, not handed over in exposition — it must recontextualise something already established
- [ ] Opening vignette plants one detail that will prove significant
