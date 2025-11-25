# Verify Step Command

## Purpose
Verify that a completed step is working correctly and meets all requirements. Must include browser testing.

## Usage
`/verify-step Step {NUMBER}`

## Behavior

1. **Check Implementation** (against CURSOR_AI_DEVELOPMENT_PLAN.md):
   - Verify "Command" was executed (if applicable)
   - Verify "File" exists at the exact path specified
   - Verify "Content" matches specifications or "Cursor Prompt" was followed
   - Check for proper error handling
   - Validate security measures are in place
   - Confirm code quality standards met

2. **Test in Local Browser**:
   - Follow "Test" instructions from CURSOR_AI_DEVELOPMENT_PLAN.md exactly
   - Guide user to test at localhost:3000
   - Check browser console for errors
   - Verify functionality works as expected
   - **CRITICAL**: Must test in browser

3. **Check Integration**:
   - Verify step integrates with previous steps
   - Check token system integration (if applicable)
   - Validate API routes work correctly
   - Test database migrations (if applicable)

4. **Check Quality**:
   - Run linter
   - Check TypeScript errors
   - Verify no console errors
   - Confirm responsive design (if UI)

5. **Verify Acceptance Criteria**:
   - Check ALL "Acceptance" criteria from CURSOR_AI_DEVELOPMENT_PLAN.md are met
   - Run "Test" instructions from CURSOR_AI_DEVELOPMENT_PLAN.md
   - Verify step works as specified

6. **Report Status**:
   - ✅ Pass: All acceptance criteria met, tests pass, browser verified
   - ⚠️ Warning: Step works but has minor issues or missing optional features
   - ❌ Fail: Acceptance criteria not met, browser test failed, or critical issues exist

## Example
`/verify-step Step 051`

This will:
- Check implementation against CURSOR_AI_DEVELOPMENT_PLAN.md
- Test in local browser
- Verify acceptance criteria
- Report status
