# CRITICAL: No-Wait Terminal Rules

## ❌ NEVER Run These Directly (Causes Timeout)

These commands make network calls and will timeout the UI:

```powershell
# DON'T USE THESE DIRECTLY
npx supabase db push --linked
npx supabase db pull --linked  
npx supabase functions deploy
npx supabase secrets set
npx supabase gen types typescript --linked
```

## ✅ Use These Instead

### 1. For Database Queries → Use MCP (Instant)

```
@postgres execute_query query="SELECT * FROM profiles LIMIT 5"
@postgres describe_table table_name=organizations
@postgres list_tables schema=public
```

### 2. For Local Operations → Fast Commands (No Network)

```powershell
npx supabase --version          # Instant
npx supabase status             # Local only
dir supabase\migrations         # File listing
npx supabase migration new X    # Creates local file
```

### 3. For Deployments → Background Script

```powershell
# Start deployment in background - returns immediately
Start-Process powershell -ArgumentList "-File .\scripts\supabase-deploy.ps1" -WindowStyle Hidden
Write-Host "Deployment started in background"
```

Or use batch file:
```powershell
start deploy.bat
```

### 4. For Schema Changes → Create Migration + Background Push

```powershell
# Step 1: Create migration (fast, local)
npx supabase migration new my_change

# Step 2: Edit the SQL file in supabase/migrations/
# (Use file editing tools)

# Step 3: Push in background (no waiting)
Start-Process cmd -ArgumentList "/c set SUPABASE_ACCESS_TOKEN=sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa && npx supabase db push --linked" -NoNewWindow
Write-Host "Push started in background"
```

## Quick Reference

| Task | Method | Wait? |
|------|--------|-------|
| Query data | MCP postgres | ❌ No |
| Check status | `supabase status` | ❌ No |
| Create migration | `migration new` | ❌ No |
| Push to remote | Background script | ❌ No |
| Deploy functions | Background script | ❌ No |
| Set secrets | Background script | ❌ No |
| Generate types | Background script | ❌ No |

## Background Execution Patterns

### Pattern 1: Start-Process (Recommended)
```powershell
Start-Process powershell -ArgumentList "-NoProfile -Command `"$env:SUPABASE_ACCESS_TOKEN='sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa'; npx supabase db push --linked`"" -WindowStyle Hidden
```

### Pattern 2: Batch File
```powershell
start .\scripts\deploy.bat
```

### Pattern 3: Start-Job
```powershell
Start-Job { npx supabase db push --linked } | Out-Null
Write-Host "Job started"
```

## Environment

Always ensure token is set:
```powershell
$env:SUPABASE_ACCESS_TOKEN = "sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"
```

## Project Reference

For functions and secrets:
```
--project-ref shxfavcyrfzhmeyyiopq
```

