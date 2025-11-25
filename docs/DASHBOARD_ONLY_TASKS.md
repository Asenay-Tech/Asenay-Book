# Supabase Dashboard-Only Tasks

This document identifies features that **cannot** be managed via CLI/SQL and require Supabase Dashboard access.

## Audit Date: 2025-11-25

---

## ✅ CLI-Controllable Features (VERIFIED WORKING)

| Feature | Method | Command/Approach | Status |
|---------|--------|------------------|--------|
| Database schema | Migrations | `npx supabase db push --linked` | ✅ Verified |
| RLS policies | SQL | Via migrations | ✅ Verified |
| Edge Functions | CLI | `npx supabase functions deploy` | ✅ Verified |
| Storage buckets | SQL | Via migrations | ✅ Verified |
| Storage policies | SQL | Via migrations | ✅ Verified |
| Database functions | SQL | Via migrations | ✅ Verified |
| Triggers | SQL | Via migrations | ✅ Verified |
| Cron jobs (pg_cron) | SQL | Via migrations | ✅ Verified |
| Secrets | CLI | `npx supabase secrets set` | ✅ Verified |
| Extensions | SQL | Via migrations | ✅ Verified |
| Indexes | SQL | Via migrations | ✅ Verified |
| TypeScript types | CLI | `npx supabase gen types typescript` | ✅ Verified |
| Schema diff | CLI | `npx supabase db diff` | ✅ Verified |
| Schema pull | CLI | `npx supabase db pull` | ✅ Verified |
| Function logs | CLI | `npx supabase functions logs` | ✅ Available |

---

## ⚠️ Dashboard-Required Features

### 1. OAuth Provider Configuration
**Status:** ❌ Dashboard Only

**What:** Configure OAuth providers (Google, GitHub, Apple, etc.)

**Why Dashboard:** OAuth credentials (Client ID, Client Secret) must be entered in Dashboard. No CLI/API support.

**Workaround:** None. Must use Dashboard.

**Dashboard URL:** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/auth/providers

**Documentation:** See `docs/OAUTH_SETUP.md`

---

### 2. Auth Email Templates
**Status:** ❌ Dashboard Only

**What:** Customize email templates for:
- Confirmation emails
- Password reset emails
- Magic link emails
- Invite emails

**Why Dashboard:** No CLI command to update email templates.

**Workaround:** Use custom SMTP with your own email service (Resend, SendGrid) via Edge Functions for full control.

**Dashboard URL:** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/auth/templates

---

### 3. Auth Redirect URLs
**Status:** ❌ Dashboard Only

**What:** Configure allowed redirect URLs for OAuth and magic links.

**Why Dashboard:** Security setting, no CLI support.

**Workaround:** None. Must configure in Dashboard.

**Dashboard URL:** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/auth/url-configuration

**Required URLs:**
- `http://localhost:3000` (development)
- `https://your-production-domain.com` (production)

---

### 4. Rate Limiting Configuration
**Status:** ⚠️ Partial Control

**What:** Configure rate limits for API and Auth endpoints.

**CLI Control:** None for global settings.

**SQL Control:** Can implement custom rate limiting via database functions.

**Dashboard URL:** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/settings/api

**Workaround:** Implement rate limiting in Edge Functions or middleware:

```typescript
// Edge Function rate limiting example
const rateLimiter = new Map<string, number[]>();

function checkRateLimit(ip: string, limit: number, windowMs: number): boolean {
  const now = Date.now();
  const requests = rateLimiter.get(ip) || [];
  const validRequests = requests.filter(t => now - t < windowMs);
  
  if (validRequests.length >= limit) return false;
  
  validRequests.push(now);
  rateLimiter.set(ip, validRequests);
  return true;
}
```

---

### 5. Custom SMTP Configuration
**Status:** ❌ Dashboard Only

**What:** Configure custom SMTP server for auth emails.

**Why Dashboard:** Security credentials, no CLI support.

**Dashboard URL:** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/settings/auth

**Workaround:** Use Edge Functions with Resend/SendGrid for transactional emails (already implemented in `send-email` function).

---

### 6. Project Settings
**Status:** ❌ Dashboard Only

**What:**
- Project name
- Project region (cannot change after creation)
- Pause/resume project
- Delete project

**Dashboard URL:** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/settings/general

---

### 7. Database Connection Pooling Settings
**Status:** ❌ Dashboard Only

**What:** Configure PgBouncer pool size and mode.

**Dashboard URL:** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/settings/database

---

### 8. Realtime Configuration
**Status:** ⚠️ Partial Control

**What:** Enable/disable Realtime for specific tables.

**SQL Control:** Can enable via SQL:
```sql
ALTER PUBLICATION supabase_realtime ADD TABLE your_table;
```

**Dashboard:** For global Realtime settings.

**Dashboard URL:** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/database/replication

---

### 9. API Settings
**Status:** ❌ Dashboard Only

**What:**
- Expose/hide schemas via API
- JWT expiry time
- Max rows returned

**Dashboard URL:** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/settings/api

---

### 10. Log Explorer / Observability
**Status:** ⚠️ Partial Control

**What:** View logs, set up log drains.

**CLI Control:** `npx supabase functions logs` for Edge Functions only.

**Dashboard:** Full log explorer for all services.

**Dashboard URL:** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/logs/explorer

---

## 📊 Autonomy Summary

| Category | Total Features | CLI/SQL Controllable | Dashboard Only |
|----------|---------------|---------------------|----------------|
| Database | 10 | 10 (100%) | 0 |
| Edge Functions | 3 | 3 (100%) | 0 |
| Auth | 5 | 1 (20%) | 4 |
| Settings | 5 | 0 (0%) | 5 |
| **TOTAL** | **23** | **14 (61%)** | **9 (39%)** |

---

## 🔧 Management API Alternatives

Supabase provides a [Management API](https://supabase.com/docs/reference/api/introduction) that can automate some dashboard tasks:

### Available via Management API:
- ✅ List projects
- ✅ Get project details
- ✅ Pause/restore project
- ✅ Get database settings
- ❌ OAuth provider config (not available)
- ❌ Email templates (not available)
- ❌ Redirect URLs (not available)

### Management API Example:

```bash
# List projects
curl -X GET "https://api.supabase.com/v1/projects" \
  -H "Authorization: Bearer sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"

# Get project details
curl -X GET "https://api.supabase.com/v1/projects/shxfavcyrfzhmeyyiopq" \
  -H "Authorization: Bearer sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa"
```

---

## 🎯 Achieving Maximum Autonomy

### For 100% Development Autonomy:
1. ✅ All database operations via migrations
2. ✅ All Edge Functions via CLI
3. ✅ All secrets via CLI
4. ⚠️ Auth: Use custom auth flow via Edge Functions if needed
5. ⚠️ Emails: Use Resend/SendGrid via Edge Functions (implemented)

### One-Time Dashboard Setup Required:
1. Configure OAuth providers (Google, GitHub)
2. Set allowed redirect URLs
3. Configure custom SMTP (optional)
4. Set API rate limits (optional)

### After Initial Setup:
**Cursor AI has 100% autonomous control** for:
- All database changes
- All code deployments
- All secrets management
- All Edge Function updates

---

## 📋 Dashboard Setup Checklist

Complete these one-time tasks in Dashboard:

- [ ] **Auth Providers:** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/auth/providers
  - [ ] Enable Google OAuth
  - [ ] Enable GitHub OAuth
  
- [ ] **Redirect URLs:** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/auth/url-configuration
  - [ ] Add `http://localhost:3000`
  - [ ] Add production URL
  
- [ ] **Email Templates (optional):** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/auth/templates
  - [ ] Customize confirmation email
  - [ ] Customize password reset email

- [ ] **SMTP (optional):** https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/settings/auth
  - [ ] Configure custom SMTP

After completing this checklist, **no further Dashboard access is required** for day-to-day development.

