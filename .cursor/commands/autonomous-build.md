# Autonomous Build Command

## Purpose
Execute a single development step from CURSOR_AI_DEVELOPMENT_PLAN.md. This command processes ONE step at a time.

## Usage
`/autonomous-build Step {NUMBER}`

**OR** user pastes: `Step {NUMBER}: {Title}`

## Behavior

1. **MANDATORY: Verify Step in CURSOR_AI_DEVELOPMENT_PLAN.md**:
   - **CRITICAL**: Every step MUST be verified in `CURSOR_AI_DEVELOPMENT_PLAN.md` before proceeding
   - **MUST re-read the plan for EACH step** - never assume from memory
   - Locate the exact step by number and title
   - If step cannot be found:
     - **STOP immediately**
     - **WARN the user**: "Step {NUMBER} not found in CURSOR_AI_DEVELOPMENT_PLAN.md"
     - **ASK for clarification** - do not continue
     - **NEVER guess** or assume what the step should be
   - If step is found but ambiguous:
     - **WARN the user** about ambiguity
     - **ASK for clarification** before proceeding
   - Only proceed if step is found and confirmed

2. **Read Planning Documents** (in priority order):
   - **FIRST**: Load detailed step specifications from CURSOR_AI_DEVELOPMENT_PLAN.md (PRIMARY SOURCE)
     - Extract: Command, File path, Content/Cursor Prompt, Acceptance criteria, Test instructions
     - Follow the EXACT format provided in the plan
   - **SECOND**: Check step order and token requirements from REORGANIZED_PLAN.md
   - **THIRD**: Check dependencies (previous steps must be complete)
   - **FOURTH**: Check FEATURE_GAP_ANALYSIS.md for additional requirements
   - **FIFTH**: Verify security and automation requirements from AUTOMATION_GAP_ANALYSIS.md

3. **Execute Step**:
   - If step has "Command": Run the exact command provided
   - If step has "File": Create/modify the file at the exact path specified
   - If step has "Content": Use the exact content or "Cursor Prompt" provided
   - Follow code quality standards
   - Add proper error handling
   - Include validation where needed
   - **CRITICAL**: Follow the step format EXACTLY as written in CURSOR_AI_DEVELOPMENT_PLAN.md

4. **Test in Local Browser**:
   - Follow the "Test" instructions from CURSOR_AI_DEVELOPMENT_PLAN.md exactly
   - Guide user to test at localhost:3000
   - Check browser console for errors
   - Verify functionality works
   - **CRITICAL**: Step is NOT complete until tested in browser

5. **Verify Acceptance Criteria**:
   - Check ALL "Acceptance" criteria from CURSOR_AI_DEVELOPMENT_PLAN.md are met
   - Confirm step works as specified
   - Only mark complete when ALL criteria met

6. **Automatic Git Operations** (after user confirms step works):
  --  GitHub automation is fully configured—SSH + PAT auth, branch protection on main/develop, and the CI workflows from .github/workflows/. After each verified step, Cursor auto-commits (Step {NUMBER}: …), pushes the feature branch, runs the workflows, and rolls back or reports failures automatically.https://github.com/Asenay-Tech/Asenay-Book.git
   - **CRITICAL**: MUST wait for manual confirmation before continuing
   - **NEVER auto-advance** to the next step, even if tests pass
   - **NEVER assume** permission to continue
   - Only commit and push after explicit user confirmation
   - Commit with message: `Step {NUMBER}: {Description}`
   - Push to current feature branch
   - Create PR if step is significant (via GitHub API)

7. **Supabase Schema Validation** (if step involves database migration):
   - **Revalidate Supabase schema** after migration
   - Run: `supabase gen types typescript --linked > types/supabase.ts`
   - Verify RLS policies are correctly applied
   - Check migration status
   - **Never assume database state** - always validate after schema changes

8. **Report Results**:
   - Show what was implemented
   - Display commit hash
   - Show PR link if created
   - Confirm readiness for next step
   - **WAIT for user to paste next step**

## Important Notes

- **NEVER execute multiple steps at once**
- **ALWAYS test in local browser before marking complete**
- **ALWAYS check CURSOR_AI_DEVELOPMENT_PLAN.md FIRST** - must verify step exists
- **If step not found**: STOP, WARN, ASK - never guess
- **MUST re-read plan for EACH step** - never assume from memory
- **Wait for manual confirmation** before committing/advancing
- **NEVER auto-advance** even if tests pass
- **Revalidate Supabase schema** after any migration step

## Example
`/autonomous-build Step 051`

OR user pastes: `Step 051: Create Token Usage Table Migration`

This will:
- Read Step 51 from CURSOR_AI_DEVELOPMENT_PLAN.md
- Create Token Usage Table Migration
- Test in local browser
- Verify acceptance criteria
- Commit: `Step 051: Create Token Usage Table Migration`
- Push to feature branch
- Wait for next step
