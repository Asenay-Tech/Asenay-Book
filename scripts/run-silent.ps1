# Run Supabase commands silently in background
param([string]$command)

$env:SUPABASE_ACCESS_TOKEN = "sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"

Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"$command`"" -NoNewWindow -Wait

