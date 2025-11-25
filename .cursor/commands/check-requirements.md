# Check Requirements Command

## Purpose
Verify all requirements are met before starting a step or phase. Ensures dependencies are complete.

## Usage
`/check-requirements Step {NUMBER}` or `/check-requirements Phase {NUMBER}`

## Behavior

1. **Check Planning Documents** (in priority order):
   - **FIRST**: Verify step exists in CURSOR_AI_DEVELOPMENT_PLAN.md (PRIMARY SOURCE) and load detailed specs
   - **SECOND**: Verify step order in REORGANIZED_PLAN.md
   - **THIRD**: Check FEATURE_GAP_ANALYSIS.md for additional requirements
   - **FOURTH**: Review AUTOMATION_GAP_ANALYSIS.md for automation needs

2. **Check Dependencies**:
   - Verify previous steps are complete (check git log)
   - Check required files exist
   - Validate database schema (if applicable)
   - Confirm API routes exist (if needed)

3. **Check Environment**:
   - Verify environment variables are set
   - Check Supabase connection
   - Validate GitHub authentication
   - Confirm dependencies installed
   - Verify local dev server can run (localhost:3000)

4. **Check Security**:
   - Verify .gitignore is protecting secrets
   - Check RLS policies (if database)
   - Validate input validation
   - Confirm authentication is in place

5. **Report**:
   - ✅ All requirements met - Ready to proceed
   - ⚠️ Missing optional requirements - Can proceed with warnings
   - ❌ Missing critical requirements - Must fix before proceeding

## Example
`/check-requirements Step 051`

Output:
```
Checking requirements for Step 051: Create Token Usage Table Migration

✅ Step exists in CURSOR_AI_DEVELOPMENT_PLAN.md
✅ Previous steps complete (checked git log)
✅ Supabase connection working
✅ Environment variables set
✅ Dependencies installed
✅ Local dev server ready (localhost:3000)

All requirements met. Ready to proceed.
```
