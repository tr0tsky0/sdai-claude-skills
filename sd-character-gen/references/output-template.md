# Stage 2 Output Template
## Complete Character Profile Structure

Use this template for every Stage 2 character generation output.

**FORMATTING RULE:** Every field must be on a single line with no manual line breaks — content is copy-pasted directly into SD.AI's text fields, and line breaks create unwanted breaks in the destination. The only exception is a genuine paragraph break within a field (e.g. a new paragraph in About Me or Personality).

---

```
═══════════════════════════════════════════════════════════════
💡 CHARACTER CONCEPT SUMMARY
═══════════════════════════════════════════════════════════════
Core Archetype:  [One-line character essence]
Key Appeal:      [What makes them compelling/attractive]
Primary Fantasy: [The experience users will have with them]
User's Role:     [How the user fits into this character's story — what position they occupy, why they matter]

═══════════════════════════════════════════════════════════════
📋 BASICS
═══════════════════════════════════════════════════════════════
Gender: [Female / Male]
Style:  [Realistic / Anime]
Age:    [number, minimum 20]

═══════════════════════════════════════════════════════════════
🎭 IDENTITY
═══════════════════════════════════════════════════════════════
Name (First): [text]
Name (Last):  [text]

Ethnicity: [Preset / Custom]
  └─ Custom: [Concrete image-generator descriptors. Include skin tone here. Example: "Korean, fair cool-toned skin"]

═══════════════════════════════════════════════════════════════
👁️ APPEARANCE
═══════════════════════════════════════════════════════════════
Eye Colour: [Preset / Custom]
  └─ Custom: [Concrete image-generator descriptor — colour only; shape/lashes/brows go in Work (Creation). Example: "deep amber with gold flecks"]

Hair Style: [Preset / Custom]
  └─ Custom: [Concrete image-generator descriptor. Example: "long loose waves past the shoulder"]

Hair Colour: [Preset / Custom]
  └─ Custom: [Concrete image-generator descriptor. Example: "warm auburn with copper highlights"]

═══════════════════════════════════════════════════════════════
💪 PHYSIQUE
═══════════════════════════════════════════════════════════════
Body Type: [Concrete proportions — physique and build only. 500 char max. No face, hair, skin tone, accessories, tattoos, or scars. Example: "Slender frame, narrow waist, long limbs. Lean without being muscular."]

Breast Size: [Preset / Custom]
  └─ Custom: [Concrete image-generator descriptor. Example: "full and natural, with soft weight"]

Butt Size: [Preset / Custom]
  └─ Custom: [Concrete image-generator descriptor. Example: "round and full, high and firm"]

═══════════════════════════════════════════════════════════════
🧠 TRAITS
═══════════════════════════════════════════════════════════════
Personality: [Preset name / Custom]

  └─ Custom: [Continuous prose, 2nd person. Traits, behaviours, conversational style, emotional tendencies, quirks, speech patterns, situational triggers. No intimate content — that belongs in Kinks.]

Relationship: [Preset name / Custom]

  └─ Custom: [Continuous prose, 2nd person, 100-200 words. Explicitly describes character's connection to the user — why they care, what they want from the user, what tension or attraction exists. Can be descriptive dynamic or roleplay starting scene.]

═══════════════════════════════════════════════════════════════
🎤 VOICE
═══════════════════════════════════════════════════════════════
Voice: [Preset that matches character background]

═══════════════════════════════════════════════════════════════
💼 LIFESTYLE
═══════════════════════════════════════════════════════════════
Work (Creation): [Concrete image-generator descriptors — not prose. Facial anatomy for the face generation hack. Include: ethnic marker with weight e.g. (Korean:1.2), facial shape, eyes (shape/lid type/brows/lashes), nose (bridge/radix/tip/nostrils), lips (upper-lower balance/cupid's bow/corners), cheeks (volume/planes), permanent features (moles/scars/birthmarks).]

⚠️ Replace with Work (Final) immediately after face generation ⚠️

Work (Final): [Continuous prose, 2nd person, present tense. 5-step formula: gig → what you do → stakes → friction → motion in scene. Concrete verbs, no buzzwords.]

Hobbies: [Preset name / Custom]

  └─ Custom: [Keyword list, comma-separated, minimum 10. Example: "café-hopping, vintage Polaroid collecting, art gallery openings, swimming, urban sketching, vinyl record hunting, baking sourdough, weekend hiking, film photography, tabletop RPGs"]

Kinks: [Preset name / Custom]

  └─ Custom: [Continuous prose, 2nd person. Platform intimacy-behaviour field. Formula: hunger + power dynamics + scene beat. Include 2-4 concrete objects, micro-tells, and power verbs. Specific and psychologically grounded.]

═══════════════════════════════════════════════════════════════
📖 NARRATIVE CONTEXT
═══════════════════════════════════════════════════════════════
About Me: [Continuous prose, 1st person, 200+ words. Character introduces themselves — life, personality, location, work, likes/dislikes, habits, goals. Must reference or imply why the user matters to this character. Functions as biography AND system prompt for tone/pacing/default behaviour.]

Memory: [Leave blank for new characters.]

═══════════════════════════════════════════════════════════════
✅ PRE-PUBLISH CHECKLIST
═══════════════════════════════════════════════════════════════
□ All prose fields written as continuous prose — no manual line wraps within content
□ Work (Creation) contains facial anatomy descriptors (ethnic marker, facial shape, eyes, nose, lips, cheeks, permanent features)
□ Work (Final) uses 5-step formula — swap immediately after face generation
□ About Me written in 1st person
□ About Me references why the user matters to this character
□ Relationship written in 2nd person
□ Relationship explicitly connects to the user
□ Kinks written in 2nd person with formula applied
□ Minimum 10 hobbies in keyword format
□ No {{Char}} notation used anywhere
□ Intimate content in Kinks only, not Personality
□ Personality designed for dynamic interaction
□ All fields cohesive with overall character concept
□ Voice selection matches character background

═══════════════════════════════════════════════════════════════
🎯 VIBE CHECK
═══════════════════════════════════════════════════════════════
[2-3 sentences. Why would someone want to spend time with this character? What interesting situations and dynamics does this character create for the user to navigate?]
```

---

## NOTES ON TEMPLATE USE

**Single-line rule** applies to every field — content is copy-pasted directly into SD.AI's text fields, and manual line breaks create unwanted breaks in the destination. Paragraph breaks are the only exception, used only where a genuine new paragraph is intended.

**Hobbies** is the exception — keyword list format, comma-separated, no prose.

**Concept Summary and Vibe Check** are for Claude's output context only, not pasted into any platform field. Formatting there is less critical.

**Memory field** stays blank on creation. Populated during live interactions as the story develops.
