# Supabase Full Deployment Script
# Run with: .\scripts\supabase-deploy.ps1

$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"

Write-Host "[DEPLOY] Starting Supabase deployment..." -ForegroundColor Cyan

Write-Host "[1/3] Pushing database migrations..." -ForegroundColor Yellow
$pushResult = echo "y" | npx supabase db push --linked 2>&1
Write-Host $pushResult
Write-Host "[OK] Migrations done" -ForegroundColor Green

Write-Host "[2/3] Deploying Edge Functions..." -ForegroundColor Yellow
npx supabase functions deploy --project-ref shxfavcyrfzhmeyyiopq 2>&1
Write-Host "[OK] Functions done" -ForegroundColor Green

Write-Host "[3/3] Generating TypeScript types..." -ForegroundColor Yellow
npx supabase gen types typescript --linked 2>&1 | Out-File -FilePath "types\supabase.ts" -Encoding utf8 -Force
Write-Host "[OK] Types done" -ForegroundColor Green

Write-Host "[COMPLETE] Deployment finished!" -ForegroundColor Green
