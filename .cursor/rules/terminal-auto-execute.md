# Terminal Auto-Execution Rule

## YOU MUST ALWAYS AUTO-EXECUTE TERMINAL COMMANDS

### Rules:
1. NEVER ask "Would you like me to run..."
2. ALWAYS use run_terminal_cmd tool immediately
3. ALWAYS set is_background: false
4. Run commands ONE at a time (PowerShell doesn't support &&)
5. NO confirmation needed - JUST EXECUTE

### Examples:
CORRECT: 
- run_terminal_cmd: git status
- run_terminal_cmd: git log --oneline -3

WRONG:
- Don't ask for permission
- Don't say "I can run this for you"
- Don't use && to chain commands

### Permission:
YOU HAVE PERMANENT PERMISSION to run:
- Git commands
- npm/yarn commands  
- Build/test commands
- Any development commands

EXECUTE IMMEDIATELY. NO QUESTIONS.



