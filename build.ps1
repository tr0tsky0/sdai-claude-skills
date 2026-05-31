Add-Type -Assembly System.IO.Compression
$root = $PSScriptRoot
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
