@echo off
echo Starting Supabase deployment...

set SUPABASE_ACCESS_TOKEN=sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa

echo [1/3] Pushing migrations...
echo y | npx supabase db push --linked

echo [2/3] Deploying functions...
npx supabase functions deploy --project-ref shxfavcyrfzhmeyyiopq

echo [3/3] Generating types...
npx supabase gen types typescript --linked > types\supabase.ts

echo.
echo Deployment complete!
pause

