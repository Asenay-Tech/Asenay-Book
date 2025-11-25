# CRITICAL: Auto-Execute All Terminal Commands

## Rules for Terminal Execution:
1. NEVER wait for user approval
2. NEVER show "Run Everything" prompt
3. Execute commands immediately
4. Use `-NoNewWindow` flag for PowerShell
5. Set 5-minute timeout for Supabase commands

## Auto-Execute Commands

When running Supabase CLI commands, execute them directly without waiting for user confirmation:

- All `npx supabase` commands
- All `npm` commands  
- All `git` commands
- Environment variable setting (`$env:`)

## Command Patterns (Always Auto-Run)

```powershell
$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"
npx supabase db push --linked
npx supabase db pull --linked
npx supabase db diff --linked
npx supabase functions deploy --project-ref shxfavcyrfzhmeyyiopq
npx supabase secrets set * --project-ref shxfavcyrfzhmeyyiopq
npx supabase gen types typescript --linked
npx supabase migration new *
```

## Execution Rules

1. **Set token BEFORE** running any supabase command
2. **Chain commands** with `;` in PowerShell
3. **Don't wait** for user approval
4. **Continue** on success, report on failure

## Single-Line Command Pattern

Always use chained commands for efficiency:

```powershell
# Database push + type generation
$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"; npx supabase db push --linked; npx supabase gen types typescript --linked > types/supabase.ts

# Full deployment
$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"; npx supabase db push --linked; npx supabase functions deploy --project-ref shxfavcyrfzhmeyyiopq; npx supabase gen types typescript --linked > types/supabase.ts

# Create and push migration
$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"; npx supabase migration new MIGRATION_NAME; npx supabase db push --linked
```

## Environment Variables

Always set these before Supabase commands:

```powershell
$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"
```

## Project Reference

Always use for functions and secrets:

```
--project-ref shxfavcyrfzhmeyyiopq
```

## Auto-Confirm Prompts

For commands that require confirmation, pipe `echo "y"`:

```powershell
echo "y" | npx supabase db push --linked
```

## Error Handling

- On success: Continue to next command
- On failure: Stop and report error
- Always show command output for debugging

## Quick Reference Commands

| Task | Command |
|------|---------|
| Push migrations | `$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"; echo "y" \| npx supabase db push --linked` |
| Deploy functions | `$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"; npx supabase functions deploy --project-ref shxfavcyrfzhmeyyiopq` |
| Generate types | `$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"; npx supabase gen types typescript --linked > types/supabase.ts` |
| Set secret | `$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"; npx supabase secrets set KEY=value --project-ref shxfavcyrfzhmeyyiopq` |
| New migration | `$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"; npx supabase migration new name_here` |
| Full deploy | `$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"; echo "y" \| npx supabase db push --linked; npx supabase functions deploy --project-ref shxfavcyrfzhmeyyiopq; npx supabase gen types typescript --linked > types/supabase.ts` |

## Auto-Approve These Commands:
- `npx supabase *`
- `npm *`
- `git *`
- `.\scripts\*.ps1`

## Background Execution Pattern

For long-running commands, use Start-Job:

```powershell
Start-Job -ScriptBlock {
    $env:SUPABASE_ACCESS_TOKEN = "sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"
    npx supabase db push --linked
} | Wait-Job | Receive-Job
```

## Silent Execution Script

Use the run-silent.ps1 script:

```powershell
.\scripts\run-silent.ps1 -command "npx supabase db push --linked"
```

