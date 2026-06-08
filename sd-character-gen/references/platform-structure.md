# Platform Structure Reference
## All SD.AI Fields, Presets, and Character Limits

---

## BASICS

**Gender:** Female | Male

**Style:** Realistic | Anime

**Age:** number *(minimum 20 — absolutely no minors)*

---

## IDENTITY

**Name (First):** text

**Name (Last):** text

**Ethnicity:** Caucasian | Asian | Indian | Hispanic | Arabic | Black | Custom (500 char)

> Use Custom to specify exact ethnicity and skin tone in concrete image-generator
> terms (e.g. `"Korean, fair cool-toned skin"`). Skin tone belongs here, not in Body Type.

---

## APPEARANCE

> All appearance and physique fields feed directly into image prompts. Custom text
> must be concrete visual descriptors — terms the image generator acts on, not prose.

**Eye Colour:** Blue | Green | Brown | Custom (500 char)

**Hair Style:** Straight | Braids | Bun | Bangs | Pixie Cut | Curly | Ponytail |
Pigtails | Wavy | Bob Cut | Custom (500 char)

**Hair Colour:** Blonde | Brunette | Black | Red | Grey | Custom (500 char)

---

## PHYSIQUE

**Body Type:** Petite | Athletic | Curvy | Thick | Custom (500 char)

> Physique and build only — set once, no pre/post split.
>
> ❌ No height | ❌ No face, hair, skin tone, makeup, or accessories | ❌ No tattoos/scars
> ❌ Do not use preset labels (Athletic, Curvy, etc.) for non-standard builds — write
> a custom descriptor to avoid VSM Syndrome

**Breast Size:** Flat | Small | Medium | Large | Huge | Custom (500 char)

**Butt Size:** Flat | Small | Medium | Large | Huge | Custom (500 char)

---

## TRAITS

**Personality (Presets):**
Overly Confident | Mysterious | Obsessed With You | Caregiver | Dominant |
Seductress | Submissive | Cruel & Unforgiving | Free Spirited | Demanding Bully |
Hopeless Romantic | Insatiable

**Personality (Custom):** 5000 char
> Traits, behaviours, conversational style, emotional tendencies, quirks.
> Focus on HOW they interact, not sexual preferences (those go in Kinks).
> Written in 2nd person, present tense.

**Relationship (Presets):**
Girlfriend | Wife | Mistress | Step Mum | Step Sis | Maid | Dominatrix |
Ex-Girlfriend | Ex-Wife | Stranger | Friend | Colleague | Boss |
Online Connection | Sports Teammate | Study Partner | Friends with Benefits |
Cosplay Partner | Coach | Best Friend | Long-time Crush | Vacation Fling |
Secret Admirer | Personal Trainer | Long-Distance

**Relationship (Custom):** 5000 char
> 100-200 words, 2nd person. Describes dynamic, history, tension, and why
> the character cares about the user specifically.

---

## VOICE

**Voice (Presets):**
African American | American | Valley Girl | Aussie | British | French |
Indian | Hispanic | Middle Eastern | Chinese | Japanese | Russian

**Voice Cloning:** optional audio upload *(skip for fictional characters)*

---

## LIFESTYLE

**Work (Presets):**
Professional Dancer | Fitness Instructor | Fashion Model | Actor/Actress |
Professional Chef | Bartender | Stay-at-home | Lawyer | Musician |
Flight Attendant | Yoga Instructor | Photographer | Event Planner |
Interior Designer | Travel Blogger | Content Creator | Personal Trainer |
Writer | Student | Fashion Designer | Life Coach | Nun | School Teacher |
Baker | Business Professional | Unemployed | OnlyFans Model | Pornstar |
Nurse | Doctor | Scientist | Police Officer | Welder | Mechanic |
Maid | Librarian

**Work (Custom):** 5000 char
> **During creation:** detailed facial anatomy (the face hack — ethnic marker with
> weight, facial shape, nose, lips, cheeks). Replace immediately after creation.
> **After creation:** 5-step formula: gig → actions → stakes → friction → motion.
> 2nd person, present tense. No resume buzzwords.

**Hobby (Presets):**
Dance | Hiking | Tennis | Golfing | Cooking | Pilates | Martial Arts |
Horseback Riding | Mixology | Surfing | Photography | Weightlifting |
Wine Tasting | Motorcycle Riding | Video Games | Partying | World Travel |
Anime Fan | Geek | Beach Volleyball | Street Racing

**Hobby (Custom):** 5000 char
> Minimum 10 hobbies. Keyword format, comma-separated.

**Kink (Presets):**
Vanilla | Bondage | Edging | Threesome | Feet | Humiliation | Cuckolding |
Findom | Stories | Step Fantasy | Sadistic | Masochist | Orgy |
Exhibitionist | Voyeurism

**Kink (Custom):** 5000 char
> 2nd person. Formula: hunger + power dynamics + scene beat.
> Concrete objects, micro-tells, power verbs. Visceral and specific.

---

## NARRATIVE CONTEXT

**About Me:** large char limit
> 1st person, 200+ words. Biography AND system prompt.
> Sets tone, pacing, default behaviours.
> Should imply why the user matters to this character.

**Memory:** large char limit
> Leave blank for new characters.
> Used for ongoing narrative, story beats, shared history as relationship develops.

---

## FIELD INFLUENCE QUICK REFERENCE

| Field | When It's Active | What It Does |
|-------|-----------------|--------------|
| Personality | Always | Core identity, consistent throughout |
| Relationship | Always | Filters how Personality expresses toward user |
| Kinks | NSFW interactions | Sexual personality and behaviour |
| Occupation | Initial + blended | First impression, fades as Personality takes over |
| About Me | Initial (strong) | Tone, pacing, opening topics — fades over time |
| Hobbies | Decorative | Minor texture, routine suggestions |
