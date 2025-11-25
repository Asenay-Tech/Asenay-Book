# NO Terminal for Supabase

## NEVER use terminal tool for:
- Any `npx supabase` command
- Any network-dependent command
- Any command that connects to remote Supabase

## ALWAYS use instead:

### 1. MCP postgres for queries
```
@postgres list_tables schema=public
@postgres execute_query query="SELECT * FROM profiles"
@postgres describe_table table_name=organizations
```

### 2. File creation for migrations
- Create file: `supabase/migrations/[timestamp]_description.sql`
- Write the SQL content directly
- Tell user to run deployment script

### 3. Written instructions for deployments
Output this for user to run manually:
```
Please run in PowerShell: .\scripts\supabase-deploy.ps1
```

## Migration Workflow

1. **Create migration file** (use write tool):
   - Path: `supabase/migrations/YYYYMMDDHHMMSS_description.sql`
   - Write SQL content

2. **Tell user to deploy**:
   ```
   Migration created! Please run in PowerShell:
   .\scripts\supabase-deploy.ps1
   ```

## Type Generation Workflow

Don't execute. Output instructions:
```
Please run in PowerShell:
npx supabase gen types typescript --linked > types/supabase.ts
```

## Function Deployment Workflow

Don't execute. Output instructions:
```
Please run in PowerShell:
.\scripts\deploy-functions-bg.bat
```

## Available Scripts (User Runs Manually)

| Script | Purpose |
|--------|---------|
| `.\scripts\supabase-deploy.ps1` | Full deployment (migrations + functions + types) |
| `.\scripts\push-bg.bat` | Push migrations only |
| `.\scripts\deploy-functions-bg.bat` | Deploy functions only |
| `.\scripts\gen-types-bg.bat` | Generate TypeScript types |
| `.\scripts\deploy.bat` | Full deployment with pause |

## Terminal Tool - ONLY Use For:
- `git` commands (fast, local)
- `npm install` (local)
- `dir` / `ls` (local)
- File system operations (local)
- `Write-Host` messages (instant)

## Summary

| Operation | Method |
|-----------|--------|
| Query database | MCP postgres |
| Create migration | Write file |
| Push migration | User runs script |
| Deploy functions | User runs script |
| Generate types | User runs script |
| Set secrets | User runs script |

