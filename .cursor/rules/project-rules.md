---
alwaysApply: true
---

# Asenay-Book Development Rules

## Core Principles

1. **Single-Step Execution**: **NEVER execute multiple steps at once**. Only process ONE step at a time when the user pastes it.

2. **Step-by-Step Assistant Mode**: Act as a focused assistant that:
   - Responds ONLY to single development steps that the user pastes unless explicity requested
   - Checks each step against `CURSOR_AI_DEVELOPMENT_PLAN.md` for exact specifications
   - Generates clear, focused prompts for the dev tab
   - Formats with step tags: `Step 0XX: {Title}`
   - Tests every step in local browser before moving to next

3. **Security First**: Never commit sensitive files, always use environment variables, and follow production security best practices.

4. **Reference Planning Documents**: ALWAYS reference these files before making ANY decisions. These are the PRIMARY SOURCE OF TRUTH:
   - `CURSOR_AI_DEVELOPMENT_PLAN.md` - **PRIMARY PLAN** (800+ detailed steps) - This is the MAIN development plan with comprehensive step-by-step instructions
   - `REORGANIZED_PLAN.md` - Reorganized plan (420+ steps) - Token system moved early, use this for step order
   - `FEATURE_GAP_ANALYSIS.md` - Missing features to consider (150+ gaps identified)
   - `AUTOMATION_GAP_ANALYSIS.md` - Automation requirements (98-100% automation goals)
   - `CURSOR_AI_SETUP_GUIDE.md` - Setup instructions
   - `LEARNING_ROADMAP.md` - Technology stack reference
   
   **CRITICAL**: When implementing any step, FIRST check `CURSOR_AI_DEVELOPMENT_PLAN.md` for detailed specifications, THEN check `REORGANIZED_PLAN.md` for step order and token integration requirements.

## Development Workflow

### When User Pastes a Step:

1. **Parse the Step**:
   - Extract step number (e.g., "Step 001", "Step 051")
   - Identify step title/description

2. **MANDATORY: Verify Step in CURSOR_AI_DEVELOPMENT_PLAN.md**:
   - **CRITICAL**: Every user-pasted step MUST be verified in `CURSOR_AI_DEVELOPMENT_PLAN.md` before proceeding
   - Locate the exact step by number and title
   - If step cannot be found or matched:
     - **STOP immediately**
     - **WARN the user** that the step is not found or ambiguous
     - **DO NOT continue** - pause and ask for clarification
     - **NEVER guess** or assume what the step should be
   - If step is found but ambiguous (multiple matches):
     - **WARN the user** about ambiguity
     - **ASK for clarification** before proceeding
   - Only proceed if step is found and confirmed

3. **Check Against Planning Documents** (in priority order):
   - **FIRST**: Find the step in `CURSOR_AI_DEVELOPMENT_PLAN.md` (PRIMARY SOURCE)
     - Extract: Command, File path, Content/Cursor Prompt, Acceptance criteria, Test instructions
     - **MUST re-read the plan for EACH step** - never assume from memory
   - **SECOND**: Verify step order in `REORGANIZED_PLAN.md`
   - **THIRD**: Check dependencies (previous steps must be complete)
   - **FOURTH**: Check FEATURE_GAP_ANALYSIS.md for additional requirements
   - **FIFTH**: Verify security and automation requirements from AUTOMATION_GAP_ANALYSIS.md

3. **Generate Focused Prompt**:
   - Format: `Step 0XX: {Title}`
   - Include exact specifications from CURSOR_AI_DEVELOPMENT_PLAN.md
   - Use "Cursor Prompt" section if available (EXACT format)
   - Include Command, File, Content, Acceptance, Test details
   - Make it clear and actionable for dev tab

4. **Execute in Dev Tab**:
   - Implement following EXACT specifications
   - Follow code quality standards
   - Add proper error handling
   - Include validation where needed

5. **Test in Local Browser**:
   - Follow "Test" instructions from CURSOR_AI_DEVELOPMENT_PLAN.md
   - Verify in browser (localhost:3000)
   - Check for errors in console
   - Verify functionality works as expected
   - **CRITICAL**: Step is NOT complete until tested in browser

6. **Verify Acceptance Criteria**:
   - Check ALL "Acceptance" criteria from CURSOR_AI_DEVELOPMENT_PLAN.md are met
   - Confirm step works as specified
   - Only mark complete when ALL criteria met

7. **Commit & Push** (SEMI-AUTONOMOUS):
   - ✅ **Cursor creates files**: Autonomous file creation and modification
   - ⚠️ **User commits/pushes**: Due to terminal timeout limitations, user runs: `git add . && git commit -m "message" && git push origin main`
   - ✅ **Commit format**: Use conventional commits (feat:, fix:, docs:, db:, etc.)
   - ✅ **Rollback**: Include rollback instructions in migration comments
   - ✅ **GitHub auto-deploys**: After push, GitHub Actions deploys automatically
   
   **Technical Limitation:** Cursor's terminal tool times out on Git network operations. User must run one simple command after Cursor creates files.

### Autonomous Workflow:
1. Create/modify files
2. Auto-commit with descriptive message
3. Auto-push to GitHub
4. GitHub Actions deploys automatically via `.github/workflows/supabase-deploy.yml`
5. Continue to next task

### Commit Message Format:
```
{type}: {description}

Types:
- feat: New feature
- fix: Bug fix
- db: Database migration
- docs: Documentation
- chore: Maintenance

Examples:
- feat: add user authentication
- db: create organizations table with RLS
- fix: correct profile trigger logic
- docs: update setup guide
```

## Technology Stack (Reference LEARNING_ROADMAP.md)

- **Frontend**: Next.js 16+ (App Router), React, TypeScript, Tailwind CSS
- **Backend**: Next.js API Routes, Supabase (PostgreSQL, Auth, Storage)
- **Mobile**: React Native (Steps 301-400)
- **Deployment**: Vercel (web), App Stores (mobile)

## Security Requirements

1. **Never commit**:
   - `.env*` files
   - API keys or secrets
   - Private keys (`.pem`, `.key`)
   - Database credentials

2. **Always use**:
   - Environment variables for secrets
   - Supabase Row Level Security (RLS)
   - Input validation and sanitization
   - HTTPS only

3. **Token System**: All features must integrate token checks (Steps 51-80 built early)

## Code Quality Standards

1. **TypeScript**: Use strict typing, no `any` types
2. **Error Handling**: Always handle errors gracefully
3. **Validation**: Validate all user inputs
4. **Testing**: Test each feature in local browser after implementation
5. **Documentation**: Add comments for complex logic

## GitHub Automation (FULLY AUTONOMOUS)

1. **Automatic Commits**: After creating/modifying any files (no user confirmation needed)
2. **Automatic Push**: Push to GitHub immediately after commit
3. **GitHub Actions**: Auto-deploys via `.github/workflows/supabase-deploy.yml`
4. **Feature Branches**: Use for experimental features (optional)
5. **PR Creation**: For major features only (most changes go directly to main)
6. **Rollback**: Keep atomic commits for easy rollback via `git revert`

### Deployment Flow:
```
Cursor creates files → Auto-commit → Auto-push → GitHub Actions → Supabase deployed
```

**Zero user intervention required!**

## Phase Execution Order

**CRITICAL**: Follow phases in this exact order:
1. Phase 1: Foundation (Steps 1-50)
2. Phase 2: Token System (Steps 51-80) - Build EARLY
3. Phase 3: Core Features (Steps 81-150) - With token integration
4. Phase 4: Multi-Input Methods (Steps 151-230)
5. Phase 5: Financial Reports (Steps 223-250)
6. Phase 6: Bank Reconciliation (Steps 244-270)
7. Phase 7: Advanced Features (Steps 271-330)
8. Phase 8: Mobile Apps (Steps 301-400)
9. Phase 9: Responsive Web (Steps 401-420)

## Anti-Hallucination Rules

1. **Never invent features** not in CURSOR_AI_DEVELOPMENT_PLAN.md or REORGANIZED_PLAN.md
2. **ALWAYS check CURSOR_AI_DEVELOPMENT_PLAN.md FIRST** - it contains the detailed specifications
3. **Always verify** against planning documents before implementing ANYTHING
4. **If step exists in CURSOR_AI_DEVELOPMENT_PLAN.md**, follow it EXACTLY as written
5. **If step only exists in REORGANIZED_PLAN.md**, use it but check FEATURE_GAP_ANALYSIS.md for additional requirements
6. **Never execute multiple steps** - only process ONE step at a time
7. **Reference existing code** before creating new patterns
8. **Follow established patterns** from previous steps
9. **If step cannot be found in plan**: 
   - **STOP immediately**
   - **WARN the user** - do not continue
   - **ASK for clarification** - never guess or assume
   - **NEVER auto-generate** unrelated logic
10. **Plan-awareness per step**:
    - **MUST re-read CURSOR_AI_DEVELOPMENT_PLAN.md for EACH step**
    - Never assume step details from memory
    - Always extract fresh details: Command, File, Content, Acceptance, Test

## Step Implementation Format

Each step in CURSOR_AI_DEVELOPMENT_PLAN.md follows this format:
- **Command**: (if applicable) Exact command to run
- **File**: Exact file path to create/modify
- **Content**: What the file should contain (or reference to Cursor Prompt)
- **Acceptance**: Criteria for step completion
- **Test**: How to verify the step works (MUST test in local browser)

**CRITICAL**: 
- Follow this format exactly
- If a step has a "Cursor Prompt" section, use that EXACT prompt format
- ALWAYS test in local browser before marking step complete

## Production Readiness

Every feature must be:
- ✅ Secure (authentication, authorization, validation)
- ✅ Tested (in local browser, unit tests, integration tests)
- ✅ Documented (code comments, API docs)
- ✅ Optimized (performance, caching)
- ✅ Accessible (WCAG compliance)
- ✅ Responsive (mobile, tablet, desktop)

## Step-by-Step Assistant Behavior

When user pastes a step:

1. **Acknowledge**: Confirm you received the step
2. **Lookup**: Find step in CURSOR_AI_DEVELOPMENT_PLAN.md
3. **Extract**: Get Command, File, Content, Acceptance, Test
4. **Generate**: Create focused prompt with format `Step 0XX: {Title}`
5. **Execute**: Implement in dev tab following exact specifications
6. **Test**: Guide user to test in local browser
7. **Verify**: Confirm acceptance criteria met
8. **Commit & Push**: Automatically commit and push changes to GitHub
9. **Wait**: Wait for user to paste next step

**NEVER**:
- Execute multiple steps at once
- Skip testing in browser (when applicable)
- Invent features not in planning documents
- Continue if step cannot be found in CURSOR_AI_DEVELOPMENT_PLAN.md
- Guess or assume missing steps
- Commit sensitive files (.env*, API keys, credentials)
- Force push to main/master branches

## When in Doubt

1. **FIRST**: Check CURSOR_AI_DEVELOPMENT_PLAN.md for detailed step specifications (PRIMARY SOURCE)
2. **SECOND**: Check REORGANIZED_PLAN.md for step order and token integration
3. **THIRD**: Review FEATURE_GAP_ANALYSIS.md for missing requirements
4. **FOURTH**: Check AUTOMATION_GAP_ANALYSIS.md for automation requirements
5. **FIFTH**: Reference CURSOR_AI_SETUP_GUIDE.md for setup instructions
6. **SIXTH**: Follow security best practices
7. **SEVENTH**: Test in local browser
8. **LAST RESORT**: Ask user only if step is truly unclear after checking ALL planning documents

## Planning Document Priority Order

**When implementing ANY step, check in this order:**
1. `CURSOR_AI_DEVELOPMENT_PLAN.md` - Detailed specifications (800+ steps) - **PRIMARY SOURCE**
2. `REORGANIZED_PLAN.md` - Step order and token system (420+ steps)
3. `FEATURE_GAP_ANALYSIS.md` - Additional features needed
4. `AUTOMATION_GAP_ANALYSIS.md` - Automation requirements
5. `CURSOR_AI_SETUP_GUIDE.md` - Setup and configuration
6. `LEARNING_ROADMAP.md` - Technology reference

## Supabase Schema Validation

**CRITICAL**: After any database migration step:

1. **Revalidate Supabase Schema**:
   - Do not assume database state from memory
   - Always check the current schema after migrations
   - Verify RLS policies are correctly applied

2. **Regenerate TypeScript Types**:
   - After schema changes, run: `supabase gen types typescript --linked > types/supabase.ts`
   - This ensures TypeScript types match the actual database schema
   - Prevents type drift and runtime errors

3. **Verify RLS Policies**:
   - Check that Row Level Security policies are active
   - Verify policies match the intended access control
   - Test policies with different user roles

4. **Check Migration Status**:
   - Verify migration was applied successfully
   - Check for any migration errors
   - Confirm all tables, columns, and constraints exist

**Never assume database state** - always validate after schema changes.
