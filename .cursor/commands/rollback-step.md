# Rollback Step Command

## Purpose
Rollback a failed step to the last good commit. Preserves history for debugging.

## Usage
`/rollback-step Step {NUMBER}`

## Behavior

1. **Identify Last Good Commit**:
   - Find commit for the step to rollback
   - Identify previous good commit
   - Check git log for safe rollback point

2. **Execute Safe Rollback**:
   - Create backup branch (optional)
   - Reset to last good commit
   - Preserve uncommitted work if safe
   - Report what was rolled back

3. **Verify Rollback**:
   - Confirm code is in good state
   - Check no critical files lost
   - Verify can proceed with next step

4. **Report**:
   - Show what was rolled back
   - Display current commit
   - Confirm ready to retry step

## Example
`/rollback-step Step 051`

This will:
- Find last good commit before Step 051
- Rollback to that commit
- Preserve history
- Report status
