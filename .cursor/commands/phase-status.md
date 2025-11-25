# Phase Status Command

## Purpose
Show overall progress across all phases. Helps track where you are in the development plan.

## Usage
`/phase-status`

## Behavior

1. **Check Git History**:
   - Parse commit messages to find completed steps
   - Identify current phase
   - Count completed steps per phase

2. **Load Phase Information**:
   - Read REORGANIZED_PLAN.md for phase structure
   - Count total steps per phase
   - Calculate completion percentage

3. **Display Status**:
   - Overall completion percentage
   - Phase-by-phase status:
     - Phase name
     - Steps completed / Total steps
     - Completion percentage
     - Status (Not Started, In Progress, Complete)
   - Current step tracking
   - Next step to execute

4. **Format**:
   - Clear visual representation
   - Progress bars or percentages
   - Highlight current phase
   - Show next step ready to execute

## Example
`/phase-status`

Output:
```
Overall Progress: 12% (10/800+ steps)

Phase 1: Foundation (Steps 1-50)
  ✅ Complete: 10/50 steps (20%)
  Current: Step 011
  Next: Step 011: Create Sign Up Page Route

Phase 2: Token System (Steps 51-80)
  ⏸️ Not Started: 0/30 steps (0%)

Phase 3: Core Features (Steps 81-150)
  ⏸️ Not Started: 0/70 steps (0%)

...
```
