# Network Troubleshooting Guide

## Issue: Supabase CLI Cannot Connect

**Symptom:** `Ping request could not find host db.shxfavcyrfzhmeyyiopq.supabase.co`

---

## Step 1: Run Diagnostics

Open PowerShell and run these commands:

```powershell
# Test basic internet
ping google.com -n 2

# Flush DNS cache
ipconfig /flushdns

# Test Supabase pooler endpoint
nslookup aws-0-eu-central-1.pooler.supabase.com

# Test direct Supabase endpoint
nslookup db.shxfavcyrfzhmeyyiopq.supabase.co

# Test Supabase API (should work if internet is fine)
$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"
npx supabase projects list
```

---

## Step 2: Interpret Results

### Scenario A: Google works, Supabase DNS fails
**Cause:** DNS resolution issue

**Fix (Run as Administrator):**
```powershell
# Set Google DNS
netsh interface ip set dns "Wi-Fi" static 8.8.8.8
netsh interface ip add dns "Wi-Fi" 8.8.4.4 index=2

# Flush DNS
ipconfig /flushdns

# Release and renew IP
ipconfig /release
ipconfig /renew
```

### Scenario B: Nothing works (google.com fails too)
**Cause:** No internet connection

**Fix:**
1. Check Wi-Fi/Ethernet connection
2. Restart router
3. Disable VPN if active
4. Try: `netsh winsock reset` (Run as Admin, then restart)

### Scenario C: nslookup works but ping fails
**Cause:** Firewall blocking ICMP

**Fix:**
1. This is actually OK - ICMP (ping) may be blocked but HTTP works
2. Test with: `npx supabase projects list`
3. If projects list works, the connection is fine

### Scenario D: Supabase API works but db push hangs
**Cause:** Database port (5432/6543) blocked

**Fix:**
1. Check Windows Firewall for port blocks
2. Disable VPN
3. Try different network (mobile hotspot)

---

## Step 3: Verify Connection Fixed

After applying fixes, test with:

```powershell
$env:SUPABASE_ACCESS_TOKEN="sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"
npx supabase projects list
```

If this returns your project list, run:

```powershell
.\scripts\supabase-deploy.ps1
```

---

## Common Causes

| Issue | Cause | Fix |
|-------|-------|-----|
| DNS timeout | ISP DNS slow | Use Google DNS (8.8.8.8) |
| Connection refused | Firewall | Allow Node.js through firewall |
| Hanging forever | VPN interference | Disable VPN |
| SSL errors | Corporate proxy | Bypass proxy for Supabase |

---

## Quick Fixes Summary

```powershell
# 1. Flush DNS (always try first)
ipconfig /flushdns

# 2. Use Google DNS (Run as Admin)
netsh interface ip set dns "Wi-Fi" static 8.8.8.8

# 3. Reset network stack (Run as Admin, then restart PC)
netsh winsock reset
netsh int ip reset

# 4. Disable IPv6 temporarily
# Control Panel → Network → Adapter → Properties → Uncheck IPv6
```

---

## Supabase Endpoints

| Endpoint | Purpose | Port |
|----------|---------|------|
| `db.shxfavcyrfzhmeyyiopq.supabase.co` | Direct database | 5432 |
| `aws-0-eu-central-1.pooler.supabase.com` | Connection pooler | 5432/6543 |
| `shxfavcyrfzhmeyyiopq.supabase.co` | API/Auth | 443 |
| `api.supabase.com` | Management API | 443 |

---

## Check Supabase Status

Visit: https://status.supabase.com/

If Supabase is having issues, wait and try later.

---

## Last Resort

If nothing works:
1. Try from mobile hotspot
2. Try from different network
3. Contact ISP about DNS issues
4. Wait 30 minutes and try again (DNS propagation)

