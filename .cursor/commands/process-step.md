# Process Step Command

## Purpose
Process a single development step that the user pastes. This is the PRIMARY command for step-by-step development.

## Usage
User pastes a step (e.g., "Step 001: Initialize Next.js Project"), and you process it.

## Behavior

1. **Parse the Step**:
   - Extract step number (e.g., "Step 001", "Step 051")
   - Extract step title/description
   - Format: `Step 0XX: {Title}`

2. **MANDATORY: Locate Exact Step in CURSOR_AI_DEVELOPMENT_PLAN.md** (PRIMARY SOURCE):
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
   
3. **Extract All Matching Fields**:
   - **Command**: (if applicable) Exact command to run
   - **File**: Exact file path to create/modify
   - **Content**: What the file should contain (or "Cursor Prompt" section)
   - **Acceptance**: Criteria for step completion
   - **Test**: How to verify in local browser
   - Use these extracted fields to generate the implementation prompt

4. **Check Dependencies**:
   - Verify previous steps are complete (check git log)
   - Check required files exist
   - Validate prerequisites are met

5. **Generate Focused Prompt**:
   - Format: `Step 0XX: {Title}`
   - Include exact specifications from CURSOR_AI_DEVELOPMENT_PLAN.md
   - Use "Cursor Prompt" section if available (EXACT format)
   - Make it clear and actionable for dev tab
   - Include:
     - Command (if applicable)
     - File path(s)
     - Content/Cursor Prompt
     - Acceptance criteria
     - Test instructions (MUST test in browser)

6. **Execute Implementation**:
   - Run Command if specified
   - Create/modify File at exact path
   - Use Content/Cursor Prompt exactly as written
   - Follow code quality standards
   - Add error handling and validation

7. **Test in Local Browser**:
   - Follow "Test" instructions from CURSOR_AI_DEVELOPMENT_PLAN.md
   - Guide user to test at localhost:3000
   - Check browser console for errors
   - Verify functionality works
   - **CRITICAL**: Step NOT complete until tested in browser

8. **Verify Acceptance Criteria**:
   - Check ALL "Acceptance" criteria are met
   - Confirm step works as specified
   - Only mark complete when ALL criteria met

9. **Commit & Push** (after user confirms):
   - **CRITICAL**: MUST wait for manual confirmation before continuing
   - **NEVER auto-advance** to the next step, even if tests pass
   - **NEVER assume** permission to continue
   - Only commit and push after explicit user confirmation
   - Commit message: `Step {NUMBER}: {Description}`
   - Push to feature branch
   - Report completion

10. **Wait for Next Step**:
   - Do NOT proceed to next step
   - Wait for user to paste next step
   - Stay aware of global context (rules, plan, previous steps)

11. **Supabase Schema Validation** (if step involves database migration):
   - **Revalidate Supabase schema** after migration
   - Run: `supabase gen types typescript --linked > types/supabase.ts`
   - Verify RLS policies are correctly applied
   - Check migration status
   - **Never assume database state** - always validate after schema changes

## Example

User pastes: "Step 001: Initialize Next.js Project"

You:
1. Parse: Step 001
2. Lookup in CURSOR_AI_DEVELOPMENT_PLAN.md
3. Extract:
   - Command: `npx create-next-app@latest i-bookkeeper --typescript --tailwind --app --no-src-dir --import-alias "@/*" --yes`
   - Folder: / (root)
   - Acceptance: Project created, runs on localhost:3000
   - Test: `npm run dev` works
4. Generate focused prompt with format `Step 001: Initialize Next.js Project`
5. Execute command
6. Guide user to test: `npm run dev` and verify localhost:3000 works
7. Verify acceptance criteria
8. Commit: `Step 001: Initialize Next.js Project`
9. Wait for next step

## Important Notes

- **NEVER execute multiple steps at once**
- **ALWAYS test in local browser before marking complete**
- **ALWAYS check CURSOR_AI_DEVELOPMENT_PLAN.md FIRST** - must verify step exists
- **If step not found**: STOP, WARN, ASK - never guess
- **MUST re-read plan for EACH step** - never assume from memory
- **Follow EXACT format from planning documents**
- **Wait for manual confirmation** before committing/advancing
- **NEVER auto-advance** even if tests pass
- **Revalidate Supabase schema** after any migration step

