# OAuth Provider Setup Guide

This document explains how to configure OAuth providers for Asenay-Book authentication.

## Supabase Project Details

- **Project Reference:** `shxfavcyrfzhmeyyiopq`
- **Callback URL:** `https://shxfavcyrfzhmeyyiopq.supabase.co/auth/v1/callback`

---

## Google OAuth Setup

### Step 1: Create Google Cloud Project

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing one
3. Enable the **Google+ API** and **Google Identity** services

### Step 2: Configure OAuth Consent Screen

1. Navigate to **APIs & Services** → **OAuth consent screen**
2. Select **External** user type
3. Fill in required fields:
   - App name: `Asenay-Book`
   - User support email: Your email
   - Developer contact: Your email
4. Add scopes:
   - `email`
   - `profile`
   - `openid`

### Step 3: Create OAuth Credentials

1. Go to **APIs & Services** → **Credentials**
2. Click **Create Credentials** → **OAuth client ID**
3. Select **Web application**
4. Configure:
   - Name: `Asenay-Book Web Client`
   - Authorized JavaScript origins:
     - `http://localhost:3000` (development)
     - `https://your-production-domain.com` (production)
   - Authorized redirect URIs:
     - `https://shxfavcyrfzhmeyyiopq.supabase.co/auth/v1/callback`

### Step 4: Configure in Supabase Dashboard

1. Go to [Supabase Dashboard](https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/auth/providers)
2. Find **Google** provider
3. Toggle **Enable Sign in with Google**
4. Enter:
   - **Client ID:** (from Google Cloud Console)
   - **Client Secret:** (from Google Cloud Console)
5. Save

---

## GitHub OAuth Setup

### Step 1: Create GitHub OAuth App

1. Go to [GitHub Developer Settings](https://github.com/settings/developers)
2. Click **OAuth Apps** → **New OAuth App**
3. Fill in:
   - Application name: `Asenay-Book`
   - Homepage URL: `https://your-production-domain.com`
   - Authorization callback URL: `https://shxfavcyrfzhmeyyiopq.supabase.co/auth/v1/callback`
4. Click **Register application**

### Step 2: Get Credentials

1. After registration, you'll see your **Client ID**
2. Click **Generate a new client secret**
3. Copy both values securely

### Step 3: Configure in Supabase Dashboard

1. Go to [Supabase Dashboard](https://supabase.com/dashboard/project/shxfavcyrfzhmeyyiopq/auth/providers)
2. Find **GitHub** provider
3. Toggle **Enable Sign in with GitHub**
4. Enter:
   - **Client ID:** (from GitHub)
   - **Client Secret:** (from GitHub)
5. Save

---

## Frontend Implementation

### Using Supabase Auth UI

```tsx
import { Auth } from '@supabase/auth-ui-react';
import { ThemeSupa } from '@supabase/auth-ui-shared';
import { supabase } from '@/lib/supabase';

export function AuthComponent() {
  return (
    <Auth
      supabaseClient={supabase}
      appearance={{ theme: ThemeSupa }}
      providers={['google', 'github']}
      redirectTo={`${window.location.origin}/auth/callback`}
    />
  );
}
```

### Manual OAuth Sign-In

```typescript
import { supabase } from '@/lib/supabase';

// Google Sign-In
async function signInWithGoogle() {
  const { data, error } = await supabase.auth.signInWithOAuth({
    provider: 'google',
    options: {
      redirectTo: `${window.location.origin}/auth/callback`,
    },
  });
}

// GitHub Sign-In
async function signInWithGitHub() {
  const { data, error } = await supabase.auth.signInWithOAuth({
    provider: 'github',
    options: {
      redirectTo: `${window.location.origin}/auth/callback`,
    },
  });
}
```

### Auth Callback Handler

Create `app/auth/callback/route.ts`:

```typescript
import { createRouteHandlerClient } from '@supabase/auth-helpers-nextjs';
import { cookies } from 'next/headers';
import { NextResponse } from 'next/server';

export async function GET(request: Request) {
  const requestUrl = new URL(request.url);
  const code = requestUrl.searchParams.get('code');

  if (code) {
    const supabase = createRouteHandlerClient({ cookies });
    await supabase.auth.exchangeCodeForSession(code);
  }

  return NextResponse.redirect(requestUrl.origin);
}
```

---

## Environment Variables

Add to `.env.local`:

```env
# Already configured
NEXT_PUBLIC_SUPABASE_URL=https://shxfavcyrfzhmeyyiopq.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key

# OAuth redirect (for frontend)
NEXT_PUBLIC_SITE_URL=http://localhost:3000
```

---

## Testing OAuth

1. Start your development server: `npm run dev`
2. Navigate to your login page
3. Click "Sign in with Google" or "Sign in with GitHub"
4. Complete the OAuth flow
5. Verify user appears in Supabase Dashboard → Authentication → Users

---

## Troubleshooting

### "redirect_uri_mismatch" Error
- Ensure callback URL exactly matches: `https://shxfavcyrfzhmeyyiopq.supabase.co/auth/v1/callback`
- Check for trailing slashes

### "access_denied" Error
- Verify OAuth consent screen is configured
- Check that required scopes are added
- Ensure app is not in "Testing" mode with restricted users

### User Not Created in Database
- Check that the `on_auth_user_created` trigger is active
- Verify RLS policies on `profiles` table

---

## Security Checklist

- [ ] OAuth credentials stored securely (not in code)
- [ ] Callback URLs use HTTPS in production
- [ ] Consent screen properly configured
- [ ] Rate limiting enabled on auth endpoints
- [ ] Session management configured correctly

