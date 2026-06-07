<#
.SYNOPSIS
    validate-and-push — kiểm tra repo Knowledge (markdown) theo bộ rule rồi push.

.DESCRIPTION
    Quy trình:
      1. Stash thay đổi cục bộ (kèm file mới).
      2. Pull từ remote.
      3. Apply (pop) lại thay đổi.  → nếu CONFLICT: báo user, dừng (không push).
      4. Quét TOÀN BỘ repo + thay đổi qua bộ rule layout K:
           - cấu trúc folder/file:  Knowledge/<K>/_.md ; node lá = <Tên>.md ;
             node có con = <Tên>/<Tên>.md
           - YAML front-matter:     ---\nid: <int>\nname: "..."\n---  (đúng cú pháp)
           - nội dung question:     # <text> [id:N order:M] ; draft <!--# ... -->
         → nếu sai rule: liệt kê lỗi, dừng (không push).
      5. Tất cả OK  →  commit + push.

.PARAMETER RepoPath
    Đường dẫn repo knowledge. Mặc định: thư mục hiện tại.

.PARAMETER Message
    Commit message khi push. Mặc định có timestamp.

.PARAMETER ValidateOnly
    Chỉ chạy bước validate (bỏ qua git stash/pull/push). Dùng để kiểm tra nhanh.

.EXAMPLE
    pwsh ./validate-and-push.ps1 -RepoPath C:\path\to\knowledge-repo
.EXAMPLE
    pwsh ./validate-and-push.ps1 -ValidateOnly
#>
[CmdletBinding()]
param(
    [string]$RepoPath = (Get-Location).Path,
    [string]$Message  = "validate-and-push: sync $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')",
    [switch]$ValidateOnly
)

$ErrorActionPreference = 'Stop'

function Write-Step($m) { Write-Host "› $m" -ForegroundColor Cyan }
function Write-Ok($m)   { Write-Host "✅ $m" -ForegroundColor Green }
function Write-Warn($m) { Write-Host "⚠️  $m" -ForegroundColor Yellow }
function Stop-Fail($m)  { Write-Host "❌ $m" -ForegroundColor Red; exit 1 }

# ─────────────────────────────────────────────────────────────────────────────
# RULE VALIDATION (thuần, không đụng git) — trả về danh sách lỗi.
# ─────────────────────────────────────────────────────────────────────────────
function Test-TagSyntax {
    param([string]$Line, [string]$Rel, [int]$LineNo, $Bag)
    foreach ($bm in [regex]::Matches($Line, '\[([^\]]*)\]')) {
        $inner = $bm.Groups[1].Value
        foreach ($m in [regex]::Matches($inner, '(\w+)\s*:\s*(\S+)')) {
            $k = $m.Groups[1].Value; $val = $m.Groups[2].Value
            if (($k -eq 'id' -or $k -eq 'order') -and $val -notmatch '^\d+$') {
                $Bag.Add("[$Rel] dòng ${LineNo}: tag '$k' không phải số nguyên: '$val'")
            }
        }
    }
}

function Get-KnowledgeViolations {
    param([string]$KnowledgeRoot)
    $bag = [System.Collections.Generic.List[string]]::new()

    if (-not (Test-Path -LiteralPath $KnowledgeRoot)) {
        $bag.Add("Thiếu thư mục gốc 'Knowledge/'."); return $bag
    }
    $rootFull = (Resolve-Path -LiteralPath $KnowledgeRoot).Path.TrimEnd('\', '/')
    function Rel([string]$full) { $full.Substring($rootFull.Length).TrimStart('\', '/').Replace('\', '/') }

    $dirs     = @(Get-ChildItem -LiteralPath $KnowledgeRoot -Recurse -Directory)
    $allFiles = @(Get-ChildItem -LiteralPath $KnowledgeRoot -Recurse -File)

    # ── R1: mỗi folder phải có file "self" ───────────────────────────────────
    foreach ($d in $dirs) {
        $rel   = Rel $d.FullName
        $depth = ($rel -split '/').Count           # IT=1 (knowledge), IT/TCP=2 (node)…
        if ($depth -eq 1) {
            if (-not (Test-Path -LiteralPath (Join-Path $d.FullName '_.md'))) {
                $bag.Add("Knowledge '$rel' thiếu file '_.md'.")
            }
        }
        else {
            $self = "$($d.Name).md"
            if (-not (Test-Path -LiteralPath (Join-Path $d.FullName $self))) {
                $bag.Add("Node folder '$rel' thiếu file self '$self'.")
            }
            if (Test-Path -LiteralPath (Join-Path $d.FullName '_.md')) {
                $bag.Add("Node folder '$rel' chứa '_.md' (chỉ dành cho knowledge) — mơ hồ.")
            }
        }
    }

    # ── R2: chỉ chấp nhận file .md; knowledge phải là folder ─────────────────
    foreach ($f in $allFiles) {
        $rel = Rel $f.FullName
        if ($f.Extension -ne '.md') { $bag.Add("File không phải .md: '$rel'."); continue }
        if (($rel -split '/').Count -lt 2) {
            $bag.Add("File .md nằm ngay dưới 'Knowledge/' (knowledge phải là folder): '$rel'.")
        }
    }

    # ── R3: tên anh em phải duy nhất (folder & file trùng tên = đụng) ────────
    $containers = @($rootFull) + ($dirs | ForEach-Object { (Resolve-Path -LiteralPath $_.FullName).Path.TrimEnd('\', '/') })
    foreach ($c in $containers) {
        $isRoot = ($c -eq $rootFull)
        $selfBase = $null
        if (-not $isRoot) {
            $cDepth = ((Rel $c) -split '/').Count
            $selfBase = if ($cDepth -eq 1) { '_' } else { Split-Path $c -Leaf }
        }
        $names = [System.Collections.Generic.List[string]]::new()
        foreach ($sub in @(Get-ChildItem -LiteralPath $c -Directory)) { $names.Add($sub.Name) }
        foreach ($mf in @(Get-ChildItem -LiteralPath $c -File -Filter *.md)) {
            $b = [IO.Path]::GetFileNameWithoutExtension($mf.Name)
            if ($b -eq '_') { continue }                                   # self marker
            if ($null -ne $selfBase -and $b -eq $selfBase) { continue }    # node self
            $names.Add($b)
        }
        foreach ($g in ($names | Group-Object { $_.ToLowerInvariant() } | Where-Object { $_.Count -gt 1 })) {
            $where = if ($isRoot) { 'Knowledge/' } else { (Rel $c) + '/' }
            $bag.Add("Trùng tên trong '$where': '$($g.Group[0])' xuất hiện $($g.Count) lần (folder/file đụng nhau).")
        }
    }

    # ── R4 + R5: front-matter YAML & nội dung question từng file .md ─────────
    foreach ($f in ($allFiles | Where-Object { $_.Extension -eq '.md' })) {
        $rel   = Rel $f.FullName
        $lines = @(Get-Content -LiteralPath $f.FullName -Encoding UTF8)
        $bodyStart = 0

        if ($lines.Count -gt 0 -and $lines[0].Trim() -eq '---') {
            $closed = $false
            for ($i = 1; $i -lt $lines.Count; $i++) {
                if ($lines[$i].Trim() -eq '---') {
                    $closed = $true; $bodyStart = $i + 1
                    for ($j = 1; $j -lt $i; $j++) {
                        $l = $lines[$j]
                        if ($l -match '^\s*id\s*:\s*(.+?)\s*$') {
                            if ($Matches[1] -notmatch '^\d+$') { $bag.Add("[$rel] front-matter 'id' không phải số nguyên: '$($Matches[1])'.") }
                        }
                        elseif ($l -match '^\s*name\s*:\s*(.+?)\s*$') {
                            $nm = $Matches[1].Trim()
                            if ($nm.StartsWith('"') -and -not ($nm.Length -ge 2 -and $nm.EndsWith('"'))) {
                                $bag.Add("[$rel] front-matter 'name' thiếu dấu `" đóng.")
                            }
                        }
                    }
                    break
                }
            }
            if (-not $closed) { $bag.Add("[$rel] front-matter mở bằng '---' nhưng thiếu '---' đóng."); $bodyStart = $lines.Count }
        }

        $inDraft = $false; $draftLine = 0
        for ($i = $bodyStart; $i -lt $lines.Count; $i++) {
            $line = $lines[$i].TrimEnd(); $ln = $i + 1
            if ($line -match '^<!--#') {
                Test-TagSyntax -Line $line -Rel $rel -LineNo $ln -Bag $bag
                $inDraft = -not ($line -match '-->\s*$')
                if ($inDraft) { $draftLine = $ln }
                continue
            }
            if ($inDraft) { if ($line -match '-->\s*$') { $inDraft = $false }; continue }
            if ($line -match '^#\s') { Test-TagSyntax -Line $line -Rel $rel -LineNo $ln -Bag $bag }
        }
        if ($inDraft) { $bag.Add("[$rel] draft block mở ở dòng $draftLine nhưng thiếu '-->' đóng.") }
    }

    return $bag
}

function Invoke-Validate {
    param([string]$Repo)
    Write-Step "Quét rule layout K…"
    $violations = Get-KnowledgeViolations -KnowledgeRoot (Join-Path $Repo 'Knowledge')
    if ($violations.Count -gt 0) {
        Write-Host "❌ Có $($violations.Count) lỗi rule:" -ForegroundColor Red
        $violations | ForEach-Object { Write-Host "   - $_" -ForegroundColor Red }
        return $false
    }
    Write-Ok "Validation PASS — không có lỗi rule."
    return $true
}

# ─────────────────────────────────────────────────────────────────────────────
# GIT HELPERS
# ─────────────────────────────────────────────────────────────────────────────
function Invoke-Git { param([Parameter(ValueFromRemainingArguments)] $GitArgs)
    # Pipe stdout to Out-Host so git's chatty output (e.g. "Saved working
    # directory and index state…") doesn't leak into the function's return
    # value — without this, the caller's `(Invoke-Git ...) -ne 0` filter ends
    # up matching string output and falsely reports failure.
    # DO NOT redirect 2>&1: that converts native stderr (e.g. push progress
    # "To https://…") into NativeCommandError records, which $ErrorActionPreference=Stop
    # then promotes to a terminating error even on a successful push.
    & git @GitArgs | Out-Host
    return $LASTEXITCODE
}
function Test-HasConflict { @(git diff --name-only --diff-filter=U).Count -gt 0 }

# ─────────────────────────────────────────────────────────────────────────────
# MAIN
# ─────────────────────────────────────────────────────────────────────────────
if (-not (Test-Path -LiteralPath $RepoPath)) { Stop-Fail "Không tìm thấy đường dẫn: $RepoPath" }
Set-Location -LiteralPath $RepoPath

if ($ValidateOnly) {
    if (Invoke-Validate -Repo $RepoPath) { exit 0 } else { exit 1 }
}

git rev-parse --is-inside-work-tree *> $null
if (-not $?) { Stop-Fail "Không phải git repository: $RepoPath" }

# 1) Stash
$stashed = $false
if (@(git status --porcelain).Count -gt 0) {
    Write-Step "Stash thay đổi cục bộ…"
    if ((Invoke-Git stash push --include-untracked -m 'validate-and-push') -ne 0) { Stop-Fail "git stash thất bại." }
    $stashed = $true
}
else { Write-Step "Không có thay đổi cục bộ để stash." }

# 2) Pull
Write-Step "Pull từ remote…"
if ((Invoke-Git pull --no-edit) -ne 0 -or (Test-HasConflict)) {
    # Pull conflict / fail leaves working tree in merging state with unmerged paths.
    # Must abort merge first — otherwise `stash pop` refuses to run.
    if (Test-Path -LiteralPath (Join-Path $RepoPath '.git/MERGE_HEAD')) {
        Invoke-Git merge --abort | Out-Null
    }
    if ($stashed) { Invoke-Git stash pop | Out-Null }
    Stop-Fail "git pull thất bại / diverge. Hãy resolve thủ công rồi chạy lại."
}

# 3) Apply (pop) lại thay đổi
if ($stashed) {
    Write-Step "Apply lại thay đổi của bạn…"
    Invoke-Git stash pop | Out-Null
    if (Test-HasConflict) {
        Write-Host "❌ CONFLICT khi apply thay đổi vào code mới từ remote:" -ForegroundColor Red
        @(git diff --name-only --diff-filter=U) | ForEach-Object { Write-Host "   - $_" -ForegroundColor Red }
        Stop-Fail "Resolve conflict (thay đổi của bạn vẫn ở working tree) rồi chạy lại. KHÔNG push."
    }
}

# 4) Validate toàn bộ repo + thay đổi
if (-not (Invoke-Validate -Repo $RepoPath)) {
    Stop-Fail "Validation thất bại — đã DỪNG, không push. Sửa các lỗi trên rồi chạy lại."
}

# 5) Commit + push
if (@(git status --porcelain).Count -gt 0) {
    Write-Step "Commit…"
    Invoke-Git add -A | Out-Null
    if ((Invoke-Git commit -m $Message) -ne 0) { Stop-Fail "git commit thất bại." }
}
else { Write-Step "Không có gì để commit." }

Write-Step "Push lên remote…"
if ((Invoke-Git push) -ne 0) { Stop-Fail "git push thất bại (kiểm tra upstream/credentials)." }
Write-Ok "Đã validate và push thành công."
