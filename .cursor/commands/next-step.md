# Next Step Command

## Purpose
Show the next step to execute from CURSOR_AI_DEVELOPMENT_PLAN.md and prepare for execution. Helps user know what to paste next.

## Usage
`/next-step`

## Behavior

1. **Determine Current Progress**:
   - Check git log for last completed step
   - Identify current phase
   - Find next step number

2. **Load Step Details** (in priority order):
   - **FIRST**: Read detailed step specifications from CURSOR_AI_DEVELOPMENT_PLAN.md (PRIMARY SOURCE)
     - Extract: Command, File path, Content/Cursor Prompt, Acceptance criteria, Test instructions
   - **SECOND**: Check step order from REORGANIZED_PLAN.md
   - **THIRD**: Check dependencies are met
   - **FOURTH**: Verify prerequisites are complete

3. **Prepare Context**:
   - Show step number and description (format: `Step 0XX: {Title}`)
   - Display Command (if applicable)
   - Display File path(s) to create/modify
   - Show Content/Cursor Prompt preview
   - List prerequisites
   - Display Acceptance criteria
   - Show Test instructions (including browser testing)

4. **Ready for Execution**:
   - Confirm all dependencies met
   - Show what will be implemented
   - Format ready for user to paste: `Step 0XX: {Title}`
   - Remind user to test in browser after implementation

## Example
`/next-step`

Output:
```
Next Step: Step 051 - Create Token Usage Table Migration

Phase: Phase 2 - Token System Foundation
Prerequisites: ✅ Phase 1 complete

This step will:
- Create database migration for token_usage table
- Add required columns and constraints
- Set up indexes for performance

Command: (if applicable)
File: /supabase/migrations/XXXXX_create_token_usage.sql
Acceptance: Table created with all required columns
Test: Run migration, verify table exists in Supabase dashboard

Ready to execute? Paste: Step 051: Create Token Usage Table Migration
```
