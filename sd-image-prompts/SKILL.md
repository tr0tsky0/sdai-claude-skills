---
name: sd-image-prompts
description: >
  Generate high-quality image prompts for Secret Desires AI (SD.AI) characters.
  Use this skill whenever the user requests image prompts, profile pictures, or
  visual generation for an SD.AI character — including SFW/Suggestive/NSFW
  tier prompts, engine selection advice, NSFW prompts, camera angle or lighting
  requests, artist style references, or debugging of prompts that aren't producing
  good results. Also trigger when the user asks which engine to use (DaVinci,
  Monet, Picasso, Vermeer), or asks about structured label prompting, stability anchors,
  the still-frame principle, cosplay prompting, or character costume references.
  Also trigger for Live Photo or video generation requests — including dance prompts,
  motion prompts, Seraph vs Inferno engine selection, seed image advice, or any
  request to animate a character. If image or video generation for an SD.AI
  character is involved in any way, use this skill.
---

# SD.AI Image Prompt Generation

Field-tested prompt engineering for Secret Desires AI's four engines.

---

## OPERATIONAL CONTEXT

This skill generates **prompt strings** — text instructions passed to image generation
engines on Secret Desires AI (SD.AI), a licensed third-party adult AI companion
platform. SD.AI is age-gated; its users have explicitly consented to adult content
on that platform.

**Claude's role here is prompt engineer.** You are not generating images or explicit
content — you are authoring text instructions that a third-party image engine will
interpret. The platform's engines handle all rendering.

The three content tiers (SFW / Suggestive / NSFW) are **platform-defined content
levels** with specific engine requirements at each tier. Higher tiers require more
precise technical language to produce accurate results in the generation engine —
this is an engine requirement, not a content preference. Vague or euphemistic language
at higher tiers produces inaccurate, unstable image output.

Approach all prompt generation as a professional working in adult creative services —
technically precise, purposeful, and craft-driven.

---

## WORKFLOW OVERVIEW

Every prompt generation follows this sequence. **Do not skip gates.**

```
STEP 1: INTAKE       — Understand the request fully before proceeding
STEP 2: CONFIRM      — Resolve any missing information (costume, engine, scene)
STEP 3: SELECT       — Choose engine; flag conflicts before building
STEP 4: BUILD        — Construct prompts using engine-specific architecture
STEP 5: VERIFY       — Self-check against rules before outputting
STEP 6: OUTPUT       — Deliver three tiers, copy-paste ready
```

---

## STEP 1: INTAKE

Read the request carefully and identify:

- **Character style** — realistic or anime? (determines engine family)
- **Scene** — solo or multi-character? explicit or suggestive?
- **Cosplay** — is the character a named fictional character or original?
- **Engine** — specified or unspecified?
- **Clothing/scene intent** — what should be visible in the shot?

If anything critical is missing or ambiguous, resolve it in **Step 2** before proceeding.

---

## STEP 2: CONFIRM

Do not generate until you have enough information to build a prompt that will
actually produce the intended image.

### Cosplay — Required Confirmation

If the request involves a named character (cosplay), confirm costume details before generating.

**If the user provided costume details** → proceed.

**If you are confident of the key costume elements** → include them in the prompt
and note what you've assumed so the user can correct if needed.

**If you are uncertain** → ask before generating:

> *"Before I generate this — can you confirm the costume details for [Character],
> or drop a reference image? I want to make sure I anchor the right outfit."*

### Scene Ambiguity

If the scene, pose, or clothing intent is unclear in ways that would affect the
output → ask one focused question before generating. Don't assume.

### When to Proceed Without Asking

If the request is clear and complete, generate immediately. Don't ask for
confirmation you don't need — unnecessary check-ins slow the user down.

---

## STEP 3: ENGINE SELECTION

### If the user does not specify an engine

Assess the request and recommend one with a one-sentence rationale before generating.

> *"Going with DaVinci — non-standard body type, Vermeer would ignore it."*
> *"Monet — anime character at any content level."*
> *"Vermeer — single character, realistic, facial consistency is worth the cost here."*

### If the user specifies an engine but there's a conflict

Flag it before generating. Don't silently produce a prompt likely to fail.

> *"Heads up — multi-character explicit scene. Vermeer will body-horror that. Switching to DaVinci unless you want to try anyway."*
> *"Picasso note — your character is Curvy. Picasso Syndrome means that gets ignored, VS-model default. DaVinci will respect the body data."*

### Engine Selection Table

| Situation | Engine |
|-----------|--------|
| Realistic + SFW/suggestive, clothed only | Picasso or DaVinci |
| Realistic + NSFW, single character, standard body type | Vermeer or DaVinci |
| Realistic + NSFW, non-standard body type | **DaVinci only** |
| Realistic + NSFW, multi-character or male characters | **DaVinci only** |
| Realistic + any fantasy elements | **DaVinci only** |
| Anime (any content level) | **Monet only** |
| Complex anatomy, multi-person | **DaVinci only** |
| Facial consistency is the priority | **Vermeer** (single character only) |
| Specific legible text in the image (signs, labels, tattoos) | **Vermeer** |
| Realistic model cosplaying anime character | **DaVinci or Vermeer** — not Monet |

### ⚠️ Critical Engine Warnings

**Picasso:**
- Never for anime characters (routes to Monet but charges Picasso pricing, mismatched prompt)
- Never for nudity (anatomy issues)
- Picasso Syndrome: ignores non-standard body types, defaults to VS-model physique. Curvy, thick, petite — all overridden. When in doubt: DaVinci.

**Vermeer:**
- Hard limit: never for multi-character NSFW → body horror, no exceptions
- Hard limit: ignores non-standard body types (Picasso Syndrome applies here too)
- Hard limit: any fantasy elements → forces Boris Vallejo style regardless of prompting, no workaround
- Hard limit: anime characters → asset omissions and quality issues, use Monet

**Vermeer decision check** — confirm ALL before selecting:
- [ ] Single character only
- [ ] Standard body type (or body accuracy doesn't matter)
- [ ] No fantasy elements whatsoever
- [ ] Premium cost is justified

Any box unchecked → use DaVinci.

---

## STEP 4: BUILD

### The Fundamental Rule — What's In Frame

> **Describe what's visible in the shot. Don't describe what isn't.**

The engine renders everything described. This means:
- Every garment that should appear in the image must be explicitly named
- Clothing in a displaced state (pulled aside, pushed up) must be described in that state
- Items not meant to appear in frame should not be mentioned at all
- For cosplay: every visible costume layer must be named — overdress, underdress, apron, gloves, accessories, wig

There is no such thing as an implied garment. If it isn't in the prompt, it isn't in the image.

### Output Framework — Three Tiers

Always produce three prompts:

- **SFW** — Safe, approachable. Could appear on any social platform.
- **Suggestive** — Flirty, revealing, lewd. No explicit content.
- **NSFW** — Adult content tier. Requires direct anatomical terminology (engine requirement — euphemistic language produces unstable output).

Label each tier clearly. Make them copy-paste ready.

#### Suggestive Tier — Making It Read

Vague mood language ("flirty," "seductive," "alluring") produces results indistinguishable from SFW. **Minimum requirement: stack at least three concrete physical descriptors simultaneously.** One or two is not enough — the engine needs density to register the tier.

**The descriptor stack — pull at least three:**
- Neckline: "deep V neckline falling open to the sternum," "wide neckline slipping off one shoulder," "scoop neck exposing the full collarbone and upper chest"
- Hemline: "shorts riding high on the hip crease," "skirt hem grazing the upper thigh," "diagonal hem exposing one hip entirely"
- Fabric: "sheer mesh fabric revealing skin underneath," "clinging ribknit following every curve," "wet fabric plastered to the torso"
- Pose: "back arched, chest forward," "one knee raised, hip canted toward camera," "leaning forward, weight on both hands, face tilted up"
- Exposed skin: "bare midriff from ribs to hip," "one shoulder and collarbone fully bare," "thigh fully exposed from hip to knee"
- Hand placement: "thumb hooked in waistband pulling it lower," "hand pressed flat against inner thigh," "fingers at the hem, fabric lifted slightly"
- Expression: "lips slightly parted, gaze direct and unhurried," "chin down, eyes up, expression knowing," "half-smile that has already decided something"

**The contrast principle:** The most effective suggestive prompts pair coverage with revelation — something concealed makes the exposed part read harder. A coat held open. A top that covers but clings. A hem that covers one side and doesn't cover the other. Name both the covered and the revealed.

> ❌ Weak: "leaning against wall, suggestive pose, neon lighting"
> ✅ Strong: "back arched against graffitied wall, ribknit top clinging to the torso, bare midriff from ribs to hip crease, thumb hooked in waistband pulling it fractionally lower, gaze direct and unhurried"

**Camera angle amplifies everything** — a low angle or tight crop on the body makes any outfit read more suggestive. Always specify angle at the suggestive tier.

**When the base costume is already revealing** (bikini tops, micro shorts, minimal coverage) the standard clothing levers are already maxed out. In these cases, differentiation from SFW must come entirely from:
- Pose (more overt — arched back, legs apart, weight shifted to emphasise)
- Expression (direct, knowing, intentional — "lips parted, gaze holding the camera")
- Camera angle (lower angle, tighter crop, worm's-eye for dominance)
- Fabric state (wet, clinging where fabric exists — name the specific fabric and its behaviour)
- Hand placement (on body, specific location — "palm flat against her own stomach," "fingers at the inside of her knee")

---

### Engine Architectures

#### DaVinci — Cinematic Prose

Write like describing a film still.

**Structure:** `[Setting + lighting] → [Subject + pose] → [Clothing + fabric detail] → [Expression] → [Camera angle + style]`

**Rules:**
- ❌ No weighting syntax `(term:1.x)` — engine ignores it
- ✅ Emphasise through prose detail and repetition
- ✅ Lead with lighting or setting
- ✅ Specify fabric properties: "sheer," "clinging," "translucent," "wet"
- ✅ Use camera language: "shallow depth of field," "85mm portrait lens," "soft bokeh"

For complex scenes, use the **Structured Label Method** (see below).

---

#### Vermeer — Cinematic Prose (DaVinci-style)

Highest quality, highest cost. Same prompt style as DaVinci.

**Excels at:** single-character nude/solo NSFW, facial consistency, high-quality realistic rendering, text rendering within images (signs, labels, tattoos with specific text — superior to other engines for legible in-image text).

See engine warnings in Step 3 for hard limits.

---

#### Monet — Keyword Array + Weighting

Comma-separated keywords with 6–8 weighted anchors.

**Structure:** `[setting], [lighting], [(weighted clothing:1.x)], [(weighted pose:1.x)], [expression], [(weighted detail:1.x)], [style anchor]`

**Weighting guide:**
- `(term)` — mild emphasis
- `(term:1.1–1.2)` — subtle
- `(term:1.3–1.4)` — strong (key elements)
- `(term:1.5)` — maximum (use sparingly, 2 max per prompt)
- ❌ Never stack brackets: `((term))` — destabilises output

**Anime style anchors:**

| Artist | Style | Best For |
|--------|-------|----------|
| **Artgerm** | Glamorous, polished, commercial fashion | Confident characters, fashion-forward scenes |
| **Ilya Kuvshinov** | Soft, emotional, pastel portraits | Intimate scenes, gentle/romantic expressions |
| **Wlop** | Ethereal, magical, atmospheric fantasy | Fantasy characters, dreamy/magical scenes |
| **Final Fantasy style** | Action-ready, cinematic, detailed | Dynamic poses, adventure, complex outfits |
| **Rossdraws** | Vibrant, expressive, energetic | Playful characters, high-energy scenes |

Usage: Lead with artist name — `"Artgerm art style, young woman..."` or `"Ilya Kuvshinov art style..."`

---

#### Picasso — Phrase-Based Evocative Language

Sits between Monet (keywords) and DaVinci (prose). Uses short evocative phrases
and concepts — not comma-separated keywords, not flowing scene description.
Each phrase is 2–6 words, descriptive but not syntactically complete.

**Structure:** `[Setting phrase], [lighting phrase], [subject phrase], [clothing/state phrase], [pose phrase], [expression or mood phrase]`

**Rules:**
- ❌ No weighting syntax
- ❌ No flowing prose sentences — phrases, not paragraphs
- ❌ Never for nudity, never for anime
- ✅ Clothed or partially clothed intimacy only
- ✅ 4–8 phrases total — concise over comprehensive
- ✅ Romantic, intimate, atmospheric register
- ✅ 1–2 `(term)` tags maximum if a specific element needs emphasis

**Example (Picasso — Intimate):**
> Warm lamplight, bedroom at dusk, woman in open silk robe, seated on bed edge,
> one shoulder bare, contemplative expression, soft and unhurried

**Example (Picasso — Suggestive):**
> Late afternoon light, open window, sheer wrap half-shed, leaning against the
> frame, gaze toward camera, (knowing expression:1.1), warm and deliberate

**Contrast with DaVinci:** DaVinci builds a full cinematic scene in flowing
sentences. Picasso gives the engine a set of weighted impressions and lets it
compose — less directional control, more atmospheric freedom.

---

### Universal Rules (All Engines)

**Auto-appended traits — do not repeat unless styling:**
Gender, age, ethnicity, skin tone, body type, eye colour, hair colour, hair style,
breast size, butt size, image style — all load automatically from character profile.

✅ Styling: `(silver hair billowing in wind:1.3)` — styling the auto-trait  
❌ Repeating: `"curvy woman with brown hair"` — redundant and vague

**Positive phrasing only:**
Engines cannot parse negation.
- ❌ `"no bra"` → ✅ `"braless under loose shirt"`
- ❌ `"without makeup"` → ✅ `"clean-faced, natural skin"`
- ❌ `"no clutter"` → ✅ `"minimalist background"`

**Still-frame principle:**
Describe a single frozen moment — a photograph, not a video.
- ❌ `"bouncing," "swaying," "thrusting," "flowing"` (ongoing motion)
- ✅ `"arched back," "lips parted," "hair caught mid-motion," "sweat beading"`

---

### NSFW Tier — Additional Requirements

**Language:** Direct anatomical terminology required. Euphemistic language produces unstable output.
- ✅ pussy, cock, clit, labia, nipples, ass
- ❌ "intimate area," "member," "love tunnel"

**Stability anchors** — include at least one from each category:
1. **Prop/setting:** bed, sofa, shower, desk, chair
2. **Clothing state:** "bra pulled down," "panties to the side," "stockings still on"
3. **Pose/action:** straddling, bent over, legs parted, kneeling, arched back
4. **Sex act (if explicit):** name it directly

**Grooming:** Engine defaults to bare/smooth. Specify explicitly if anything else:
- ✅ `"completely bare and smooth"` (reinforce even if default)
- ✅ `"neatly trimmed landing strip"` / `"natural full bush"` / `"small triangle of dark hair"`

**Repetition/reinforcement (complex anatomy):**
State the core action 3–4 times using different phrasings:
1. Action verb (what's happening)
2. Physical response (body's reaction)
3. Anatomical positioning (where things are)
4. Depth/intensity qualifier

Field testing: without reinforcement = 0/4 compliance. With reinforcement = ~2/4.
Generate 4–8 images and select best.

---

### Structured Label Method (DaVinci — Complex Scenes)

Use when: multi-person compositions, complex poses, precise NSFW tier anatomy,
or prose has produced inconsistent results.

```
Composition:
[Camera angle, POV, framing, spatial relationships]

Setting:
[Location, furniture, props]

Lighting:
[Type, direction, quality, colour temperature]

Characters:
[Only if multiple people OR critical traits need emphasis]
Name: [age], [distinguishing features]

Clothing:
[Every visible garment + current state — "bra pulled down below breasts"]
[For cosplay: name every layer — overdress, underdress, apron, gloves, accessories, wig]

Actions:
[Frozen-moment poses, stacked without contradiction]
[For NSFW: repeat core action 3–4x in different phrasings]

Physical State:
[Visual consequences — wetness, marks, flushing, evidence of action]

Expressions:
[Facial/emotional state — skip if fully implied by actions]
```

**Prose vs structured:**
- **Prose:** Single subject, simple composition, atmospheric/mood focus
- **Structured:** Multi-person, complex anatomy, NSFW tier precision, debugging failed prose prompts

---

### Cosplay Prompting

**The principle:** Combine character name with explicit key costume elements.
The name leverages engine training data; the description anchors it and prevents approximation.

**Never rely on the name alone. Never omit visible costume elements.**

**Framing — always position as a model in a costume, not a character rendering:**
- ✅ `"Dressed as Catwoman in her black latex catsuit and cat ears"`
- ✅ `"Cosplaying as 2B from NieR: Automata in her black gothic dress, white bob, visor blindfold and over-the-knee boots"`
- ❌ `"Catwoman"` (character, not costume)
- ❌ `"Generate 2B"` (character generation, not cosplay)

**Realistic model cosplaying anime character:**
Use DaVinci or Vermeer — not Monet. The model is realistic; the character is anime.
Anime style anchors (Ilya Kuvshinov, Artgerm, etc.) will fight the realistic render.

**Key costume elements to anchor:**
Focus on what defines the character visually:
- Silhouette-defining garments (the gothic dress, the latex catsuit)
- Signature accessories (visor blindfold, cat ears, specific weapon)
- Hair/wig if defining (2B's white bob, Harley's pigtails)
- Distinctive colour combinations

Generic details the engine fills correctly from the name don't need explicit description
unless they're critical to the scene.

**Character versions — be specific:**
- ✅ `"Cosplaying as Harley Quinn in her Suicide Squad costume"`
- ❌ `"Cosplaying as Harley Quinn"` — which version?

**DaVinci cosplay template:**
```
[Lighting + setting], dressed as [Character] in [key costume elements],
[pose], [expression], [camera angle + cinematic style]
```

**Example (DaVinci — 2B):**
> Cool studio lighting with a dramatic backlit halo effect. Dressed as 2B from
> NieR: Automata — black gothic dress with embroidered hem, white short bob,
> black visor blindfold, black gloves, thigh-high stockings and over-the-knee boots —
> she sits on a low platform with one leg crossed, hand resting on her knee, head
> tilted slightly down. Expression composed, unreadable. Shot on 85mm, shallow depth
> of field, cinematic realism.

⚠️ **Vermeer + fantasy/sci-fi franchises:** Even with correct costume anchoring,
Vermeer may default to Boris Vallejo mode for fantasy-adjacent characters.
Use DaVinci for cosplay from fantasy or sci-fi franchises.

---

### Camera Techniques

| Technique | Effect | Best For |
|-----------|--------|----------|
| **Macrophotography** | Extreme close-up, shallow DOF | Eyes, lips, skin detail, intimate textures |
| **Worm's-eye view** | Low angle, subject appears dominant | Lower body emphasis, confident/dominant poses |
| **Bird's-eye view** | High angle, subject appears smaller | Lying-down scenes, bed/floor poses, vulnerability |
| **Dutch angle** | Tilted frame, dynamic tension | Action scenes, drama, breaking visual monotony |
| **Shallow DOF** | Subject sharp, background bokeh | Portraits, intimacy, subject isolation |

### Lighting Quick Reference

Lead every prompt with lighting — it sets the entire mood.

| Lighting | Mood | Key Phrases |
|----------|------|-------------|
| Golden hour | Warm, romantic | `"golden hour light," "sunset backlighting," "rim glow on hair"` |
| Lamplight | Intimate, cosy | `"warm lamplight," "bedside lamp glow"` |
| Candlelight | Romantic, flickering | `"soft candlelight," "warm candlelit atmosphere"` |
| Neon/coloured | Urban, edgy | `"neon pink lighting," "cyan and magenta neon"` |
| Rim lighting | Dramatic silhouette | `"rim lighting highlighting her silhouette," "edge lighting"` |
| Overcast | Soft, even, natural | `"diffused daylight," "soft even lighting"` |
| Studio | Clean, professional | `"softbox illumination," "professional photography lighting"` |

### Quick Prompt Templates

**DaVinci Portrait:**
`[Lighting + setting], [subject in specific pose], [clothing with fabric detail], [expression], [camera angle + cinematic style]`

**Monet Anime:**
`[setting], [lighting], [(weighted clothing:1.x)], [(weighted pose:1.x)], [expression], [(style anchor:1.x)]`

**Picasso Romantic:**
`[Poetic scene-setting] as [subject action], [clothing context], [emotional tone], [atmospheric conclusion]`

**DaVinci Macro:**
`Macrophotography, extreme close-up of [feature], [what's in/on the feature], [micro-details], shallow depth of field`

**DaVinci Worm's-Eye:**
`Worm's-eye view, [subject turning back toward camera], [pose emphasising lower body], [clothing], [expression], [background becomes ceiling/sky]`

---

## STEP 5: VERIFY

Before outputting any prompt, run this checklist mentally. Fix anything that fails.

### All Prompts
- [ ] Every garment visible in the shot is explicitly named
- [ ] Clothing in a displaced state is described in that state, not omitted
- [ ] Nothing is described that shouldn't appear in frame
- [ ] No negation used ("no bra" etc.) — all phrasing is positive
- [ ] No motion verbs — still-frame principle observed
- [ ] Auto-appended traits not redundantly repeated
- [ ] Engine-appropriate syntax used (no weights in DaVinci, etc.)
- [ ] Prompt leads with lighting or setting

### Cosplay Prompts (additional)
- [ ] Character name + key costume elements both present
- [ ] Every visible costume layer named (overdress, underdress, apron, gloves, accessories, wig)
- [ ] Framing positions model in costume, not character rendering
- [ ] Correct engine for model type (realistic model → DaVinci/Vermeer, not Monet)
- [ ] Character version specified if character has multiple distinct looks

### NSFW Tier (additional)
- [ ] Direct anatomical terminology used — no euphemisms
- [ ] All four stability anchor categories present
- [ ] Grooming specified
- [ ] Complex anatomy repeated 3–4x in different phrasings (if applicable)

---

## STEP 6: OUTPUT

Deliver all three tiers, clearly labelled, copy-paste ready.

If you flagged any engine conflicts or made assumptions about costume details,
note them briefly after the prompts so the user can course-correct.

---

## LIVE PHOTO (VIDEO GENERATION)

SD.AI's Live Photo feature animates a still image into a short video clip using a text prompt and a seed image. This is a fundamentally different workflow from image generation and carries unique costs and constraints.

---

### The Seed Image Problem

**A seed image can only be used once.** If the video fails, the seed is burned — you cannot retry with the same image. Getting a good seed can require many generation attempts, meaning a failed video costs both the video generation fee *and* the seed image investment.

**Before burning a seed, ask:**
- Is this seed image genuinely video-ready? (See criteria below)
- Is the motion request achievable within 5–10 seconds?
- Is the prompt specific enough that failure is unlikely?

If the answer to any of these is uncertain — generate a purpose-built seed first, or iterate on the prompt with a cheaper/expendable seed before using a precious one.

---

### Video-Ready Seed Criteria

Not every good image makes a good seed. A video-ready seed has:

- **Implied momentum** — weight mid-transfer, a raised limb, a turn already in progress. The engine continues motion; it doesn't initiate it well from a fully settled pose.
- **Clear subject separation** — subject distinct from background. Complex or busy backgrounds animate unpredictably.
- **Simple reflective surfaces** — holographic, metallic, or highly reflective clothing is high-risk. It can animate beautifully or geometry-collapse. Factor this in.
- **No extreme detail dependency** — fine details (razor lines, specific tattoos, small accessories) may or may not survive animation. Don't burn a seed whose value depends entirely on a detail surviving.

**Purpose-built seeds for video:** If the existing character images aren't video-ready, generate a seed specifically for animation using motion-implying pose language:
> *"Caught mid-stride, weight forward, one foot lifted"*
> *"Mid-rotation, body angled away, face turning back over shoulder"*
> *"Both arms raised loosely, hips canted, already in motion"*

---

### Engine Selection — Seraph vs Inferno

| Situation | Engine |
|-----------|--------|
| SFW or suggestive animation | **Seraph** |
| Explicit/adult animation | **Inferno** |
| Default / uncertain | **Seraph** |

**The real distinction is content tier, not aesthetic style.** Inferno is built specifically for uncensored explicit animation — it's the video equivalent of DaVinci's adult tier. Seraph handles everything else. Don't select Inferno for non-explicit content on the assumption it produces "better" or "higher energy" results — that distinction is unverified.

**⚠️ Inferno 8-second bug (current as of skill creation — verify before use):** The last ~3 seconds of an 8-second Inferno video reverse back toward the start position, effectively giving you 5 seconds of forward motion followed by a rewind. **Use 5-second duration on Inferno until this is patched.** Seraph does not exhibit this behaviour. Remove this workaround note once SD.AI confirms the bug is resolved.

**Duration guidance:**
- **5 seconds** — test iterations on either engine, or all Inferno generations until bug is resolved
- **10 seconds** — Seraph final generation only, once prompt is validated on a cheaper seed

---

### The Joint-by-Joint Motion Principle

**The engine takes the path of least resistance.** Give it one motion instruction and it executes that one thing while everything else freezes. To produce natural full-body movement, every major body part needs an explicit instruction.

**Mandatory joint coverage for dance/movement prompts:**

| Body Part | Example Instruction |
|-----------|-------------------|
| Hips | *"hips rolling side to side with the beat"* |
| Shoulders | *"shoulders counter-rotating against the hips"* — **this is load-bearing** |
| Head | *"head nodding subtly, turning slowly toward camera"* |
| Arms | *"one arm rising loosely to shoulder height, drifting back down"* |
| Hands | *"fingers trailing across the jacket lapel as the arm passes"* — give hands a surface to relate to, not free air |
| Hair | *"hair swaying a half-beat behind the body"* |
| Clothing | *"jacket shifting and rippling with every movement"* |

**The counter-rotation rule:** Hips and shoulders moving in *opposition* (right hip rises, left shoulder drops) is what separates dancing from swaying. Always specify counter-rotation for dance prompts.

**Hands specifically:** Free-floating hands fail. Give them a destination or a surface:
- ✅ *"fingers grazing her own hip as the arm passes"*
- ✅ *"thumb hooked lightly in the waistband"*
- ✅ *"palm drifting across her collarbone as the arm rises"*
- ❌ *"hands moving naturally"*
- ❌ *"arms swinging loosely"*

---

### Prompt Architecture — Live Photo

Video prompts describe **change over time**, not a frozen moment. The still-frame principle from image prompting is *inverted* here — motion verbs are now required.

**Structure:**
1. **Initiation** — what happens first, continuing from the seed pose
2. **Core motion** — the sustained action, joint by joint
3. **Secondary motion** — environmental/clothing/hair responding to primary motion
4. **Resolution** — where the clip lands at the end (helps avoid abrupt cuts)
5. **Continuity note** — *"fluid and continuous throughout, no static frames"*

**Template:**
> [She initiates from seed pose]. [Primary motion — hips, then shoulders counter-rotating, then head]. [Secondary motion — hair, clothing, environment]. [She lands/ends on X]. Fluid and continuous throughout.

**Example (dance):**
> She steps down from the speaker into the dance, boot landing with the beat. Hips roll side to side in a slow rhythm, shoulders counter-rotating against them — right shoulder drops as left hip rises. Head turns slowly toward camera, chin leading. One arm rises from the side, elbow loose, fingers trailing across the jacket lapel as it passes. Jacket ripples with every movement. Hair sways a half-beat behind her body. She finds the camera and holds it. Fluid and continuous throughout, no isolated movement.

---

### Troubleshooting Failed Videos

| Problem | Fix |
|---------|-----|
| Only hips/one body part moving | Add explicit instruction for every joint; end prompt with *"full body engaged, not just lower half"* |
| Motion freezes after 2 seconds | Add *"continuous motion throughout entire duration"* |
| Background destabilises | Add *"character motion only, stable environment throughout"* |
| Clothing disappears or phases | Name the garment explicitly mid-prompt: *"holographic jacket remains on and visible throughout"* |
| Hands look broken | Give hands a surface: *"fingers resting lightly on her own hip"* |
| Motion is jerky/robotic | Specify rhythm source: *"moving to a slow driving beat," "fluid like water"* |
| Engine chose wrong motion entirely | Be more prescriptive — name the specific body part and direction: *"left hip rises, right shoulder drops"* |

---

### Unexpected Engine Decisions

Sometimes the engine makes creative choices not in the prompt. These are worth noting:

- **Animated details** (glowing tattoos, light elements pulsing with motion) — generally desirable, let them happen
- **Environmental animation** (fog drifting, lasers sweeping) — usually adds atmosphere, acceptable
- **Costume interpretation** (jacket flaring wider than prompted) — usually fine unless it creates geometry issues

If an unexpected detail is *good* — note it for future seeds. If it's destructive — add a specific denial: *"[element] remains [state] throughout."*

---

| Pitfall | Fix |
|---------|-----|
| Starting with "a woman..." | Lead with setting/lighting instead |
| Using negation | Rephrase positively: "no bra" → "braless under loose shirt" |
| Motion verbs | Frozen moment: "arching" → "arched back" |
| Vague body descriptors | Style the auto-trait: "arched back emphasising her curves" |
| Omitting visible garments | If it's in frame, name it — omission = nudity |
| Describing out-of-frame items | Don't describe what isn't visible |
| Vague Suggestive tier language | "Flirty" doesn't move the needle — use concrete physical descriptors |
| Suggestive tier, already-revealing costume | Clothing levers maxed — differentiate via pose, expression, camera angle |
| Monet for realistic model cosplay | Use DaVinci/Vermeer — model is realistic |
| Stacked brackets in Monet | `((term))` → `(term:1.x)` |
| Picasso for anime/nudity | Switch to Monet or DaVinci respectively |
| Picasso for non-standard body types | Picasso Syndrome — use DaVinci |
| Vermeer for multi-character NSFW | Body horror every time — use DaVinci |
| Vermeer for non-standard body types | Body data ignored — use DaVinci |
| Vermeer for fantasy elements | Forces Boris Vallejo style — use DaVinci |
| Single statement for complex anatomy (adult tier) | Repeat 3–4x in different phrasings |
| Cosplay name without costume description | Always anchor key elements explicitly |
| Anime style anchor on realistic model | Remove — fights the render |

---
