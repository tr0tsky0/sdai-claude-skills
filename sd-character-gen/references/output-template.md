# Stage 2 Output Template
## Complete Character Profile Structure

Use this template for every Stage 2 character generation output.

**FORMATTING RULE:** All prose field content (Personality, Relationship, Kinks, About Me, Work, Body Type) must be written as continuous prose with no manual line wrapping. Line breaks within a field only between genuine paragraphs. This ensures clean copy-paste directly into SD.AI's text fields.

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
  └─ Custom: [text — 500 char max]

═══════════════════════════════════════════════════════════════
👁️ APPEARANCE
═══════════════════════════════════════════════════════════════
Eye Colour: [Preset / Custom]
  └─ Custom: [text — 500 char max]

Hair Style: [Preset / Custom]
  └─ Custom: [text — 500 char max]

Hair Colour: [Preset / Custom]
  └─ Custom: [text — 500 char max]

═══════════════════════════════════════════════════════════════
💪 PHYSIQUE
═══════════════════════════════════════════════════════════════
Body Type (Creation): [3-6 sentence continuous prose — no line wraps. Example: "Athletic body, extremely beautiful 28-year-old woman, she wears bold and sultry makeup, she has an extremely beautiful angelic appearance, looks pretty, divine and gracious, has a beautiful and immaculate smile."]

⚠️ Simplify this field after face generation — see Body Type (Final) below ⚠️

Body Type (Final): [1-2 sentences: physique, build, and skin tone only — used AFTER face generation. No hair, facial features, expression, or accessories. Example: "Slender and slight, with the build of someone who forgets meals when the work is interesting. Luminous pale skin."]

Breast Size: [Preset / Custom]
  └─ Custom: [text — 500 char max]

Butt Size: [Preset / Custom]
  └─ Custom: [text — 500 char max]

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
Work: [Preset name / Custom]

  └─ Custom: [Continuous prose, 2nd person, present tense. 5-step formula: gig → what you do → stakes → friction → motion in scene. Concrete verbs, no buzzwords.]

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
□ Body Type (Creation) detailed prompt is present
□ Body Type (Final) is 1-2 sentences: physique and skin tone only — no hair, face, expression, or accessories
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

**Continuous prose rule** applies to: Personality, Relationship, Work, Kinks, About Me, Body Type (Creation), and any Custom appearance fields. These are copy-pasted directly into SD.AI's text fields — manual line wrapping creates unwanted breaks in the destination field.

**Hobbies** is the exception — keyword list format, comma-separated, no prose.

**Concept Summary and Vibe Check** are for Claude's output context only, not pasted into any platform field. Formatting there is less critical.

**Memory field** stays blank on creation. Populated during live interactions as the story develops.
