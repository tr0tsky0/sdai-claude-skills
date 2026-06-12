## Section 6: Known Unknowns — Monitor & Update

### Platform-Level Negative Prompt Behavior
- **Status:** Undocumented
- **Question:** Does platform inject negative prompts? What does it suppress?
- **Impact:** Safety anchors (RAW photo, etc.) may be redundant if platform already suppresses anime drift invisibly
- **How to test:** Compare output behavior with/without explicit anchors; document patterns
- **Update guide when:** Behavior is confirmed or behavior patterns are documented

### Anime vs. Realistic Framework Differences
- **Status:** Assumed to exist; not empirically tested
- **Question:** How specifically does system-level framing differ between styles?
- **Impact:** Identical prompts may behave differently on Anime vs. Realistic
- **How to test:** Generate identical prompt on same character with both style selections; compare rendering
- **Update guide when:** Differences are documented and characterized

### Rafael Stabilization Timeline
- **Status:** Experimental (June 2026); face inconsistency issues identified
- **Question:** When/if will Rafael stabilize? Will face consistency issues resolve?
- **Impact:** Currently flagged as "not production-ready"; may become viable after refinement
- **How to test:** Periodically re-test Rafael on same character; monitor for consistency improvements
- **Update guide when:** Face consistency stabilizes OR 6+ months pass without improvement

### DaVinci vs. Monet Anime Quality
- **Status:** Skill recommends Monet only for anime; not empirically tested in current testing round
- **Question:** Can DaVinci produce comparable anime quality? When should users choose one vs. the other?
- **Impact:** May offer alternative anime path or reveal Monet limitations
- **How to test:** Generate identical anime prompt on DaVinci and Monet; document quality/consistency differences
- **Update guide when:** Comparative strengths are documented; user decision tree can be clarified

### Untested ###
- Whether heavy eye makeup or deep shadow in the prompt can modulate the composited eye colour through blending, or whether the composite is always a flat overwrite regardless of the rendered layer beneath it.
