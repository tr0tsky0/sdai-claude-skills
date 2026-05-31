# SD.AI Claude Skills

Two Claude skills for [Secret Desires AI](https://secretdesires.ai) (SD.AI), an adult AI companion platform. These skills encode field-tested methodology for character creation and image prompt generation into reusable, invocable skill documents for Claude.ai.

## Contents

| Skill | What it does |
|-------|-------------|
| [`sd-character-gen`](sd-character-gen/SKILL.md) | Full character creation pipeline: narrative hooks, character profiles, profile picture prompts, opening vignettes, and World Character creation with reactive world architecture |
| [`sd-image-prompts`](sd-image-prompts/SKILL.md) | Image prompt engineering for SD.AI's four engines (DaVinci, Vermeer, Monet, Picasso), including engine selection logic, NSFW tier prompting, cosplay prompting, and Live Photo video generation |

## Requirements

- A [Claude.ai](https://claude.ai) account with access to the Skills feature
- A [Secret Desires AI](https://secretdesires.ai) account

## Adult Content Notice

These skills are designed for use on Secret Desires AI, an age-gated adult AI companion platform. SD.AI requires age verification; its users have explicitly consented to adult content on that platform. The skills contain explicit anatomical terminology required for accurate image generation on SD.AI's adult content tiers — this is an engine requirement, not a stylistic choice. They are intended for use by adults with active SD.AI accounts.

## Installation

1. Download the `.skill` file for the skill you want (`sd-character-gen.skill` or `sd-image-prompts.skill`)
2. Go to [claude.ai](https://claude.ai) and navigate to **Skills** in the sidebar
3. Click **Add skill** and upload the `.skill` file
4. The skill will be available in any conversation via `/sd-character-gen` or `/sd-image-prompts`

## Usage

### sd-character-gen

Invoke with `/sd-character-gen`. Use when you want to:

- Generate narrative hooks for a new character concept (Stage 1)
- Build a complete character profile with all SD.AI platform fields (Stage 2)
- Generate profile picture prompts at SFW / Suggestive / NSFW tiers (Stage 3)
- Write an opening vignette to seed the chat (Stage 4)
- Create a **World Character** — a character embedded in a reactive world with lore, secondary characters, and a full Notes field architecture

The skill handles the full pipeline. You can enter at any stage with a concept already in hand, or start from scratch and let Stage 1 generate scenario hooks to choose from.

### sd-image-prompts

Invoke with `/sd-image-prompts`. Use when you want to:

- Generate prompts for any SD.AI engine with engine selection guidance
- Get three content tiers (SFW / Suggestive / NSFW) in a single pass
- Create cosplay prompts with proper costume anchoring
- Generate Live Photo (video) animation prompts with joint-by-joint motion coverage
- Debug prompts that aren't producing the expected output

## Repository Structure

```
sd-character-gen/
├── SKILL.md                         # Main skill document
└── references/
    ├── platform-structure.md        # All SD.AI platform fields and presets
    ├── output-template.md           # Stage 2 character profile output template
    └── llm-embodiment.md            # Writing principles for LLM persona copy
sd-image-prompts/
└── SKILL.md                         # Main skill document
sd-character-gen.skill               # Packaged skill — upload directly to Claude.ai
sd-image-prompts.skill               # Packaged skill — upload directly to Claude.ai
```

The `.skill` files are zip archives of each skill directory. To rebuild after editing:

```powershell
# Windows PowerShell
# Note: Compress-Archive doesn't support .skill extension, and ZipFile.CreateFromDirectory
# stores backslash paths on Windows which Claude.ai rejects. Build entries manually instead.
Add-Type -Assembly System.IO.Compression
$root = (Get-Location).Path
foreach ($skill in @("sd-character-gen", "sd-image-prompts")) {
    $src = "$root\$skill"; $tmp = "$root\$skill.skill.tmp"; $dest = "$root\$skill.skill"
    $s = [System.IO.File]::Open($tmp, [System.IO.FileMode]::Create)
    $z = New-Object System.IO.Compression.ZipArchive($s, [System.IO.Compression.ZipArchiveMode]::Create, $false)
    Get-ChildItem -Path $src -Recurse -File | ForEach-Object {
        $rel = $_.FullName.Substring($src.Length + 1).Replace('\', '/')
        $e = $z.CreateEntry($rel, [System.IO.Compression.CompressionLevel]::Optimal)
        $es = $e.Open(); $b = [System.IO.File]::ReadAllBytes($_.FullName)
        $es.Write($b, 0, $b.Length); $es.Close()
    }
    $z.Dispose(); $s.Close()
    [System.IO.File]::Copy($tmp, $dest, $true); [System.IO.File]::Delete($tmp)
    Write-Output "Built $skill.skill"
}
```

```bash
# macOS / Linux
cd sd-character-gen && zip -r ../sd-character-gen.skill . && cd ..
cd sd-image-prompts && zip -r ../sd-image-prompts.skill . && cd ..
```

## License

[CC BY-NC-SA 4.0](LICENSE) — Attribution required, non-commercial use only, derivatives must use the same license.
