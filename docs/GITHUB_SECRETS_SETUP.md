# GitHub Secrets Setup for Auto-Deployment

## Required Secret

To enable fully autonomous deployments, add your Supabase access token to GitHub Secrets.

---

## Step-by-Step Instructions

### 1. Go to Repository Settings

Visit: https://github.com/Asenay-Tech/Asenay-Book/settings/secrets/actions

### 2. Click "New repository secret"

Click the green "New repository secret" button.

### 3. Add Supabase Token

**Name:** `SUPABASE_ACCESS_TOKEN`

**Secret:** `sbp_7ef9328327fe5bb73d256dc896138d02f671d4aa`

### 4. Click "Add secret"

---

## Verification

After adding the secret, verify it's there:

1. Go to: https://github.com/Asenay-Tech/Asenay-Book/settings/secrets/actions
2. You should see: `SUPABASE_ACCESS_TOKEN` (Last updated: just now)

---

## How Auto-Deployment Works

Once the secret is added:

1. **Cursor makes changes** to `supabase/` directory
2. **Commits to Git** (automatically or you commit)
3. **Pushes to GitHub main branch**
4. **GitHub Action triggers** (`.github/workflows/supabase-deploy.yml`)
5. **Deploys automatically:**
   - Pushes database migrations
   - Deploys Edge Functions
   - Generates TypeScript types
   - Commits updated types back to repo

**Result: Zero manual commands required!**

---

## Workflow File

The auto-deployment is configured in: `.github/workflows/supabase-deploy.yml`

**Triggers on:**
- Push to `main` branch
- Changes in `supabase/` directory

**Actions:**
- `supabase db push --linked`
- `supabase functions deploy --project-ref shxfavcyrfzhmeyyiopq`
- `supabase gen types typescript --linked`

---

## Testing the Setup

### Test 1: Create a test migration

```sql
-- supabase/migrations/test_auto_deploy.sql
CREATE TABLE test_auto_deploy (id uuid PRIMARY KEY);
```

### Test 2: Commit and push

```powershell
git add supabase/migrations/test_auto_deploy.sql
git commit -m "test: auto deployment"
git push origin main
```

### Test 3: Watch GitHub Actions

Go to: https://github.com/Asenay-Tech/Asenay-Book/actions

You should see "Auto Deploy Supabase" workflow running.

### Test 4: Verify deployment

After workflow completes (green checkmark), the migration should be applied to your Supabase project.

---

## Troubleshooting

### Secret Not Working

**Check:**
1. Secret name is exactly: `SUPABASE_ACCESS_TOKEN` (case-sensitive)
2. Secret value is correct token (starts with `sbp_`)
3. Repository is public or has Actions enabled

### Workflow Not Triggering

**Check:**
1. Push was to `main` branch
2. Changes were in `supabase/` directory
3. Workflow file exists: `.github/workflows/supabase-deploy.yml`

### Deployment Failing

**Check:**
1. Supabase token is valid (not expired)
2. Project reference is correct: `shxfavcyrfzhmeyyiopq`
3. View error logs in GitHub Actions

---

## After Setup Complete

Once the secret is added:

**✅ You never run commands again**

Cursor will:
1. Create/modify files
2. Commit changes
3. Push to GitHub

GitHub will:
1. Detect changes
2. Deploy automatically
3. Update types

**100% autonomous!**

