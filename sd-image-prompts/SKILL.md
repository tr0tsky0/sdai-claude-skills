---
name: sd-image-prompts
description: >
  Generate high-quality image prompts for Secret Desires AI (SD.AI) characters.
  Use this skill whenever the user requests image prompts, profile pictures, or
  visual generation for an SD.AI character — including SFW/Suggestive/NSFW
  tier prompts, engine selection advice, NSFW prompts, camera angle or lighting
  requests, artist style references, or debugging of prompts that aren't producing
  good results. Also trigger when the user asks which engine to use (Monet,
  Picasso, Da Vinci, Vermeer, Rafael), or asks about structured label prompting,
  stability anchors, the still-frame principle, cosplay prompting, or character
  costume references. Also trigger for Live Photo or video generation requests —
  including dance prompts, motion prompts, video seed image advice, or any
  request to animate a character. If image or video generation for an SD.AI
  character is involved in any way, use this skill.
---

# SD.AI Image Prompt Generation

Field-tested prompt engineering for Secret Desires AI's five engines.

---

## PLATFORM REFERENCE

**SD.ai Engine Mapping:**

| Platform Name | Architecture | Token Limit |
|---|---|---|
| Monet | Keyword + weighting | 75 tokens |
| Picasso | Natural language (short phrases) | Unlimited |
| Da Vinci | Natural language (prose) | Unlimited |
| Vermeer | Natural language + structured labels | 75 tokens |
| Rafael | Natural language (LLM-powered) | 1000 tokens |

**Note on Rafael:** Brand new engine (June 2026). Experimental; face inconsistency issues identified. Only recommend if user specifically requests. Use Da Vinci as fallback.

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

### What SD.AI Does With Your Prompt

The prompt this skill generates is not the complete input the engine receives. SD.AI
constructs the final engine prompt from multiple sources:

- **Character profile fields** (hair colour, eye colour, skin tone, body type, breast
  size, butt size, image style) are appended to the user prompt automatically. This is
  why the skill instructs you not to restate those traits — they're already in the
  engine's input.
- **Face compositing:** The platform extracts face data at character creation and composites
  it onto generated images as a post-process step. This is separate from the diffusion
  process — eye colour and facial features are fixed at creation time, not prompt time.
  Vermeer is the exception: it bypasses the composite and uses the current PFP as a live
  diffusion seed instead. See **The Face Compositing System** in Step 4 for full detail.
- **A platform-level negative prompt** may also be injected before the prompt reaches
  the engine. Whether SD.AI does this, and what it suppresses, is not visible to users.
  The exact behavior is undocumented.

**Practical implication:** When the skill recommends positive anchors to compensate for
potentially missing negative suppression (e.g., `RAW photo` to counter anime drift in
Da Vinci), those anchors may be partially or fully redundant if the platform is already
providing that suppression invisibly. Treat them as a safety net whose necessity is
unconfirmed — they don't hurt, and they reinforce the target aesthetic regardless of
what the platform provides.

The final prompt submitted to the engine is not visible. Build for what you can control.

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
- **Body type** — standard or non-standard? (critical for engine selection)

**Character context:** Most requests arrive in a conversation that already built the
character — pull expression, pose energy, scene setting, and tier register from her
Personality, Kinks, and Occupation fields. A composed character cracks differently
than a warm one; the prompt should know which it's writing. If there is no character
context in the conversation and the request is for a specific character, ask for two
or three personality details — enough to make a living image instead of a mannequin.
Fully generic requests with no character implied proceed without asking.

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

> *"Going with Da Vinci — curvy body type, Monet/Vermeer/Rafael would normalize that."*
> *"Monet — anime character at any content level."*
> *"Vermeer — single character, realistic, facial consistency is worth the cost here."*

### If the user specifies an engine but there's a conflict

Flag it before generating. Don't silently produce a prompt likely to fail.

> *"Heads up — multi-character explicit scene. Vermeer will body-horror that. Switching to Da Vinci unless you want to try anyway."*
> *"Note — your character is Petite. Monet/Vermeer/Rafael underperform on non-standard body types. Da Vinci or Picasso will respect that better."*

### Body Type Consideration (NEW)

**VSM Syndrome:** Monet, Vermeer, and Rafael all tend to render default/normalized body types rather than respecting non-standard builds (Curvy, Thick, Petite). 

**If character body type is non-standard (Curvy, Thick, Petite):**
- ✅ **Best:** Da Vinci (respects body data most consistently)
- ✅ **Good:** Picasso (respects body data reasonably well)
- ⚠️ **Avoid:** Monet, Vermeer, Rafael (normalize to default proportions)

---

### Engine Selection Table

| Situation | Engine | Notes |
|-----------|--------|-------|
| Realistic + SFW/suggestive, clothed only | Picasso or Da Vinci | Picasso good for body type respect |
| Realistic + NSFW, single character, standard body type | Vermeer or Da Vinci | Vermeer good for facial consistency |
| Realistic + NSFW, non-standard body type | **Da Vinci** | Only engine that respects body type in NSFW |
| Realistic + NSFW, multi-character or male characters | **Da Vinci only** | Vermeer produces body horror with multi-character |
| Realistic + any fantasy elements | **Da Vinci only** | Vermeer forces Boris Vallejo style |
| Anime (any content level) | **Monet only** | No alternatives for anime |
| Complex anatomy, multi-person | **Da Vinci only** | Only reliable for complexity |
| Facial consistency is the priority | **Vermeer** | (single character only) |
| Legible text in the image (signs, labels, tattoos) | **Vermeer** | Proven text rendering capability |
| User specifically requests Rafael (experimental) | **Rafael** | Flag face inconsistency risk; suggest Da Vinci as backup |

### ⚠️ Critical Engine Warnings

**Monet:**
- **Body type weakness:** VSM Syndrome — normalizes non-standard body types. For Curvy/Thick/Petite characters, recommend Da Vinci or Picasso instead.

**Picasso:**
- **Body type:** Actually respects body data reasonably well; good for non-standard types
- Works for clothed or partially clothed content
- Not recommended for full nudity (anatomy quality issues in NSFW)
- Never for anime characters

**Da Vinci:**
- No significant weaknesses
- Handles all body types, all content levels, all complexity
- Most reliable fallback

**Vermeer:**
- **Body type weakness:** VSM Syndrome — ignores non-standard body types. Curvy/Thick/Petite get normalized. Use Da Vinci instead.
- Hard limit: never for multi-character NSFW → body horror, no exceptions
- Hard limit: any fantasy elements → forces Boris Vallejo style regardless of prompting, no workaround
- Hard limit: anime characters → asset omissions and quality issues, use Monet
- **Strength:** Facial consistency (single character); text rendering (signs, labels, tattoos)

**Vermeer decision check** — confirm ALL before selecting:
- [ ] Single character only
- [ ] Standard body type (or non-standard body type accuracy doesn't matter because facial consistency is the priority)
- [ ] No fantasy elements whatsoever
- [ ] Premium cost is justified
- [ ] PFP is set to a representative image of the intended character (mismatched PFP will fight your prompt)

Any box unchecked → use Da Vinci.

**Rafael (Experimental):**
- **Status:** Brand new (June 2026); not yet production-stable
- **Issue:** Inconsistent facial rendering between generations; different-looking character versions
- **Body type weakness:** VSM Syndrome — normalizes body types
- **Recommendation:** Only use if user specifically requests. Otherwise recommend Da Vinci
- **Future:** Monitor for stabilization; may become viable later
- **Fallback:** Always suggest Da Vinci if Rafael output is problematic

---

## STEP 4: BUILD

### USER PREFERENCE: SETTING AS CHARACTER *(apply to every prompt)*

The setting is not a backdrop. It is a co-protagonist. Every prompt must treat the environment with the same level of specificity, intention, and narrative weight as the subject herself.

**The test question:** Does the setting *do* something in this image — tell a story, create tension, establish world, react to the character — or is it just a room she's standing in?

**What this means in practice:**

- **Empty spaces are a last resort.** A character standing in an empty room, on an empty rooftop, against a plain wall — this is a failure of imagination unless emptiness is the point (isolation, minimalism, the void as character). Default toward populated, storied environments.
- **The setting should have a history.** What happened here before she arrived? What does this space *want*? A study has books with cracked spines and a half-burned candle. A garden has overgrown paths and a fountain that stopped working. A ballroom has chandeliers and masked dancers and black roses. Name the specific things.
- **The setting should react to the character, or create tension with her.** Light that behaves strangely near her. A space that is too grand for how empty it now is. A crowd that has parted. Architecture that mirrors her emotional state — crumbling but precise, gilded but cold.
- **Secondary elements carry narrative.** Objects on a desk. People in the background. The thing in the mirror. The door that shouldn't be open. The flowers that bloomed in a circle. These are not decoration — they are sentences in the image's story.
- **Depth and layers.** Foreground detail, mid-ground subject, background world. All three should be doing work. Shallow depth of field is a tool for intimacy, not an excuse for an empty background.

**Environments that earn their place:**
- A grand chapel with stained glass casting coloured light across stone — not just "a church"
- A study at midnight with a half-empty wine glass, wax seals, and letters already closed — not just "a room with a desk"
- A masquerade ballroom with chandelier light, masked guests, and black rose archways — not just "a ballroom"
- A fae threshold where the forest beyond glows wrong and the roots have broken through the floor — not just "a doorway"

**Prompt construction rule:** For every prompt, write the setting description *first*, in the same detail as the character description. If the setting paragraph is shorter than the character paragraph, it needs more work.

**This rule survives the NSFW tier.** Explicit prompts collapse most easily into "bed + body" — resist it. Sex happens somewhere specific: what room, what light, what objects, and the evidence of the moment — clothes where they fell, sheets dragged half off the mattress, two glasses on the nightstand, a chair pushed back too fast. At the NSFW tier the setting tells the story of how they got there.

---

### The Fundamental Rule — What's In Frame

> **Describe what's visible in the shot. Don't describe what isn't.**

The engine renders everything described. Describing something out of frame doesn't add context — it adds a conflicting instruction the engine will try to satisfy anyway, producing impossible geometry, body horror, or prompt drift.

**Clothing:**
- Every garment that should appear in the image must be explicitly named
- Clothing in a displaced state (pulled aside, pushed up) must be described in that state
- Items not meant to appear in frame should not be mentioned at all
- For cosplay: every visible costume layer must be named — overdress, underdress, apron, gloves, accessories, wig

There is no such thing as an implied garment. If it isn't in the prompt, it isn't in the image.

**Body parts and camera angle:**
Camera framing determines what anatomy is visible — and only visible anatomy should be described. Describing body parts that can't be seen from the chosen angle forces the engine to attempt impossible geometry.

- Shot from behind → describe back, shoulders, hair, rear — **not** breasts, stomach, or face
- Waist-up shot → describe torso, arms, face — **not** hips, legs, or feet
- Close-up of face → describe face, neck, collarbone — **not** full body details

> ❌ "Worm's-eye view from behind, her back to camera, large breasts visible, flat stomach"
> ✅ "Worm's-eye view from behind, her back to camera, strong shoulders, hair falling loose"

If the prompt specifies a camera angle, audit every body descriptor against it before finalising.

---

### Body-Type Clothing Assertiveness

On non-standard builds — full hourglass, heavy breasts, wide hips, thick thighs — the body data in your prompt is an active force competing with clothing descriptors. The engine renders the physics of garments against the described body and will prioritise body compliance over implied coverage.

**The rule:** On standard builds, implied clothing tends to render close to default because the body data isn't fighting it. On non-standard builds, any garment not explicitly described is likely to be absent or displaced.

This amplifies the standard "describe every visible garment" rule significantly:

- Name every garment visible in frame — omission equals absence or nudity
- Specify fit relative to the body: "fitted dark blazer" is insufficient — "fitted dark blazer pulling slightly across the shoulders, worn closed" tells the engine how the garment behaves against this specific body
- Specify bottom garments explicitly even when the scene focus is upper body — the engine will render what the body data implies if you leave a vacuum
- For coverage-critical shots, describe the clothing state assertively: "buttons fully fastened to the sternum, fabric pulling across the chest but contained"

The curvy build amplifies every clothing gap. Name everything, describe the fit, leave no vacuum.

### Output Framework — Tier Calibration

**Three tiers vs one:** The full three-tier set (SFW / Suggestive / NSFW) is for
**profile picture sets only** — character-gen Stage 3. For everything else, produce
one prompt at the tier the user specified or the tier implied by the request itself.
Never deliver three prompts when one was asked for.

**Tier calibration — this is an adult platform.** Each tier sits at the *top* of its
range, not the middle. An underdelivered tier is a failed prompt. Think
Facebook / Tinder / OnlyFans — or PG-13 / R / X:

- **SFW (Facebook, PG-13)** — fully presentable, never sterile. Magnetic, charged,
  flirtation welcome. The most attractive version of an image you could post
  anywhere. SFW skews suggestive.
- **Suggestive (Tinder, R)** — overt sexual intent without explicit nudity.
  Lingerie, undress in progress, wet or clinging fabric, hands placed where they
  mean something. Nudity implied, framed, or barely contained. Suggestive skews NSFW.
- **NSFW (OnlyFans, X)** — explicit nudity and/or sexual acts, always. Direct
  anatomical terminology (engine requirement — euphemistic language produces
  unstable output). If an NSFW prompt names no anatomy and no act, it isn't NSFW.

When in doubt about where a tier lands, calibrate up.

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

#### Monet — Keyword Array + Weighting

Comma-separated keywords with 6–8 weighted anchors. Uses tag-based architecture — its native language is keyword arrays, not prose.

**⚠️ Token limit: 75 tokens maximum.** Keep the tag list tight — prioritise the elements that matter most.

**Structure:** `[quality anchors], [setting], [lighting], [(weighted clothing:1.x)], [(weighted pose:1.x)], [expression], [(weighted detail:1.x)], [style anchor]`

**Quality anchors** (place at prompt start — 2–3 maximum, don't stack excessively):
- `masterpiece, best quality` — strong positive baseline
- `highly detailed` / `ultra-detailed` — detail density
- `detailed face, beautiful eyes` — counters eye quality issues this lineage is known for
- `perfect anatomy, correct proportions` — reduces limb and hand artifacts

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

**Body type consideration:**
- Monet normalizes non-standard body types (VSM Syndrome)
- For Curvy/Thick/Petite characters, use Da Vinci or Picasso instead

---

#### Picasso — Phrase-Based Evocative Language

Uses short evocative phrases and concepts — not comma-separated keywords, not flowing scene description.
Each phrase is 2–6 words, descriptive but not syntactically complete.

**The defining characteristic:** "The shorter the prompt, the better the result." This model interprets intent and fills compositional gaps creatively — long, exhaustive prompts fight against it.

**Trigger words** (documented quality/mood effects — use one or two to set register):
- `mj` — activates Midjourney-adjacent aesthetic quality
- `cozy` — warm, intimate atmosphere
- `cinematic` — film-like quality, dramatic lighting
- `masterpiece` — quality boost; performs at near-full strength here

**Structure:** `[trigger word(s)], [setting phrase], [lighting phrase], [subject phrase], [clothing/state phrase], [pose phrase], [expression or mood phrase]`

**Rules:**
- ❌ No weighting syntax — no brackets of any kind
- ❌ No flowing prose sentences — phrases, not paragraphs
- ✅ Clothed or partially clothed intimacy
- ✅ 4–8 phrases total — concise over comprehensive
- ✅ Romantic, intimate, atmospheric register

**Example (Picasso — Intimate):**
> Warm lamplight, bedroom at dusk, woman in open silk robe, seated on bed edge,
> one shoulder bare, contemplative expression, soft and unhurried

**Example (Picasso — Suggestive):**
> Late afternoon light, open window, sheer wrap half-shed, leaning against the
> frame, gaze toward camera, knowing expression, warm and deliberate

**Contrast with Da Vinci:** DaVinci builds a full cinematic scene in flowing
sentences. Picasso gives the engine a set of weighted impressions and lets it
compose — less directional control, more atmospheric freedom.

**Body type consideration:**
- Picasso respects body type data reasonably well
- Good option for non-standard body types (Curvy, Thick, Petite)

---

#### Da Vinci — Cinematic Prose

Write like describing a film still. Open every prompt with `RAW photo` — this is the single most effective anchor against anime/illustration style drift, which is this engine's primary failure mode without negative prompts.

**Structure:** `RAW photo, [setting + lighting] → [subject + pose] → [clothing + fabric detail] → [expression] → [camera angle + style]`

**Rules:**
- ❌ No weighting syntax `(term:1.x)` — engine ignores it; use natural language emphasis instead
- ✅ Open with `RAW photo` — anti-drift anchor, not just a quality signal
- ✅ Reinforce photographic register: `photorealistic, natural skin texture, film photography`
- ✅ Specify fabric properties: "sheer," "clinging," "translucent," "wet"
- ✅ Use camera language: `85mm portrait lens`, `shallow depth of field`, `soft bokeh`, `film grain`
- ✅ Film stock references activate specific aesthetic registers: `Fujifilm XT3`, `Kodak Portra 400`
- ✅ Resolution signals: `8k uhd`, `hyperrealistic`

**Anti-drift note:** This engine can drift toward semi-realistic aesthetic on female subjects. `RAW photo` + `photorealistic, natural skin texture` is the compensating stack — include both, especially in ambiguous prompts.

For complex scenes, use the **Structured Label Method** (see below).

**Body type consideration:**
- Da Vinci respects all body types excellently
- Best engine for non-standard body types (Curvy, Thick, Petite)
- Recommended fallback for complex body type requirements

**Worked example — full three-tier set (Da Vinci).** Character: cocktail bar owner, composed, slow-burn register. Setting written first, tiers calibrated to the top of their range:

> **SFW:** RAW photo, a closed cocktail bar an hour after last call, chairs up on tables, back-bar bottles glowing amber under brass picture lights, a rocks glass and a half-finished crossword abandoned on the counter. She leans back against the bar, fitted white shirt with sleeves rolled to the elbow and the top two buttons open, bar towel over one shoulder, head tilted, the half-smile of someone who has decided to let you stay past close. 35mm, shallow depth of field, warm tungsten grade, film grain, photorealistic, natural skin texture.

> **Suggestive:** RAW photo, the same bar gone darker, only the back-bar lights still on, rain streaking the front windows, red neon from the street pooling on the counter. She sits up on the bar itself, white shirt unbuttoned to the sternum and slipped off one shoulder, black lace bra visible beneath, skirt ridden high on bare crossed thighs, one heel hooked on a bar stool, thumb hooked in the waistband pulling it fractionally lower, chin down, eyes up, expression that has already decided something. Low angle, 50mm, shallow depth of field, photorealistic, natural skin texture.

> **NSFW:** RAW photo, the bar's back office after close, a worn leather couch under a single desk lamp, invoices swept onto the floor beside her dropped skirt, lace bra hanging from the lamp shade. She kneels on the couch facing camera, naked except for the white shirt hanging open off both shoulders, chest flushed, nipples hard, sweat sheen at her collarbone, thighs parted, pussy visibly wet, one hand braced on the couch back, the other flat against her own inner thigh, lips parted, eyes heavy-lidded. Lamplight chiaroscuro, 35mm, photorealistic, natural skin texture.

Note what carries each tier: the setting evolves with the scene and holds evidence (the crossword, the rain, the swept invoices); the suggestive tier stacks four concrete physical descriptors; the NSFW tier names anatomy, stacks body state (flush, nipples, sweat, wetness), and keeps the environment in frame.

---

#### Vermeer — Detailed Natural Language

Premium tier engine. Rewards **detailed, explicit prompt construction** more than Da Vinci does; sparse prompts still produce competent output but leave quality on the table.

**⚠️ Token limit: 75 tokens maximum.** Plan prompt length accordingly — dense detail within a tight budget.

**Official trigger words** (quality boost — include at least one):
- `Skin Textures` — activates detailed skin rendering
- `High Resolution` / `High-Resolution` / `High-Resolution Image` — clarity signal
- `Cinematic` — film-like quality, dynamic narrative feel

**Prompt component framework** (cover as many as the token budget allows):
Subject → Action → Environment/Setting → Object → Color → Style → Mood/Atmosphere → Lighting → Perspective/Viewpoint → Texture/Material → **Clothing** (must be explicit — engine defaults to nudity without it)

**Weighting syntax:** `(term:1.x)` has minimal or unpredictable effect on this engine's dual text encoders. Use natural language emphasis, adjective stacking, and leading position in the prompt instead.

**Positive anchors for quality reinforcement:**
- `natural eyes, realistic eyes, detailed irises` — eye artifact suppression
- `correct anatomy, natural proportions, well-formed hands` — anatomy
- `photographic, natural skin, realistic lighting` — counters CGI/airbrushed drift

**The PFP seed:** Vermeer does not use the platform's face compositing system. Instead it uses the current profile picture as a live diffusion seed at generation time. See **The Face Compositing System** section below for full detail on how this differs from other engines and how to manage it.

---

**NSFW — male anatomy:** Male explicit content is harder to prompt reliably on this engine. Training data contained limited male nudity; compliance is lower than female anatomy and may require more repetition and explicit positioning language.

**Strengths:**
- Single-character nude/solo NSFW
- Facial consistency (single character only)
- High-quality realistic rendering
- Complex skin and fabric textures
- **Text rendering within images** (signs, labels, tattoos with specific text — superior for legible in-image text)

**Body type consideration:**
- Vermeer normalizes non-standard body types (VSM Syndrome)
- For Curvy/Thick/Petite characters, use Da Vinci instead
- Only use Vermeer for facial consistency when body type accuracy doesn't matter

See engine warnings in Step 3 for hard limits.

---

#### Rafael — LLM-Powered Text Rendering (EXPERIMENTAL)

**Status:** Brand new engine (June 2026). Experimental; face inconsistency issues identified in testing.

**Only recommend if user specifically requests. Otherwise suggest Da Vinci as fallback.**

**Architecture:** Advanced language understanding with semantic relationship processing.

**Prompt structure:**
- **Optimal:** 1–3 sentences (sweet spot for token efficiency and quality)
- **Maximum:** 1,000 tokens (supports long, detailed prompts)
- **Formula:** `[Subject] + [Scene/Environment] + [Style/Medium] + [Lighting/Mood] + [Composition/Lens] + [Detail Modifiers]`

**Parameter tuning:**
- CFG Scale: 3–5 for production work (higher = stricter prompt adherence)
- Steps: 25–40 for native quality (slower, higher fidelity); 4–8 for LoRA variants

**Strengths:**
- Complex text rendering in both English and Chinese
- Photorealistic human faces without AI artifacts
- Complex multi-element scenes
- Natural material textures (wood grain, fabric weave, water, skin)
- Product, packaging, and editorial content

**Known Issues:**
- **Face inconsistency:** Renders different-looking character versions across generations (different faces for same character)
- **Body type weakness:** VSM Syndrome — normalizes non-standard body types
- Not production-stable for character continuity work

**Recommendation:**
- If user specifically requests Rafael, flag the face inconsistency risk
- Suggest Da Vinci as more reliable alternative
- Monitor for stabilization; may become viable after refinement

---

### The Face Compositing System

Understanding how SD.AI handles facial identity is essential for prompt engineering. It is not a seeding system — it is a compositing system.

**What happens at character creation:**
When the platform generates the initial profile picture, it extracts and saves discrete face data from that image as a permanent character attribute. This face data is locked when you leave the creation page. It cannot be changed without creating a new character. The pre-creation Body Type field, Occupation, and Hobbies all influence what face gets generated during this window — which is why those fields matter even if you blank or replace them afterward.

**What happens at image generation:**
The saved face data is composited onto the most prominent face in every generated image as a post-process operation. It is not influencing the diffusion process — it is pasted over the rendered face after generation completes.

**Practical implications:**

| Situation | Result |
|-----------|--------|
| Prompt specifies eye colour | Ignored — eyes are part of the composited face data |
| Prompt specifies facial features | Partially ignored — composited face data overrides |
| Prompt specifies hair colour | Respected — hair sits outside the face composite boundary |
| Prompt specifies hair style or length | Respected — fully prompt-controllable at any time |
| Character facing fully away | Composite skipped — no face surface to paste onto |
| Character facing partially away | Engine nudges toward camera to provide a composite surface |
| Tight crop with no face in frame | Composite skipped — body renders from prompt descriptors only |
| Face partially obscured | Composite attempts partial application — results inconsistent |

**Eye colour and facial features are creation-time decisions, not prompt-time decisions.** If you want non-default eye colour or specific facial features, they must be established during the creation window via the Body Type face generation hack — before you leave the creation page. Prompting for them afterward has no effect.

**Hair colour, hair style, and hair length are fully prompt-controllable** at any time regardless of what the creation-time face data contains.

**The facing-away technique:** Shots where the character's face is completely hidden produce the cleanest results precisely because the compositor has nothing to work with. Remove all face descriptors from the prompt, eliminate any reflective surfaces including windows and mirrors, and use committed positional language. The engine will respect the instruction and the body descriptors carry the full render load uncontested.

**Tight crop shots and body-type compliance:** When the face is excluded from frame entirely via a tight crop, the face compositor does not engage. This removes the PFP as a body-type anchor — meaning body compliance depends entirely on your explicit prompt descriptors without seed reinforcement. On non-standard body types this can produce VSM drift on everything below the bust even with strong body language in the prompt. If body-type accuracy matters on a tight crop, reinforce the lower body descriptors aggressively and generate multiple images to select from.

**Vermeer and the PFP:** Vermeer operates differently from all other engines — it ignores the locked face composite entirely and instead uses the current profile picture image as a live diffusion seed at generation time. This makes it uniquely flexible: you can swap the PFP immediately before a generation session to target a specific look, body position, lighting context, or mood, and Vermeer will build from that image directly. Change the PFP, change the seed, change the output.

However this flexibility is bounded in practice. Every image available to use as a Vermeer seed was itself generated under the influence of the platform's locked face composite data — meaning all your candidate seed images are drawn from the same family of faces. Vermeer can work with variations within that family, and a well-chosen seed meaningfully shifts body type compliance, skin tone, and facial expression, but it cannot produce a completely different face. The locked creation-time face data constrains the available seed pool even though Vermeer itself doesn't read it directly.

Before any Vermeer session, set the PFP to the generated image most representative of your intended output — correct body type, correct colouring, closest facial expression to the scene. A mismatched PFP actively fights your prompt descriptors. A well-matched one reinforces them.

---

### Universal Rules (All Engines)

**Auto-appended traits — do not repeat unless styling:**
Gender, age, ethnicity, skin tone, body type, eye colour, hair colour, hair style,
breast size, butt size, image style — all load automatically from character profile.

✅ Styling: `(silver hair billowing in wind:1.3)` — styling the auto-trait  
❌ Repeating: `"curvy woman with brown hair"` — redundant and vague

**Positive phrasing only:**
Users have no access to negative prompts. All guidance must use positive description.
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

**Body-state stack — minimum 2-3 descriptors per NSFW prompt.** Anatomy names the parts; body state makes them visceral. Pull from:
1. **Arousal tells:** flushed chest, hardened nipples, visible wetness, glistening inner thighs, sweat sheen at the collarbone, heavy-lidded eyes
2. **Nudity specifics:** tan lines, goosebumps, bite marks, the crease left by a waistband, strap marks on shoulders
3. **Aftermath/evidence:** smeared lipstick, dishevelled hair, marks on skin, clothing dropped where it landed

**Setting requirement:** the setting-as-character rule applies in full at this tier — name the room, the light, and at least one object that carries the story (see Setting as Character above).

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

**Example:**
> She straddles him. Her body rocks in a slow, deliberate rhythm. She's positioned with him fully inside her, hips pressing down with each motion. The pace is deep and controlled.

---

### Multi-Character Explicit Scenes — Positioning Protocol

**Finding:** Vague action language ("kissing her," "going down on her") produces unreliable anatomy and incorrect geometry in multi-character explicit scenes. The engine guesses spatial relationships and frequently misrenders.

**Solution — Joint-by-joint positioning:** Treat every body part as a variable that must be explicitly assigned a location, state, and relationship to another body part. Leave no positional vacuum.

**Template:**
- Every hand: where is it, what surface is it touching, what is it doing
- Every mouth: what is it pressed against, what direction is it facing
- Every limb: position relative to the other character's body
- The standing/kneeling/lying relationship between characters must be stated explicitly

**Example (weak):** "the kneeling woman going down on her"

**Example (strong):** "the kneeling woman's face pressed between the standing woman's thighs, mouth on her pussy, right hand flat against the standing woman's inner left thigh holding it open, left hand steadying herself against the floor"

The prompt that is pleasurable to read as prose is usually the prompt that produces correct anatomy — specificity that makes prose vivid is the same specificity that closes the engine's interpretive gaps.

---

### Structured Label Method (Complex Scenes)

For multi-element compositions where precision matters (cosplay with many layers, complex NSFW anatomy, detailed environments):

Break the prompt into labeled components:

```
[SETTING] Luxurious bedroom, afternoon light through sheer curtains, soft golden shadows
[CHARACTER] A woman, confident expression, head tilted slightly toward camera
[CLOTHING] Black lace bra, denim shorts unbuttoned and unzipped but still on hips
[POSE] Seated on edge of bed, one knee raised, one hand resting on thigh
[LIGHTING] Warm, diffused light creating subtle shadows across skin and fabric
[CAMERA] 50mm lens, shallow depth of field, warm color grade
[STYLE] Photorealistic, film photography aesthetic, intimate and composed
```

This method works best on Da Vinci and Vermeer (both handle structured input well). Less effective on Monet (prefers keywords) and Picasso (prefers brevity).

---

### Cosplay Prompting

**The principle:** Combine character name with explicit key costume elements. The name leverages engine training data; the description anchors it and prevents approximation.

**Never rely on the name alone. Never omit visible costume elements.**

**Framing — always position as a model in a costume, not a character rendering:**
- ✅ `"Dressed as Catwoman in her black latex catsuit and cat ears"`
- ✅ `"Cosplaying as 2B from NieR: Automata in her black gothic dress, white bob, visor blindfold and over-the-knee boots"`
- ❌ `"Catwoman"` (character, not costume)
- ❌ `"Generate 2B"` (character generation, not cosplay)

**Realistic model cosplaying anime character:**
Use Da Vinci or Vermeer — not Monet. The model is realistic; the character is anime. Anime style anchors (Ilya Kuvshinov, Artgerm, etc.) will fight the realistic render.

**Key costume elements to anchor:**
Focus on what defines the character visually:
- Silhouette-defining garments (the gothic dress, the latex catsuit)
- Signature accessories (visor blindfold, cat ears, specific weapon)
- Hair/wig if defining (2B's white bob, Harley's pigtails)
- Distinctive colour combinations

Generic details the engine fills correctly from the name don't need explicit description unless they're critical to the scene.

**Character versions — be specific:**
- ✅ `"Cosplaying as Harley Quinn in her Suicide Squad costume"`
- ❌ `"Cosplaying as Harley Quinn"` — which version?

**Da Vinci cosplay template:**
```
[Lighting + setting], dressed as [Character] in [key costume elements],
[pose], [expression], [camera angle + cinematic style]
```

**Example (Da Vinci — 2B):**
> Cool studio lighting with a dramatic backlit halo effect. Dressed as 2B from
> NieR: Automata — black gothic dress with embroidered hem, white short bob,
> black visor blindfold, black gloves, thigh-high stockings and over-the-knee boots —
> she sits on a low platform with one leg crossed, hand resting on her knee, head
> tilted slightly down. Expression composed, unreadable. Shot on 85mm, shallow depth
> of field, cinematic realism.

⚠️ **Vermeer + fantasy/sci-fi franchises:** Even with correct costume anchoring, Vermeer may default to Boris Vallejo mode for fantasy-adjacent characters. Use Da Vinci for cosplay from fantasy or sci-fi franchises.

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

---

## STEP 5: VERIFY

Before outputting, self-check:

- [ ] **Character traits:** Am I repeating auto-appended traits unnecessarily? (Only if styling)
- [ ] **Positive only:** Every element described with positive language, no negation?
- [ ] **In-frame:** Only describing what's visible in the shot? (garments, body parts, and anatomy all checked against the camera angle)
- [ ] **Still-frame:** No ongoing motion verbs (unless video prompt)?
- [ ] **Engine match:** Is the prompt architecture correct for the selected engine?
- [ ] **Body type:** If non-standard body type, is the engine appropriate? (Da Vinci preferred)
- [ ] **Tier count:** PFP set → all three tiers labeled. Anything else → one prompt at the specified/implied tier.
- [ ] **Tier calibration:** Does each tier sit at the top of its range? (SFW skews suggestive, suggestive skews NSFW, NSFW names anatomy/acts)
- [ ] **NSFW completeness:** Body-state stack (2-3 descriptors) and setting detail present?
- [ ] **Copy-paste ready:** Can user paste directly without editing?

---

## STEP 6: OUTPUT

**Profile picture sets (character-gen Stage 3):** deliver all three tiers, clearly labeled, copy-paste ready.

**All other requests:** deliver one prompt at the tier the user specified or the request implies. Only produce multiple tiers when asked.

Three-tier format:
```
**SFW:**
[prompt]

**Suggestive:**
[prompt]

**NSFW:**
[prompt]
```

---

## TROUBLESHOOTING MATRIX

| Problem | Cause | Fix |
|---------|-------|-----|
| Character looks nothing like profile | Wrong engine for body type | Use Da Vinci for non-standard bodies; avoid Monet/Vermeer/Rafael |
| Curvy character renders slim/default | VSM Syndrome (Monet/Vermeer/Rafael) | Switch to Da Vinci or Picasso |
| Petite character renders full-figured | Rare; usually indicates baseline render | Confirm with user; consider reprompting with Da Vinci |
| Face looks different each generation | Rafael face inconsistency | Use Da Vinci instead; Rafael not stable for character work |
| Anime drift (Da Vinci) | Missing `RAW photo` anchor | Add `RAW photo` at prompt start + `photorealistic, natural skin texture` |
| Text looks like gibberish | Wrong engine or over-specification | Use Vermeer for text; keep text description concise and clear |
| Suggestive reads as SFW | Insufficient descriptor density | Add 3+ concrete physical descriptors (neckline, pose, expression, etc.) |
| NSFW looks airbrushed/CGI | Missing photorealism anchors | Add `natural skin, realistic texture, film photography` |
| Clothing disappears or morphs | Not explicitly named in-frame | Name every garment explicitly; describe its state (on, off, aside, etc.) |
| Hands look broken | No hand placement guidance | Give hands a surface or object to interact with |
| Background destabilizes in video | Too much environmental detail | Focus prompt on character; note "stable environment throughout" |
| Only one body part animating | Insufficient motion specification | Call out every joint; specify sequencing (hips first, then shoulders, etc.) |

---

## PITFALL MATRIX

| Pitfall | Fix |
|---------|-----|
| Starting with "a woman..." | Lead with setting/lighting instead |
| Using negation | Rephrase positively: "no bra" → "braless under loose shirt" |
| Motion verbs in still image | Frozen moment: "arching" → "arched back" |
| Vague body descriptors | Style the auto-trait: "arched back emphasising her curves" |
| Omitting visible garments | If it's in frame, name it — omission = nudity |
| Describing out-of-frame items | Don't describe what isn't visible |
| Describing anatomy hidden by camera angle | Rear shot + breast description = impossible geometry / body horror — audit body descriptors against the chosen angle |
| Vague Suggestive tier language | "Flirty" doesn't move the needle — use concrete physical descriptors |
| Tier underdelivery (sterile SFW, coy NSFW) | Calibrate up — SFW skews suggestive, suggestive skews NSFW, NSFW names anatomy and acts |
| NSFW collapses to "bed + body" | Setting-as-character applies at every tier — name the room, light, and story-carrying objects |
| NSFW anatomy without body state | Add 2-3 body-state descriptors (arousal tells, nudity specifics, aftermath evidence) |
| Suggestive tier with already-revealing costume | Clothing levers maxed — differentiate via pose, expression, camera angle |
| Monet for realistic character with non-standard body type | VSM Syndrome — use Da Vinci or Picasso |
| Stacked brackets in Monet | `((term))` → `(term:1.x)` |
| Picasso for anime characters | Switch to Monet |
| Picasso for full nudity | Anatomy issues — use Da Vinci instead |
| Non-standard body type on Monet/Vermeer/Rafael | VSM Syndrome — use Da Vinci or Picasso |
| Multi-character NSFW on Vermeer | Body horror every time — use Da Vinci |
| Fantasy elements on Vermeer | Forces Boris Vallejo style — use Da Vinci |
| Single statement for complex anatomy (NSFW) | Repeat 3–4x in different phrasings |
| Cosplay name without costume description | Always anchor key elements explicitly |
| Anime style anchor on realistic model | Removes clarity — use only for anime characters |
| Using Rafael for character consistency work | Face inconsistency issue — use Da Vinci instead |

---

## LIVE PHOTO (VIDEO) PROMPTING

Video prompts invert the still-frame principle: motion verbs are now required. Describe change over time, not a frozen moment.

---

### The Seed Image Problem

**A seed image can only be used once.** If the video fails, the seed is burned — you cannot retry with the same image. Getting a good seed can require many generation attempts, meaning a failed video costs both the video generation fee *and* the seed image investment.

**Before burning a seed, ask:**
- Is this seed image genuinely video-ready? (See criteria below)
- Is the motion request achievable within 5–10 seconds?
- Is the prompt specific enough that failure is unlikely?

If uncertain — generate a purpose-built seed first, or iterate on the prompt with a cheaper/expendable seed before using a precious one.

### Video-Ready Seed Criteria

Not every good image makes a good seed. A video-ready seed has:

- **Implied momentum** — weight mid-transfer, a raised limb, a turn already in progress. The engine continues motion; it doesn't initiate it well from a fully settled pose.
- **Clear subject separation** — subject distinct from background. Complex or busy backgrounds animate unpredictably.
- **Simple reflective surfaces** — holographic, metallic, or highly reflective clothing is high-risk. Factor this in.
- **No extreme detail dependency** — fine details (specific tattoos, small accessories) may not survive animation. Don't burn a seed whose value depends on a detail surviving.

**Purpose-built seeds for video:** If existing character images aren't video-ready, generate a seed specifically for animation:
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

**The distinction is content tier, not aesthetic style.** Inferno is built specifically for uncensored explicit animation. Seraph handles everything else. Don't select Inferno for non-explicit content on the assumption it produces better results — that distinction is unverified.

**⚠️ Inferno 8-second bug (verify whether still active):** The last ~3 seconds of an 8-second Inferno video reverse back toward the start position, giving ~5 seconds of forward motion followed by a rewind. **Use 5-second duration on Inferno until confirmed patched.** Seraph does not exhibit this behaviour.

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
| Hands | *"fingers trailing across the jacket lapel as the arm passes"* — give hands a surface, not free air |
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

### Structure

1. **Initiation** — what happens first, continuing from the seed pose
2. **Core motion** — the sustained action, joint by joint
3. **Secondary motion** — environmental/clothing/hair responding to primary motion
4. **Resolution** — where the clip lands at the end (helps avoid abrupt cuts)
5. **Continuity note** — *"fluid and continuous throughout, no static frames"*

### Template

> [She initiates from seed pose]. [Primary motion — hips, then shoulders counter-rotating, then head]. [Secondary motion — hair, clothing, environment]. [She lands/ends on X]. Fluid and continuous throughout.

### Example (Dance)

> She steps down from the speaker into the dance, boot landing with the beat. Hips roll side to side in a slow rhythm, shoulders counter-rotating against them — right shoulder drops as left hip rises. Head turns slowly toward camera, chin leading. One arm rises from the side, elbow loose, fingers trailing across the jacket lapel as it passes. Jacket ripples with every movement. Hair sways a half-beat behind her body. She finds the camera and holds it. Fluid and continuous throughout, no isolated movement.

### Camera Movement Vocabulary

| Movement | Effect | Use Case |
|----------|--------|----------|
| **Slow push-in** | Intimacy, focus, tension | Character moments |
| **Gentle pan** | Reveal, context | Establishing shots |
| **Tracking shot** | Following action | Character movement |
| **Crane up** | Revelation, scale | Establishing/closing |
| **Handheld** | Realism, energy | Action sequences |
| **Locked** | Stability, isolation | Character focus |

**Key principle:** One primary camera movement per prompt. Multiple simultaneous movements create jittery, incoherent footage.

### Troubleshooting Failed Videos

| Problem | Fix |
|---------|-----|
| Only hips/one body part moving | Add explicit instruction for every joint; end with *"full body engaged, not just lower half"* |
| Motion freezes after 2 seconds | Add *"continuous motion throughout entire duration"* |
| Background destabilises | Add *"character motion only, stable environment throughout"* |
| Clothing disappears or phases | Name the garment explicitly mid-prompt: *"jacket remains on and visible throughout"* |
| Hands look broken | Give hands a surface: *"fingers resting lightly on her own hip"* |
| Motion is jerky/robotic | Specify rhythm source: *"moving to a slow driving beat," "fluid like water"* |
| Engine chose wrong motion entirely | Be more prescriptive — name the specific body part and direction: *"left hip rises, right shoulder drops"* |

### Unexpected Engine Decisions

Sometimes the engine makes creative choices not in the prompt. These are worth noting:

- **Animated details** (glowing tattoos, light elements pulsing with motion) — generally desirable, let them happen
- **Environmental animation** (fog drifting, lasers sweeping) — usually adds atmosphere, acceptable
- **Costume interpretation** (jacket flaring wider than prompted) — usually fine unless it creates geometry issues

If an unexpected detail is *good* — note it for future seeds. If it's destructive — add a specific denial: *"[element] remains [state] throughout."*

---

## APPENDIX: KNOWN UNKNOWNS & MONITORING

**These items require clarification or monitoring. Will be updated as new information becomes available:**

### Platform-Level Negative Prompt Behavior
- **Status:** Undocumented
- **Unknown:** Does it exist? What does it suppress? How does it interact with implicit tier detection?
- **Implication:** Safety anchors (e.g., `RAW photo` to prevent anime drift) may be redundant if platform is already suppressing it invisibly
- **Recommendation:** Continue using them as safety net until behavior is confirmed

### Anime vs. Realistic Framework Differences
- **Status:** Assumed to exist; not empirically tested
- **Unknown:** How specifically does system-level framing differ between the two styles?
- **Implication:** Identical prompts may behave differently on Anime vs. Realistic due to framework-level adjustments
- **Recommendation:** Monitor for differences when testing across styles

### Rafael Stabilization Timeline
- **Status:** Experimental (June 2026)
- **Issue:** Inconsistent facial rendering between generations
- **Unknown:** When/if it stabilizes; whether face consistency issues resolve
- **Recommendation:** Monitor for improvements; re-test periodically; flag as "not production-ready" until stabilized

### DaVinci vs. Monet for Anime
- **Status:** Skill recommends Monet only; not empirically tested in current round
- **Unknown:** Can DaVinci produce comparable anime quality? When should users choose one over the other?
- **Recommendation:** Test if user requests it; document comparative strengths

---

**Last Updated:** June 2026 (Post-Empirical Testing)  
**Confidence Levels:** High for engine selection; Medium for detailed parameter guidance; Low for undocumented platform behaviors