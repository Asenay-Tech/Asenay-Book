@echo off
set SUPABASE_ACCESS_TOKEN=sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa
npx supabase gen types typescript --linked > types\supabase.ts
echo Types generated!

