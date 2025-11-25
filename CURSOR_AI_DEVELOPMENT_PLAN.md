# Asenay-Book: CURSOR AI DEVELOPMENT PLAN

## DEVELOPMENT PHILOSOPHY

- Each step is a single, focused task
- Test after every step
- One file at a time when possible
- Clear dependencies between steps
- Cursor AI-friendly: small, specific prompts
- Token system built EARLY (Steps 51-80) - no retrofitting needed

## PLATFORM SUPPORT

- ✅ Web App (Next.js) - Responsive, works on all devices
- ✅ Android App (React Native) - Steps 400+
- ✅ iPhone App (React Native) - Steps 400+
- ✅ Shared API Backend (works for web and mobile)

Key tools across the plan:

Frontend: Next.js 16+ or latest (App Router), React, TypeScript, Tailwind CSS, next-intl for i18n, Recharts/Chart.js for dashboards, PWA support.
Backend: Next.js API routes, Supabase (PostgreSQL, Auth, Storage, Realtime), BullMQ/cron queues, Swagger/OpenAPI docs, Sentry, Redis/cache layer (planned).
Auth/Security: Supabase auth, TOTP/SMS 2FA, session middleware, CSRF/XSS protections, rate limiting.
Payments/Finance APIs: Stripe (subscriptions + checkout), Plaid (bank/credit card feeds), QuickBooks & Xero connectors, Odoo ..etc, PayPal/Square integrations.
Data/Automation: OCR (tesseract.js or equivalent), QR/Barcode libs (jsQR, ZXing), Puppeteer/Playwright for portal scraping, TensorFlow/Prophet/GBM for ML + forecasting, Isolation Forest for fraud detection.
Mobile: React Native (TypeScript), React Navigation, AsyncStorage, camera/image picker modules.
DevOps & GitHub: GitHub Actions, protected branches, auto-commit/push, rollback workflows, SSH + PAT auth, automated CI/CD
GitHub is configured so Cursor AI can operate autonomously: branch protection, workflow automation, webhook permissions, PAT scopes, and SSH auth are already set. After each verified step, Cursor can auto-commit, push, run CI workflows, manage PRs, and even trigger rollback via GitHub Actions. This gives a full safety net—every change is atomic, logged, and automatically tested before merging.

## SUBSCRIPTION MODEL

**ALL PLANS HAVE FULL ACCESS TO ALL FEATURES**
- Limits are token-based only
- Free Trial: 1,000 tokens (14 days, one-time)
- Basic: 5,000 tokens/month
- Starter: 25,000 tokens/month
- Pro: 100,000 tokens/month
- Plus: 500,000 tokens/month
- customize

---

## PHASE 1: FOUNDATION (Steps 1-50)

### Setup & Configuration (Steps 1-10)

**Step 1: Initialize Next.js 16+ latest Project**

Command: `npx create-next-app@latest Asenay-Book --typescript --tailwind --app --no-src-dir --import-alias "@/*" --yes`

Folder: / (root)

Acceptance: Project created, runs on localhost:3000

Test: `npm run dev` works

---

**Step 2: Install Supabase Client**

Command: `npm install @supabase/supabase-js @supabase/ssr`

Folder: / (root)

Acceptance: Packages installed

Test: No errors in package.json

---

**Step 3: Create Environment File Template**

File: `/.env.example`

Content: Template with placeholder values:
```
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
```

Acceptance: File exists with all required variables

Test: File is readable

---

**Step 4: Create Local Environment File**

File: `/.env.local`

Content: Copy from .env.example, add real Supabase values


Acceptance: File exists, not in git

Test: File is gitignored

---

**Step 5: Create Supabase Client (Browser)**

File: `/lib/supabase/client.ts`

Content: Browser client using createBrowserClient

Acceptance: Client exports correctly

Test: Import works without errors

---

**Step 6: Create Supabase Client (Server)**

File: `/lib/supabase/server.ts`

Content: Server client using createServerClient with cookies

Acceptance: Client exports correctly

Test: Import works without errors

---

**Step 7: Create Supabase Middleware Helper**

File: `/lib/supabase/middleware.ts`

Content: updateSession function for middleware

Acceptance: Function exports correctly

Test: Import works without errors

---

**Step 8: Create Next.js Middleware**

File: `/middleware.ts`

Content: Middleware that calls updateSession

Acceptance: Middleware runs on all routes

Test: No errors on page load

---

**Step 9: Update Gitignore**

File: `/.gitignore`

Content: Add .env.local, .env*.local

Acceptance: Environment files ignored

Test: Git status doesn't show .env.local

---

**Step 10: Test Supabase Connection**

File: `/app/test-connection/page.tsx` (temporary)

Content: Simple page that tests Supabase connection

Acceptance: Can connect to Supabase

Test: Page loads, shows connection status

---

### Authentication - Sign Up (Steps 11-20)

**Step 11: Create Sign Up Page Route**

File: `/app/auth/signup/page.tsx`

Content: Basic page structure with heading

Acceptance: Page accessible at /auth/signup

Test: Navigate to /auth/signup, page loads

---

**Step 12: Create Sign Up Form Component**

File: `/components/auth/SignUpForm.tsx`

Content: Form with email and password fields (no functionality)

Acceptance: Form displays correctly

Test: Form renders on signup page

---

**Step 13: Add Form State Management**

File: `/components/auth/SignUpForm.tsx`

Content: Add useState for email, password, loading

Acceptance: Form fields are controlled

Test: Can type in fields

---

**Step 14: Add Form Validation**

File: `/components/auth/SignUpForm.tsx`

Content: Basic validation (email format, password length)

Acceptance: Shows validation errors

Test: Invalid inputs show errors

---

**Step 15: Create Sign Up API Route**

File: `/app/api/auth/signup/route.ts`

Content: POST handler that calls supabase.auth.signUp

Acceptance: API route exists

Test: Can call API endpoint

---

**Step 16: Connect Form to API**

File: `/components/auth/SignUpForm.tsx`

Content: Add onSubmit handler that calls API

Acceptance: Form submits to API

Test: Clicking submit calls API

---

**Step 17: Handle Sign Up Success**

File: `/components/auth/SignUpForm.tsx`

Content: Show success message, redirect to verification page

Acceptance: Success flow works

Test: Successful signup shows message

---

**Step 18: Handle Sign Up Errors**

File: `/components/auth/SignUpForm.tsx`

Content: Display error messages from API

Acceptance: Errors display correctly

Test: Invalid signup shows error

---

**Step 19: Add Loading State**

File: `/components/auth/SignUpForm.tsx`

Content: Disable form, show loading spinner during submission

Acceptance: Loading state works

Test: Button disabled during submission

---

**Step 20: Style Sign Up Page**

File: `/app/auth/signup/page.tsx`, `/components/auth/SignUpForm.tsx`

Content: Add Tailwind styling for professional look

Acceptance: Page looks good

Test: Visual inspection

---

### Authentication - Sign In (Steps 21-30)

**Step 21: Create Sign In Page Route**

**Cursor Prompt:**

```
Create a new page at /app/auth/login/page.tsx

This is the sign in page. It should display a heading and import a LoginForm component (we'll create that next).

The file should contain:

import LoginForm from '@/components/auth/LoginForm'
import Link from 'next/link'

export default function LoginPage() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-indigo-50 to-white py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-md w-full space-y-8">
        <div className="bg-white rounded-lg shadow-xl p-8">
          <div className="text-center">
            <h2 className="text-3xl font-extrabold text-gray-900">
              Sign in to Asenay-Book
            </h2>
            <p className="mt-2 text-sm text-gray-600">
              Enter your credentials to access your account
            </p>
          </div>
          <LoginForm />
          <div className="mt-6 text-center">
            <p className="text-sm text-gray-600">
              Don't have an account?{' '}
              <Link href="/auth/signup" className="font-medium text-indigo-600 hover:text-indigo-500">
                Sign up
              </Link>
            </p>
          </div>
        </div>
      </div>
    </div>
  )
}
```

**File path:** `/app/auth/login/page.tsx`

**How to test:**

1. Navigate to http://localhost:3000/auth/login
2. You should see the heading "Sign in to Asenay-Book"
3. You'll see an error about LoginForm not found (expected - we'll create it next)

**Acceptance:**

- Page accessible at `/auth/login`
- Heading displays
- Page looks styled

---

####################### Henok ###############
Use the magic link feature, that requires a 6 digit verification code


#################################################################

**Step 22: Create Sign In Form Component**

**Cursor Prompt:**

```
Create a new component at /components/auth/LoginForm.tsx

This is a client component (needs 'use client' directive) that displays a sign in form with email and password fields.

The file should contain:

'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'

export default function LoginForm() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const router = useRouter()

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError('')
    
    try {
      const response = await fetch('/api/auth/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, password }),
      })
      
      const data = await response.json()
      
      if (!response.ok) {
        setError(data.error || 'Login failed')
        return
      }
      
      // Success - redirect to dashboard
      router.push('/dashboard')
    } catch (error) {
      setError('An unexpected error occurred')
    } finally {
      setLoading(false)
    }
  }

  return (
    <form onSubmit={handleSubmit} className="mt-8 space-y-6">
      {error && (
        <div className="rounded-md bg-red-50 p-4">
          <p className="text-sm text-red-800">{error}</p>
        </div>
      )}
      <div className="rounded-md shadow-sm -space-y-px">
        <div>
          <label htmlFor="email" className="sr-only">
            Email address
          </label>
          <input
            id="email"
            name="email"
            type="email"
            autoComplete="email"
            required
            value={email}
            onChange={(e) => {
              setEmail(e.target.value)
              if (error) setError('')
            }}
            className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
            placeholder="Email address"
          />
        </div>
        <div>
          <label htmlFor="password" className="sr-only">
            Password
          </label>
          <input
            id="password"
            name="password"
            type="password"
            autoComplete="current-password"
            required
            value={password}
            onChange={(e) => {
              setPassword(e.target.value)
              if (error) setError('')
            }}
            className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
            placeholder="Password"
          />
        </div>
      </div>

      <div>
        <button
          type="submit"
          disabled={loading}
          className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          {loading ? (
            <span className="flex items-center">
              <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              Signing in...
            </span>
          ) : (
            'Sign in'
          )}
        </button>
      </div>
    </form>
  )
}
```

**File path:** `/components/auth/LoginForm.tsx`

**How to test:**

1. Navigate to `/auth/login`
2. Form should display with email and password fields
3. Type in both fields - they should work
4. Click submit button
5. Should redirect to dashboard on success or show error

**Acceptance:**

- Form displays correctly
- Can type in fields
- Submit button works
- Redirects on success

---

**Step 23: Add Form State to Login**

**Note:** This is already done in Step 22. The form already has useState for email, password, loading, and error. Verify it's working.

**How to test:**

1. Type in email field - value should update
2. Type in password field - value should update
3. Fields are controlled (connected to state)

**Acceptance:**

- Form fields are controlled
- State updates when typing

---

**Step 24: Create Sign In API Route**

**Cursor Prompt:**

```
Create a new API route at /app/api/auth/login/route.ts

This API route handles user sign in. It should:
1. Accept POST requests
2. Get email and password from request body
3. Use Supabase to sign in the user
4. Return success or error response

The file should contain:

import { createClient } from '@/lib/supabase/server'
import { NextResponse } from 'next/server'

export async function POST(request: Request) {
  try {
    const { email, password } = await request.json()

    if (!email || !password) {
      return NextResponse.json(
        { error: 'Email and password are required' },
        { status: 400 }
      )
    }

    const supabase = await createClient()
    
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    })

    if (error) {
      return NextResponse.json(
        { error: error.message },
        { status: 401 }
      )
    }

    return NextResponse.json(
      { 
        message: 'Sign in successful',
        user: data.user 
      },
      { status: 200 }
    )
  } catch (error) {
    return NextResponse.json(
      { error: 'An unexpected error occurred' },
      { status: 500 }
    )
  }
}
```

**File path:** `/app/api/auth/login/route.ts`

**How to test:**

1. Test the API using browser console:
   ```javascript
   fetch('/api/auth/login', {
     method: 'POST',
     headers: { 'Content-Type': 'application/json' },
     body: JSON.stringify({ email: 'test@example.com', password: 'testpassword123' })
   }).then(r => r.json()).then(console.log)
   ```
2. Should return success message or error
3. Check browser cookies - should have auth session

**Acceptance:**

- API route exists
- Accepts POST requests
- Returns JSON response
- Handles errors correctly

---

**Step 25: Connect Login Form to API**

**Note:** This is already done in Step 22. The form already calls the API. Verify it's working.

**How to test:**

1. Fill in valid email and password
2. Click submit
3. Button should show "Signing in..." and be disabled
4. Check network tab - should see POST request to /api/auth/login
5. Should redirect to dashboard on success

**Acceptance:**

- Form calls API on submit
- Loading state works
- Redirects on success
- Shows error on failure

---

**Step 26: Handle Login Success**

**Note:** This is already done in Step 22. The form redirects to dashboard on success. Verify it's working.

**How to test:**

1. Sign in with valid credentials
2. Should redirect to /dashboard
3. User should be authenticated

**Acceptance:**

- Redirects to dashboard on success
- User is authenticated

---

**Step 27: Handle Login Errors**

**Note:** This is already done in Step 22. The form displays errors. Verify it's working.

**How to test:**

1. Try signing in with invalid credentials
2. Should see red error message
3. Error should display clearly

**Acceptance:**

- Errors from API are displayed
- Error message is clear and visible
- Errors clear when user starts typing

---

**Step 28: Add Loading State to Login**

**Note:** This is already done in Step 22. The form has loading state with spinner. Verify it's working.

**How to test:**

1. Fill in form and click submit
2. Button should show spinner and "Signing in..." text
3. Button should be disabled during submission
4. Spinner should animate

**Acceptance:**

- Loading spinner displays
- Button is disabled during submission
- Visual feedback is clear

---

**Step 29: Style Login Page**

**Note:** This is already done in Step 21. The page has professional styling. Verify it's working.

**How to test:**

1. Navigate to `/auth/login`
2. Page should look polished
3. Should have a link to sign up page
4. Background should have gradient

**Acceptance:**

- Page looks professional
- Has link to sign up
- Styling is consistent

---

**Step 30: Test Full Auth Flow**

**Action:** Test complete authentication flow

**How to test:**

1. Sign up with a new account
2. Verify email (if required)
3. Sign in with credentials
4. Should redirect to dashboard
5. User should be authenticated

**Acceptance:**

- Complete flow works
- User can sign up and sign in
- Authentication persists

**Test:** End-to-end test

---

### Database Schema - Core Tables (Steps 31-40)

**Step 31: Create Businesses Table Migration**

File: `/supabase/migrations/001_create_businesses.sql`

Content: CREATE TABLE businesses with all columns

Acceptance: Migration file created

Test: File exists

---

**Step 32: Add RLS to Businesses Table**

File: `/supabase/migrations/001_create_businesses.sql`

Content: Enable RLS, add policies for SELECT, INSERT, UPDATE

Acceptance: RLS policies added

Test: Migration runs without errors

---

**Step 33: Run Businesses Migration**

Command: Apply migration in Supabase dashboard or CLI

Acceptance: Table created in database

Test: Table exists in Supabase

---

**Step 34: Create Accounts Table Migration**

File: `/supabase/migrations/002_create_accounts.sql`

Content: CREATE TABLE accounts with foreign key to businesses

Acceptance: Migration file created

Test: File exists

---

**Step 35: Add Indexes to Accounts Table**

File: `/supabase/migrations/002_create_accounts.sql`

Content: Indexes on business_id, account_type, parent_account_id

Acceptance: Indexes defined

Test: Migration runs

---

**Step 36: Add RLS to Accounts Table**

File: `/supabase/migrations/002_create_accounts.sql`

Content: RLS policies for accounts

Acceptance: Policies added

Test: Migration runs

---

**Step 37: Create Categories Table Migration**

File: `/supabase/migrations/003_create_categories.sql`

Content: CREATE TABLE categories

Acceptance: Migration file created

Test: File exists

---

**Step 38: Add RLS to Categories Table**

File: `/supabase/migrations/003_create_categories.sql`

Content: RLS policies

Acceptance: Policies added

Test: Migration runs

---

**Step 39: Create Transactions Table Migration**

File: `/supabase/migrations/004_create_transactions.sql`

Content: CREATE TABLE transactions with all fields

Acceptance: Migration file created

Test: File exists

---

**Step 40: Add Indexes to Transactions Table**

File: `/supabase/migrations/004_create_transactions.sql`

Content: Indexes on business_id, transaction_date, category_id, status

Acceptance: Indexes defined

Test: Migration runs

---

### Database Schema - Supporting Tables (Steps 41-50)

**Step 41: Add RLS to Transactions Table**

File: `/supabase/migrations/004_create_transactions.sql`

Content: RLS policies for transactions

Acceptance: Policies added

Test: Migration runs

---

**Step 42: Create Transaction Lines Table Migration**

File: `/supabase/migrations/005_create_transaction_lines.sql`

Content: CREATE TABLE transaction_lines for double-entry

Acceptance: Migration file created

Test: File exists

---

**Step 43: Add Foreign Keys to Transaction Lines**

File: `/supabase/migrations/005_create_transaction_lines.sql`

Content: Foreign keys to transactions and accounts

Acceptance: Foreign keys defined

Test: Migration runs

---

**Step 44: Add RLS to Transaction Lines**

File: `/supabase/migrations/005_create_transaction_lines.sql`

Content: RLS policies

Acceptance: Policies added

Test: Migration runs

---

**Step 45: Create Bank Accounts Table Migration**

File: `/supabase/migrations/006_create_bank_accounts.sql`

Content: CREATE TABLE bank_accounts

Acceptance: Migration file created

Test: File exists

---

**Step 46: Create Bank Transactions Table Migration**

File: `/supabase/migrations/007_create_bank_transactions.sql`

Content: CREATE TABLE bank_transactions

Acceptance: Migration file created

Test: File exists

---

**Step 47: Create Documents Table Migration**

File: `/supabase/migrations/008_create_documents.sql`

Content: CREATE TABLE documents with OCR fields

Acceptance: Migration file created

Test: File exists

---

**Step 48: Create Audit Logs Table Migration**

File: `/supabase/migrations/009_create_audit_logs.sql`

Content: CREATE TABLE audit_logs

Acceptance: Migration file created

Test: File exists

---

**Step 49: Add Indexes to All Tables**

File: `/supabase/migrations/010_add_indexes.sql`

Content: Additional indexes for performance

Acceptance: Indexes added

Test: Migration runs

---

**Step 50: Test All Database Tables**

Action: Verify all tables exist in Supabase

Acceptance: All tables created

Test: Check Supabase dashboard

---

### API Infrastructure & Documentation (Steps 50A-50J)

**Step 50A: Install API Documentation Libraries**

Command: `npm install swagger-ui-react swagger-jsdoc` or `@scalar/nextjs-api-reference`

Acceptance: Packages installed

Test: Can import libraries

---

**Step 50B: Create OpenAPI Specification**

File: `/lib/api/openapi.ts`

Content: Generate OpenAPI spec from API routes

Acceptance: OpenAPI spec generated

Test: Spec is valid

---

**Step 50C: Create API Documentation Page**

File: `/app/api/docs/page.tsx`

Content: Interactive API documentation with Swagger UI

Acceptance: API docs accessible

Test: Can view API docs

---

**Step 50D: Add API Versioning Middleware**

File: `/lib/middleware/api-version.ts`

Content: Middleware to handle API versioning (/api/v1/, /api/v2/)

Acceptance: Versioning works

Test: Can access versioned APIs

---

**Step 50E: Create Health Check Endpoint**

File: `/app/api/health/route.ts`

Content: GET handler returning basic health status

Acceptance: Health check works

Test: Can check health

---

**Step 50F: Create System Status Endpoint**

File: `/app/api/status/route.ts`

Content: GET handler returning detailed system status (database, external services)

Acceptance: Status endpoint works

Test: Can check system status

---

**Step 50G: Install Error Tracking (Sentry)**

Command: `npm install @sentry/nextjs`

Acceptance: Sentry installed

Test: Can import Sentry

---

**Step 50H: Configure Sentry**

File: `/sentry.client.config.ts`, `/sentry.server.config.ts`, `/sentry.edge.config.ts`

Content: Configure Sentry for error tracking

Acceptance: Sentry configured

Test: Errors tracked

---

**Step 50I: Add Error Boundaries**

File: `/components/ErrorBoundary.tsx`

Content: React error boundary component

Acceptance: Error boundaries work

Test: Errors caught

---

**Step 50J: Setup Structured Logging**

File: `/lib/logging/logger.ts`

Content: Structured logging service

Acceptance: Logging works

Test: Logs generated

---

### API Keys & Authentication (Steps 50K-50T)

**Step 50K: Create API Keys Table Migration**

File: `/supabase/migrations/038_create_api_keys.sql`

Content: CREATE TABLE api_keys with user_id, key_hash, name, last_used, rate_limit

Acceptance: Table created

Test: Table exists

---

**Step 50L: Create API Key Generation Service**

File: `/lib/api/api-key-generator.ts`

Content: Generate secure API keys

Acceptance: Service works

Test: Keys generated

---

**Step 50M: Create API Key Management API**

File: `/app/api/api-keys/route.ts`

Content: CRUD operations for API keys

Acceptance: API works

Test: Can manage API keys

---

**Step 50N: Create API Key Management UI**

File: `/app/settings/api-keys/page.tsx`

Content: UI to create, view, revoke API keys

Acceptance: UI works

Test: Can manage API keys

---

**Step 50O: Create API Key Validation Middleware**

File: `/lib/middleware/api-key-auth.ts`

Content: Middleware to validate API keys

Acceptance: Middleware works

Test: API keys validated

---

**Step 50P: Add Rate Limiting Per API Key**

File: `/lib/middleware/api-key-rate-limit.ts`

Content: Rate limiting based on API key

Acceptance: Rate limiting works

Test: Limits enforced

---

**Step 50Q: Track API Key Usage**

File: `/lib/api/api-key-usage.ts`

Content: Track API key usage and last used time

Acceptance: Tracking works

Test: Usage tracked

---

**Step 50R: Create API Key Regeneration**

File: `/app/api/api-keys/[id]/regenerate/route.ts`

Content: POST handler to regenerate API key

Acceptance: API works

Test: Can regenerate key

---

**Step 50S: Add API Key Scopes**

File: `/supabase/migrations/039_add_api_key_scopes.sql`

Content: Add scopes to API keys for fine-grained permissions

Acceptance: Scopes added

Test: Scopes work

---

**Step 50T: Test API Key System**

Action: Test API key generation, validation, rate limiting

Acceptance: API keys work

Test: End-to-end test

---

### Webhook System (Steps 50U-50AD)

**Step 50U: Create Webhooks Table Migration**

File: `/supabase/migrations/040_create_webhooks.sql`

Content: CREATE TABLE webhooks with business_id, url, events, secret, enabled

Acceptance: Table created

Test: Table exists

---

**Step 50V: Create Webhook Events Table**

File: `/supabase/migrations/041_create_webhook_events.sql`

Content: CREATE TABLE webhook_events for event types

Acceptance: Table created

Test: Table exists

---

**Step 50W: Create Webhook Registration API**

File: `/app/api/webhooks/route.ts`

Content: CRUD operations for webhooks

Acceptance: API works

Test: Can manage webhooks

---

**Step 50X: Create Webhook Management UI**

File: `/app/settings/webhooks/page.tsx`

Content: UI to register and manage webhooks

Acceptance: UI works

Test: Can manage webhooks

---

**Step 50Y: Create Webhook Delivery Service**

File: `/lib/webhooks/delivery.ts`

Content: Service to deliver webhooks to registered URLs

Acceptance: Service works

Test: Webhooks delivered

---

**Step 50Z: Create Webhook Retry Queue**

File: `/lib/webhooks/retry-queue.ts`

Content: Queue for failed webhook deliveries with retry logic

Acceptance: Queue works

Test: Retries work

---

**Step 50AA: Create Webhook Signature Verification**

File: `/lib/webhooks/signature.ts`

Content: Generate and verify webhook signatures

Acceptance: Signatures work

Test: Signatures verified

---

**Step 50AB: Create Webhook Logs Table**

File: `/supabase/migrations/042_create_webhook_logs.sql`

Content: CREATE TABLE webhook_logs for delivery logs

Acceptance: Table created

Test: Table exists

---

**Step 50AC: Create Webhook Logs UI**

File: `/app/settings/webhooks/[id]/logs/page.tsx`

Content: UI to view webhook delivery logs

Acceptance: UI works

Test: Can view logs

---

**Step 50AD: Test Webhook System**

Action: Test webhook registration, delivery, retries

Acceptance: Webhooks work

Test: End-to-end test

---

## PHASE 2: TOKEN SYSTEM FOUNDATION (Steps 51-80) ⭐ MOVED EARLY

**Build token system BEFORE building features - ensures all features integrate tokens from the start**

### Database Schema for Tokens (Steps 51-60)

**Step 51: Create Subscription Plans Table Migration**

File: `/supabase/migrations/011_create_subscription_plans.sql`

Content: CREATE TABLE subscription_plans with tokens_per_month, storage_gb, team_size, is_trial, trial_duration_days

Acceptance: Table created

Test: Table exists

---

**Step 52: Create Subscriptions Table Migration**

File: `/supabase/migrations/012_create_subscriptions.sql`

Content: CREATE TABLE subscriptions linking businesses to plans with trial_start, trial_end

Acceptance: Table created

Test: Table exists

---

**Step 53: Create Token Usage Table Migration**

File: `/supabase/migrations/013_create_token_usage.sql`

Content: CREATE TABLE token_usage with tokens_allocated, tokens_used, tokens_remaining

Acceptance: Table created

Test: Table exists

---

**Step 54: Create Token Transactions Table Migration**

File: `/supabase/migrations/014_create_token_transactions.sql`

Content: CREATE TABLE token_transactions for audit trail

Acceptance: Table created

Test: Table exists

---

**Step 55: Add RLS Policies to Token Tables**

File: `/supabase/migrations/015_add_token_rls.sql`

Content: RLS policies for subscription_plans, subscriptions, token_usage, token_transactions

Acceptance: RLS policies added

Test: Migration runs

---

**Step 56: Add Indexes to Token Tables**

File: `/supabase/migrations/016_add_token_indexes.sql`

Content: Indexes on business_id, subscription_id, period_start, period_end

Acceptance: Indexes defined

Test: Migration runs

---

**Step 57: Seed Subscription Plans Data**

File: `/supabase/seed_subscription_plans.sql`

Content: Insert Free Trial (1000 tokens, 14 days), Basic (5000), Starter (25000), Pro (100000), Plus (500000)

Acceptance: All plans seeded

Test: Can query plans

---

**Step 58: Test Token Database Schema**

Action: Verify all token tables exist and have correct structure

Acceptance: All tables created correctly

Test: Check Supabase dashboard

---

**Step 59: Create Token Allocation Database Function**

File: `/supabase/migrations/017_create_token_functions.sql`

Content: Function to allocate tokens on subscription start/renewal

Acceptance: Function created

Test: Function works

---

**Step 60: Test Database Functions**

Action: Test token allocation function

Acceptance: Functions work correctly

Test: Can call function

---

### Token System Core Logic (Steps 61-70)

**Step 61: Create Token Allocation Function**

File: `/lib/billing/tokens.ts`

Content: Function to allocate tokens on subscription start/renewal

Acceptance: Function works

Test: Unit test allocation

---

**Step 62: Create Token Check Function**

File: `/lib/billing/tokens.ts`

Content: Function to check if user has enough tokens

Acceptance: Function works

Test: Unit test token check

---

**Step 63: Create Token Deduction Function**

File: `/lib/billing/tokens.ts`

Content: Function to deduct tokens and record transaction

Acceptance: Tokens deducted

Test: Unit test deduction

---

**Step 64: Create Token Transaction Logger**

File: `/lib/billing/tokens.ts`

Content: Function to log token transactions for audit trail

Acceptance: Transactions logged

Test: Unit test logging

---

**Step 65: Create Token Usage Calculator**

File: `/lib/billing/tokens.ts`

Content: Function to calculate remaining tokens

Acceptance: Calculation works

Test: Unit test calculation

---

**Step 66: Create Token Middleware**

File: `/lib/middleware/token-check.ts`

Content: Middleware to check tokens before API calls

Acceptance: Middleware works

Test: Blocks when no tokens


**Step 67: Create Token Status API**

File: `/app/api/subscription/token-status/route.ts`

Content: GET handler returning current token usage and remaining

Acceptance: API returns status

Test: Can fetch status

**Step 68: Create Token Status Component**

File: `/components/billing/TokenStatus.tsx`

Content: Display tokens used vs allocated

Acceptance: Status displays

Test: Can see token status

**Step 69: Test Token System Core**

Action: Test token allocation, check, deduction, logging

Acceptance: System works correctly

Test: End-to-end test

**Step 70: Add Token Status to Dashboard**

File: `/app/dashboard/page.tsx`

Content: Display token status on dashboard

Acceptance: Token status shows on dashboard

Test: Can see tokens on dashboard

### Free Trial System (Steps 71-80)

**Step 71: Auto-Assign Free Trial on Signup**

File: `/app/api/auth/signup/route.ts`

Content: After user signup, create subscription with Free Trial plan and allocate 1000 tokens

Acceptance: Trial assigned

Test: New users get trial

**Step 72: Create Trial Expiration Check**

File: `/lib/billing/trial.ts`

Content: Check if trial has expired

Acceptance: Expiration check works

Test: Unit test expiration

**Step 73: Create Trial Status API**

File: `/app/api/subscription/trial-status/route.ts`

Content: GET handler returning trial status and remaining days

Acceptance: API returns status

Test: Can fetch trial status

**Step 74: Create Trial Status Component**

File: `/components/billing/TrialStatus.tsx`

Content: Display trial days remaining, tokens remaining

Acceptance: Status displays

Test: Can see trial status

**Step 75: Create Plan Selection Popup Component**

File: `/components/billing/PlanSelectionModal.tsx`

Content: Modal showing all plans, upgrade options

Acceptance: Modal displays

Test: Can see plans

**Step 76: Show Popup When Tokens Exhausted**

File: Token check middleware or API responses

Content: Return special response when tokens exhausted, trigger popup

Acceptance: Response triggers popup

Test: Popup shows on exhaustion

---

**Step 77: Show Popup When Trial Expires**

File: Middleware or page load

Content: Check trial expiration, show popup

Acceptance: Popup shows on expiration

Test: Popup shows after trial

---

**Step 78: Add Upgrade Flow from Popup**

File: `/components/billing/PlanSelectionModal.tsx`

Content: Handle plan selection, redirect to checkout

Acceptance: Upgrade flow works

Test: Can upgrade from popup

---

**Step 79: Block Actions After Trial Expires**

File: Token middleware

Content: Block all token-requiring actions if trial expired

Acceptance: Actions blocked

Test: Can't use after expiration

---

**Step 80: Add Trial Warning Notifications**

File: `/components/billing/TrialWarning.tsx`

Content: Show warning when trial ending soon (3 days, 1 day)

Acceptance: Warnings show

Test: Can see warnings

---

## PHASE 3: CORE FEATURES WITH TOKEN INTEGRATION (Steps 81-200)

**All features built with token checks from the start**

### Business Setup (Steps 81-90)

**Step 81: Create Business Setup Page Route**

File: `/app/setup/business/page.tsx`

Content: Basic page structure

Acceptance: Page accessible

Test: Navigate to page

**Step 82: Create Business Form Component**

File: `/components/business/BusinessForm.tsx`

Content: Form with business name, tax ID, address fields
Acceptance: Form displays
Test: Form renders

**Step 83: Add Business Form State**
File: `/components/business/BusinessForm.tsx`
Content: useState for all form fields
Acceptance: Form is controlled
Test: Can type in fields

---

**Step 84: Create Create Business API Route**

File: `/app/api/businesses/route.ts`

Content: POST handler that inserts into businesses table (Free Trial already assigned in Step 71)

Acceptance: API route exists

Test: Can call endpoint

---

**Step 85: Connect Business Form to API**

File: `/components/business/BusinessForm.tsx`

Content: onSubmit handler

Acceptance: Form submits

Test: Submit creates business

---

**Step 86: Handle Business Creation Success**

File: `/components/business/BusinessForm.tsx`

Content: Redirect to dashboard, store business_id in session

Acceptance: Redirects after creation

Test: Success redirects

---

**Step 87: Add Business Validation**

File: `/components/business/BusinessForm.tsx`

Content: Validate required fields

Acceptance: Validation works

Test: Empty form shows errors

---

**Step 88: Style Business Setup Page**

File: `/app/setup/business/page.tsx`, `/components/business/BusinessForm.tsx`

Content: Add Tailwind styling

Acceptance: Page styled

Test: Visual inspection

---

**Step 89: Create Get Business API Route**

File: `/app/api/businesses/route.ts`

Content: GET handler to fetch user's business

Acceptance: API returns business

Test: Can fetch business

---

**Step 90: Add Business Context Provider**

File: `/lib/context/BusinessContext.tsx`

Content: React context to store current business

Acceptance: Context created

Test: Can use context

---

## PHASE 3: COMPREHENSIVE ADMIN DASHBOARD (Steps 80A-80ZZ)

**Note**: This admin dashboard allows you to control ALL system settings without editing source code. Build this early so you can configure the system as features are developed.

### Admin Access Control & Foundation (Steps 80A-80J)

**Step 80A: Create Admin Role in Database**

File: `/supabase/migrations/028_create_admin_role.sql`

Content: Add 'admin' role to roles table, create admin permissions

Acceptance: Admin role exists

Test: Admin role in database

---

**Step 80B: Create Admin Settings Tables**

File: `/supabase/migrations/029_create_admin_settings.sql`

Content: CREATE TABLE admin_settings (feature_toggles, model_settings, token_costs, retry_limits, env_configs)

Acceptance: Tables created

Test: Tables exist

---

**Step 80C: Create Admin Middleware**

File: `/middleware.ts` (update)

Content: Protect /admin/** routes, check admin role

Acceptance: Admin routes protected

Test: Non-admins blocked

---

**Step 80D: Create Admin Layout**

File: `/app/admin/layout.tsx`

Content: Admin layout with navigation, admin-only access check
Acceptance: Layout works
Test: Admin layout displays

---

**Step 80E: Create Admin Dashboard Home**

File: `/app/admin/page.tsx`

Content: Admin dashboard home with overview stats

Acceptance: Dashboard accessible

Test: Can access admin dashboard

---

**Step 80F: Create Admin API Protection**

File: `/lib/middleware/admin-api-check.ts`

Content: Middleware to protect all /api/admin/** routes
Acceptance: API routes protected

Test: Unauthorized access blocked

---

**Step 80G: Create Admin Hooks - useAdminSettings**

File: `/lib/hooks/useAdminSettings.ts`

Content: Hook to fetch and update admin settings

Acceptance: Hook works

Test: Can use hook

---

**Step 80H: Create Admin Hooks - useAdminUsers**

File: `/lib/hooks/useAdminUsers.ts`

Content: Hook to manage admin users

Acceptance: Hook works

Test: Can use hook

---

**Step 80I: Create Admin Hooks - useAdminTokens**

File: `/lib/hooks/useAdminTokens.ts`

Content: Hook to manage tokens and subscriptions

Acceptance: Hook works

Test: Can use hook

---

**Step 80J: Add RLS Policies for Admin Tables**

File: `/supabase/migrations/030_admin_rls.sql`

Content: RLS policies allowing only admins to read/write admin tables

Acceptance: RLS policies work

Test: Only admins can access

---

### System Settings Management (Steps 80K-80T)

**Step 80K: Create System Settings API**

File: `/app/api/admin/settings/system/route.ts`

Content: GET/PUT handlers for system settings (feature toggles, model settings, etc.)

Acceptance: API works

Test: Can get/update settings

---

**Step 80L: Create Global Feature Toggles UI**

File: `/app/admin/settings/features/page.tsx`

Content: Toggle switches for OCR, QR, barcode, forecasting, NLP, fraud detection, etc.

Acceptance: Toggles work

Test: Can toggle features

---

**Step 80M: Create Model Settings UI**

File: `/app/admin/settings/models/page.tsx`

Content: Configure OCR engine, AI model versions, forecasting models

Acceptance: Settings work

Test: Can configure models

---

**Step 80N: Create Token Cost Per Feature UI**

File: `/app/admin/settings/token-costs/page.tsx`

Content: Edit token cost for each feature (OCR, QR, barcode, forecasting, etc.)

Acceptance: Token costs editable

Test: Can edit token costs

---

**Step 80O: Create Retry Limits Configuration UI**

File: `/app/admin/settings/retry-limits/page.tsx`

Content: Configure retry limits for OCR, QR, barcode, camera processing

Acceptance: Retry limits configurable

Test: Can set retry limits

---

**Step 80P: Create Environment/Config Values UI**

File: `/app/admin/settings/env-config/page.tsx`

Content: View and edit env/config values stored in database (API keys, thresholds, etc.)

Acceptance: Config values editable

Test: Can edit config values

---

**Step 80Q: Create System Settings Service**

File: `/lib/admin/system-settings.ts`

Content: Service to read/write system settings from database

Acceptance: Service works

Test: Settings persist

---

**Step 80R: Add Settings Validation**

File: `/lib/admin/settings-validator.ts`

Content: Validate settings before saving (ranges, types, etc.)

Acceptance: Validation works

Test: Invalid settings rejected

---

**Step 80S: Add Settings Change History**

File: `/supabase/migrations/031_settings_history.sql`

Content: CREATE TABLE to track all settings changes

Acceptance: History tracked

Test: Changes logged

---

**Step 80T: Test System Settings**

Action: Test all system settings features

Acceptance: All settings work

Test: End-to-end test

---

### Token & Subscription Control (Steps 80U-80AD)

**Step 80U: Create Token Plans Management API**

File: `/app/api/admin/tokens/plans/route.ts`

Content: GET/PUT handlers to edit token allocation for each plan

Acceptance: API works

Test: Can update token plans

---

**Step 80V: Create Token Plans Management UI**

File: `/app/admin/tokens/plans/page.tsx`

Content: Edit token allocation for Trial, Basic, Starter, Pro, Plus plans

Acceptance: UI works

Test: Can edit token allocations

---

**Step 80W: Create Token Cost Per Action UI**

File: `/app/admin/tokens/costs/page.tsx`

Content: Change token cost per action (OCR, QR, barcode, forecasting, etc.)

Acceptance: Token costs editable

Test: Can edit token costs

---

**Step 80X: Create User Token Usage Viewer**

File: `/app/admin/tokens/usage/page.tsx`

Content: View token usage for any user, filter by date, plan, etc.

Acceptance: Usage viewer works

Test: Can view token usage

---

**Step 80Y: Create Reset User Tokens API**

File: `/app/api/admin/tokens/reset/route.ts`

Content: POST handler to reset token usage for a user

Acceptance: Reset works

Test: Can reset tokens

---

**Step 80Z: Create Reset User Tokens UI**

File: `/app/admin/tokens/reset/page.tsx`

Content: UI to reset token usage for any user

Acceptance: UI works

Test: Can reset tokens

---

**Step 80AA: Create Subscription Plans Management API**

File: `/app/api/admin/subscriptions/plans/route.ts`

Content: CRUD operations for subscription plans (Trial, Basic, Starter, Pro, Plus, customize)

Acceptance: API works

Test: Can manage plans

---

**Step 80AB: Create Subscription Plans Management UI**

File: `/app/admin/subscriptions/plans/page.tsx`

Content: Manage all subscription plans, edit features, prices, etc.

Acceptance: UI works

Test: Can manage plans

---

### Payment Processing Integration (Steps 80AD-80AM)

**Step 80AD: Install Stripe SDK**

Command: `npm install stripe @stripe/stripe-js`

Acceptance: Stripe installed

Test: Can import Stripe

---

**Step 80AE: Create Stripe Configuration**

File: `/.env.local`

Content: Add Stripe keys (STRIPE_SECRET_KEY, STRIPE_PUBLISHABLE_KEY, STRIPE_WEBHOOK_SECRET)

Acceptance: Keys configured

Test: Keys accessible

---

**Step 80AF: Create Stripe Customer API**

File: `/app/api/payments/create-customer/route.ts`

Content: POST handler to create Stripe customer

Acceptance: API works

Test: Can create customer

---

**Step 80AG: Create Payment Method Management API**

File: `/app/api/payments/payment-methods/route.ts`

Content: CRUD operations for payment methods

Acceptance: API works

Test: Can manage payment methods

---

**Step 80AH: Create Payment Method UI**

File: `/app/settings/billing/payment-methods/page.tsx`

Content: UI to manage payment methods

Acceptance: UI works

Test: Can manage payment methods

---

**Step 80AI: Create Subscription Checkout API**

File: `/app/api/payments/checkout/route.ts`

Content: POST handler to create Stripe checkout session

Acceptance: API works

Test: Can create checkout

---

**Step 80AJ: Create Subscription Checkout UI**

File: `/app/billing/checkout/page.tsx`

Content: UI for subscription checkout

Acceptance: UI works

Test: Can checkout

---

**Step 80AK: Create Stripe Webhook Handler**

File: `/app/api/webhooks/stripe/route.ts`

Content: Handle Stripe webhooks (payment succeeded, failed, subscription updated)

Acceptance: Webhooks work

Test: Webhooks processed

---

**Step 80AL: Create Invoice Generation API**

File: `/app/api/payments/invoices/route.ts`

Content: Generate and send invoices via Stripe

Acceptance: API works

Test: Can generate invoices

---

**Step 80AM: Create Payment History UI**

File: `/app/settings/billing/payment-history/page.tsx`

Content: UI to view payment history

Acceptance: UI works

Test: Can view history

---

**Step 80AC: Create User Subscriptions Viewer**

File: `/app/admin/subscriptions/users/page.tsx`

Content: View all user subscriptions, filter, search

Acceptance: Viewer works

Test: Can view subscriptions

---

**Step 80AD: Test Token & Subscription Control**

Action: Test all token and subscription management features

Acceptance: All features work

Test: End-to-end test

---

### User & Business Management (Steps 80AE-80AN)

**Step 80AE: Create Users List API**

File: `/app/api/admin/users/route.ts`

Content: GET handler to list all users with pagination, search, filters

Acceptance: API works

Test: Can list users

---

**Step 80AF: Create Users List UI**

File: `/app/admin/users/page.tsx`

Content: Table showing all users, search, filters, pagination

Acceptance: UI works

Test: Can view users

---

**Step 80AG: Create Promote/Demote Admin API**

File: `/app/api/admin/users/[id]/role/route.ts`

Content: POST handler to promote/demote admin role

Acceptance: API works

Test: Can change admin status

---

**Step 80AH: Create Promote/Demote Admin UI**

File: `/components/admin/UserRoleManager.tsx`

Content: UI to promote/demote admin role for users

Acceptance: UI works

Test: Can change roles

---

**Step 80AI: Create Suspend User API**

File: `/app/api/admin/users/[id]/suspend/route.ts`

Content: POST handler to suspend/unsuspend users

Acceptance: API works

Test: Can suspend users

---

**Step 80AJ: Create Suspend User UI**

File: `/components/admin/UserSuspension.tsx`

Content: UI to suspend/unsuspend users

Acceptance: UI works

Test: Can suspend users

---

**Step 80AK: Create Businesses List API**

File: `/app/api/admin/businesses/route.ts`

Content: GET handler to list all businesses

Acceptance: API works

Test: Can list businesses

---

**Step 80AL: Create Businesses List UI**

File: `/app/admin/businesses/page.tsx`

Content: Table showing all businesses, search, filters

Acceptance: UI works

Test: Can view businesses

---

**Step 80AM: Create Override Business Settings API**

File: `/app/api/admin/businesses/[id]/settings/route.ts`

Content: PUT handler to override business settings

Acceptance: API works

Test: Can override settings

---

**Step 80AN: Test User & Business Management**

Action: Test all user and business management features

Acceptance: All features work

Test: End-to-end test

---

### Transactions & Categorization Management (Steps 80AO-80AX)

**Step 80AO: Create Global Category Editor API**

File: `/app/api/admin/categories/route.ts`

Content: CRUD operations for global categories

Acceptance: API works

Test: Can manage categories

---

**Step 80AP: Create Global Category Editor UI**

File: `/app/admin/categories/page.tsx`

Content: Editor to manage all global categories

Acceptance: UI works

Test: Can edit categories

---

**Step 80AQ: Create Auto-Categorization Rules API**

File: `/app/api/admin/categorization/rules/route.ts`

Content: CRUD operations for auto-categorization rules

Acceptance: API works

Test: Can manage rules

---

**Step 80AR: Create Auto-Categorization Rules UI**

File: `/app/admin/categorization/rules/page.tsx`

Content: Manage auto-categorization rules (enable, disable, reorder)

Acceptance: UI works

Test: Can manage rules

---

**Step 80AS: Create Force Recategorization API**

File: `/app/api/admin/categorization/recategorize/route.ts`

Content: POST handler to force recategorization for any business

Acceptance: API works

Test: Can trigger recategorization

---

**Step 80AT: Create Force Recategorization UI**

File: `/app/admin/categorization/recategorize/page.tsx`

Content: UI to force recategorization for businesses

Acceptance: UI works

Test: Can recategorize

---

**Step 80AU: Create Rule Priority Management**

File: `/components/admin/RulePriorityManager.tsx`

Content: Drag-and-drop to reorder categorization rules

Acceptance: Priority management works

Test: Can reorder rules

---

**Step 80AV: Create Rule Testing Tool**

File: `/app/admin/categorization/test/page.tsx`

Content: Test categorization rules against sample transactions

Acceptance: Testing tool works

Test: Can test rules

---

**Step 80AW: Add Rule Import/Export**

File: `/app/api/admin/categorization/rules/import-export/route.ts`

Content: Import/export categorization rules as JSON

Acceptance: Import/export works

Test: Can import/export rules

---

**Step 80AX: Test Transactions & Categorization Management**

Action: Test all categorization management features

Acceptance: All features work

Test: End-to-end test

---

### Document Pipeline Management (Steps 80AY-80BH)

**Step 80AY: Create Documents List API**

File: `/app/api/admin/documents/route.ts`

Content: GET handler to list all documents with OCR/QR/Barcode status

Acceptance: API works

Test: Can list documents

---

**Step 80AZ: Create Documents List UI**

File: `/app/admin/documents/page.tsx`

Content: Table showing all documents with processing status

Acceptance: UI works

Test: Can view documents

---

**Step 80BA: Create Retry Failed Jobs API**

File: `/app/api/admin/documents/[id]/retry/route.ts`

Content: POST handler to retry failed OCR/QR/Barcode jobs

Acceptance: API works

Test: Can retry jobs

---

**Step 80BB: Create Retry Failed Jobs UI**

File: `/components/admin/DocumentRetry.tsx`

Content: UI to retry failed document processing jobs

Acceptance: UI works

Test: Can retry jobs

---

**Step 80BC: Create OCR Processing Rules API**

File: `/app/api/admin/documents/ocr-rules/route.ts`

Content: Configure OCR processing rules (preprocessing, confidence thresholds, etc.)

Acceptance: API works

Test: Can configure rules

---

**Step 80BD: Create OCR Processing Rules UI**

File: `/app/admin/documents/ocr-rules/page.tsx`

Content: UI to configure OCR processing rules

Acceptance: UI works

Test: Can configure OCR

---

**Step 80BE: Create QR Processing Rules API**

File: `/app/api/admin/documents/qr-rules/route.ts`

Content: Configure QR code processing rules

Acceptance: API works

Test: Can configure rules

---

**Step 80BF: Create QR Processing Rules UI**

File: `/app/admin/documents/qr-rules/page.tsx`

Content: UI to configure QR processing rules

Acceptance: UI works

Test: Can configure QR

---

**Step 80BG: Create Barcode Processing Rules API**

File: `/app/api/admin/documents/barcode-rules/route.ts`

Content: Configure barcode processing rules

Acceptance: API works

Test: Can configure rules

---

**Step 80BH: Test Document Pipeline Management**

Action: Test all document pipeline management features

Acceptance: All features work

Test: End-to-end test

---

### AI Forecasting & Insights Configuration (Steps 80BI-80BR)

**Step 80BI: Create Forecasting Models Configuration API**

File: `/app/api/admin/ai/forecasting/models/route.ts`

Content: Configure forecasting models (LSTM, Prophet, GBM, etc.)

Acceptance: API works

Test: Can configure models

---

**Step 80BJ: Create Forecasting Models Configuration UI**

File: `/app/admin/ai/forecasting/models/page.tsx`

Content: UI to configure forecasting models

Acceptance: UI works

Test: Can configure models

---

**Step 80BK: Create Overspending Alert Thresholds API**

File: `/app/api/admin/ai/insights/thresholds/route.ts`

Content: Set thresholds for overspending alerts

Acceptance: API works

Test: Can set thresholds

---

**Step 80BL: Create Overspending Alert Thresholds UI**

File: `/app/admin/ai/insights/thresholds/page.tsx`

Content: UI to configure overspending alert thresholds

Acceptance: UI works

Test: Can configure thresholds

---

**Step 80BM: Create Anomaly Detection Thresholds API**

File: `/app/api/admin/ai/anomaly/thresholds/route.ts`

Content: Set thresholds for anomaly detection

Acceptance: API works

Test: Can set thresholds

---

**Step 80BN: Create Anomaly Detection Thresholds UI**

File: `/app/admin/ai/anomaly/thresholds/page.tsx`

Content: UI to configure anomaly detection thresholds

Acceptance: UI works

Test: Can configure thresholds

---

**Step 80BO: Create Waste Detection Thresholds API**

File: `/app/api/admin/ai/waste/thresholds/route.ts`

Content: Set thresholds for waste detection

Acceptance: API works

Test: Can set thresholds

---

**Step 80BP: Create Waste Detection Thresholds UI**

File: `/app/admin/ai/waste/thresholds/page.tsx`

Content: UI to configure waste detection thresholds

Acceptance: UI works

Test: Can configure thresholds

---

**Step 80BQ: Create Vendor Analysis Settings API**

File: `/app/api/admin/ai/vendor/settings/route.ts`

Content: Configure vendor analysis settings

Acceptance: API works

Test: Can configure settings

---

**Step 80BR: Test AI Forecasting & Insights Configuration**

Action: Test all AI configuration features

Acceptance: All features work

Test: End-to-end test

---

### Notifications Management (Steps 80BS-80CA)

**Step 80BS: Create Email Templates API**

File: `/app/api/admin/notifications/email-templates/route.ts`

Content: CRUD operations for email templates

Acceptance: API works

Test: Can manage templates

---

**Step 80BT: Create Email Templates UI**

File: `/app/admin/notifications/email-templates/page.tsx`

Content: Editor to edit email templates

Acceptance: UI works

Test: Can edit templates

---

**Step 80BU: Create Slack Templates API**

File: `/app/api/admin/notifications/slack-templates/route.ts`

Content: CRUD operations for Slack templates

Acceptance: API works

Test: Can manage templates

---

**Step 80BV: Create Slack Templates UI**

File: `/app/admin/notifications/slack-templates/page.tsx`

Content: Editor to edit Slack templates

Acceptance: UI works

Test: Can edit templates

---

**Step 80BW: Create Alert Types Configuration API**

File: `/app/api/admin/notifications/alert-types/route.ts`

Content: Enable/disable alert types

Acceptance: API works

Test: Can configure alerts

---

**Step 80BX: Create Alert Types Configuration UI**

File: `/app/admin/notifications/alert-types/page.tsx`

Content: UI to enable/disable alert types

Acceptance: UI works

Test: Can configure alerts

---

**Step 80BY: Add Template Variables**

File: `/components/admin/TemplateVariables.tsx`

Content: Show available template variables for email/Slack templates

Acceptance: Variables display

Test: Can see variables

---

**Step 80BZ: Add Template Preview**

File: `/components/admin/TemplatePreview.tsx`

Content: Preview email/Slack templates with sample data

Acceptance: Preview works

Test: Can preview templates

---

**Step 80CA: Test Notifications Management**

Action: Test all notification management features

Acceptance: All features work

Test: End-to-end test

---

### Email Service Integration (Steps 80CB-80CJ)

**Step 80CB: Install Email Service**

Command: `npm install resend` or `@sendgrid/mail` or `@aws-sdk/client-ses`

Acceptance: Email service installed

Test: Can import service

---

**Step 80CC: Create Email Service Configuration**

File: `/.env.local`

Content: Add email service API keys

Acceptance: Keys configured

Test: Keys accessible

---

**Step 80CD: Create Email Service Wrapper**

File: `/lib/email/email-service.ts`

Content: Email service wrapper for sending emails

Acceptance: Service works

Test: Can send emails

---

**Step 80CE: Create Email Queue Table**

File: `/supabase/migrations/036_create_email_queue.sql`

Content: CREATE TABLE email_queue for queued emails

Acceptance: Table created

Test: Table exists

---

**Step 80CF: Create Email Queue Service**

File: `/lib/email/email-queue.ts`

Content: Service to queue emails for sending

Acceptance: Queue works

Test: Emails queued

---

**Step 80CG: Create Email Queue Worker**

File: `/lib/queue/email-worker.ts`

Content: Background worker to process email queue

Acceptance: Worker works

Test: Emails sent

---

**Step 80CH: Create Email Delivery Tracking**

File: `/lib/email/delivery-tracking.ts`

Content: Track email delivery status

Acceptance: Tracking works

Test: Status tracked

---

**Step 80CI: Create Bounce/Complaint Handler**

File: `/app/api/webhooks/email/route.ts`

Content: Handle email bounces and complaints

Acceptance: Handler works

Test: Bounces handled

---

**Step 80CJ: Test Email Service**

Action: Test email sending, queuing, tracking

Acceptance: Email service works

Test: End-to-end test

---

### In-App Notifications (Steps 80CK-80CT)

**Step 80CK: Create Notifications Table Migration**

File: `/supabase/migrations/037_create_notifications.sql`

Content: CREATE TABLE notifications with user_id, type, message, read, created_at

Acceptance: Table created

Test: Table exists

---

**Step 80CL: Create Notifications API**

File: `/app/api/notifications/route.ts`

Content: GET/POST handlers for notifications

Acceptance: API works

Test: Can manage notifications

---

**Step 80CM: Create Notification Center Component**

File: `/components/notifications/NotificationCenter.tsx`

Content: Real-time notification center with bell icon

Acceptance: Component works

Test: Notifications display

---

**Step 80CN: Create Notification Preferences API**

File: `/app/api/notifications/preferences/route.ts`

Content: GET/PUT handlers for notification preferences

Acceptance: API works

Test: Can manage preferences

---

**Step 80CO: Create Notification Preferences UI**

File: `/app/settings/notifications/page.tsx`

Content: UI to configure notification preferences

Acceptance: UI works

Test: Can configure preferences

---

**Step 80CP: Add Real-Time Notifications**

File: `/lib/notifications/realtime.ts`

Content: Real-time notification updates using Supabase Realtime

Acceptance: Real-time works

Test: Notifications update in real-time

---

**Step 80CQ: Create Notification History**

File: `/app/notifications/history/page.tsx`

Content: Page to view notification history

Acceptance: Page works

Test: Can view history

---

**Step 80CR: Add Mark as Read/Unread**

File: `/app/api/notifications/[id]/read/route.ts`

Content: POST handler to mark notification as read/unread

Acceptance: API works

Test: Can mark as read

---

**Step 80CS: Test In-App Notifications**

Action: Test notification system

Acceptance: Notifications work

Test: End-to-end test

---

### Analytics & Logs (Steps 80CB-80CK)

**Step 80CB: Create System Metrics API**

File: `/app/api/admin/analytics/metrics/route.ts`

Content: GET handler returning system metrics (users, transactions, documents, etc.)

Acceptance: API works

Test: Can get metrics

---

**Step 80CC: Create System Metrics Dashboard**

File: `/app/admin/analytics/metrics/page.tsx`

Content: Dashboard showing system metrics with charts

Acceptance: Dashboard works

Test: Can see metrics

---

**Step 80CD: Create Token Usage Stats API**

File: `/app/api/admin/analytics/token-usage/route.ts`

Content: GET handler returning token usage statistics

Acceptance: API works

Test: Can get stats

---

**Step 80CE: Create Token Usage Stats UI**

File: `/app/admin/analytics/token-usage/page.tsx`

Content: Charts and tables showing token usage stats

Acceptance: UI works

Test: Can see stats

---

**Step 80CF: Create Pipeline Performance API**

File: `/app/api/admin/analytics/pipeline/route.ts`

Content: GET handler returning pipeline performance metrics (OCR success rate, processing time, etc.)

Acceptance: API works

Test: Can get performance data

---

**Step 80CG: Create Pipeline Performance UI**

File: `/app/admin/analytics/pipeline/page.tsx`

Content: Dashboard showing pipeline performance metrics

Acceptance: UI works

Test: Can see performance

---

**Step 80CH: Create Audit Logs API**

File: `/app/api/admin/logs/audit/route.ts`

Content: GET handler returning audit logs with filters

Acceptance: API works

Test: Can get logs

---

**Step 80CI: Create Audit Logs UI**

File: `/app/admin/logs/audit/page.tsx`

Content: Table showing audit logs with search and filters

Acceptance: UI works

Test: Can view logs

---

**Step 80CJ: Add Log Export**

File: `/app/api/admin/logs/export/route.ts`

Content: Export audit logs as CSV/JSON

Acceptance: Export works

Test: Can export logs

---

**Step 80CK: Test Analytics & Logs**

Action: Test all analytics and logging features

Acceptance: All features work

Test: End-to-end test

---

### Admin Dashboard Integration & Testing (Steps 80CL-80CZ)

**Step 80CL: Create Admin Navigation Component**

File: `/components/admin/AdminNav.tsx`

Content: Navigation sidebar for admin dashboard

Acceptance: Navigation works

Test: Can navigate

---

**Step 80CM: Add Admin Search**

File: `/components/admin/AdminSearch.tsx`

Content: Global search across admin dashboard

Acceptance: Search works

Test: Can search

---

**Step 80CN: Add Admin Activity Feed**

File: `/app/admin/activity/page.tsx`

Content: Activity feed showing recent admin actions

Acceptance: Feed displays

Test: Can see activity

---

**Step 80CO: Add Admin Settings Export/Import**

File: `/app/api/admin/settings/export-import/route.ts`

Content: Export/import all admin settings as backup

Acceptance: Export/import works

Test: Can backup settings

---

**Step 80CP: Add Admin Dashboard Permissions**

File: `/lib/admin/permissions.ts`

Content: Fine-grained permissions for different admin sections

Acceptance: Permissions work

Test: Permissions enforced

---

**Step 80CQ: Add Admin Audit Logging**

File: `/lib/admin/audit-logger.ts`

Content: Log all admin actions to audit log

Acceptance: Logging works

Test: Actions logged

---

**Step 80CR: Optimize Admin Dashboard Performance**

File: Admin components

Content: Optimize queries, caching, pagination for admin dashboard

Acceptance: Dashboard fast

Test: Performance test

---

**Step 80CS: Add Admin Dashboard Help/Guide**

File: `/app/admin/help/page.tsx`

Content: Help documentation for admin dashboard

Acceptance: Help accessible

Test: Can access help

---

**Step 80CT: Test Complete Admin Dashboard**

Action: Test entire admin dashboard end-to-end

Acceptance: All features work together

Test: Comprehensive end-to-end test

---

**Step 80CU: Add Admin Dashboard Mobile Responsiveness**

File: Admin components

Content: Make admin dashboard responsive for mobile/tablet

Acceptance: Dashboard responsive

Test: Works on mobile

---

**Step 80CV: Add Admin Dashboard Dark Mode**

File: Admin components

Content: Dark mode support for admin dashboard

Acceptance: Dark mode works

Test: Can toggle dark mode

---

**Step 80CW: Create Admin Dashboard Documentation**

File: `/docs/admin-dashboard.md`

Content: Complete documentation for admin dashboard

Acceptance: Documentation complete

Test: Documentation reviewed

---

**Step 80CX: Add Admin Dashboard Unit Tests**

File: Admin test files

Content: Unit tests for admin components and APIs

Acceptance: Tests pass

Test: Run test suite

---

**Step 80CY: Add Admin Dashboard Integration Tests**

File: Admin integration tests

Content: Integration tests for admin workflows

Acceptance: Tests pass

Test: Run integration tests

---

**Step 80CZ: Final Admin Dashboard Review**

Action: Review complete admin dashboard, ensure all requirements met

Acceptance: All requirements satisfied

Test: Final review checklist

---

### Multi-User Access & Permissions (RBAC) (Steps 90A-90Z)

**Step 90A: Create Roles Table Migration**

File: `/supabase/migrations/023_create_roles.sql`

Content: CREATE TABLE roles (owner, accountant, auditor, employee, etc.)

Acceptance: Table created

Test: Table exists

---

**Step 90B: Create User Roles Table Migration**

File: `/supabase/migrations/024_create_user_roles.sql`

Content: CREATE TABLE user_roles linking users to businesses with roles

Acceptance: Table created

Test: Table exists

---

**Step 90C: Create Permissions Table Migration**

File: `/supabase/migrations/025_create_permissions.sql`

Content: CREATE TABLE permissions for different actions (view, create, edit, delete, etc.)

Acceptance: Table created

Test: Table exists

---

**Step 90D: Create Role Permissions Table Migration**

File: `/supabase/migrations/026_create_role_permissions.sql`

Content: CREATE TABLE role_permissions linking roles to permissions

Acceptance: Table created

Test: Table exists

---

**Step 90E: Seed Default Roles and Permissions**

File: `/supabase/seed_roles_permissions.sql`

Content: Insert default roles (Owner, Accountant, Auditor, Employee) with their permissions

Acceptance: Roles and permissions seeded

Test: Defaults exist

---

**Step 90F: Create Permission Check Function**

File: `/lib/auth/permissions.ts`

Content: Function to check if user has permission for action

Acceptance: Permission check works

Test: Unit test

---

**Step 90G: Create Role Check Function**

File: `/lib/auth/roles.ts`

Content: Function to check user's role in business

Acceptance: Role check works

Test: Unit test

---

**Step 90H: Create Permission Middleware**

File: `/lib/middleware/permission-check.ts`

Content: Middleware to check permissions before API calls

Acceptance: Middleware works

Test: Blocks unauthorized access

---

**Step 90I: Create Owner View Components**

File: `/components/permissions/OwnerView.tsx`

Content: Components that show full access (all features)

Acceptance: Owner view works

Test: Can see all features

---

**Step 90J: Create Accountant View Components**

File: `/components/permissions/AccountantView.tsx`

Content: Components with accountant permissions (view all, edit transactions, create reports)

Acceptance: Accountant view works

Test: Can see accountant features

---

**Step 90K: Create Auditor View Components**

File: `/components/permissions/AuditorView.tsx`

Content: Components with auditor permissions (view only, no edits)

Acceptance: Auditor view works

Test: Can see auditor features

---

**Step 90L: Create Limited Employee View Components**

File: `/components/permissions/EmployeeView.tsx`

Content: Components with limited permissions (view own transactions, create expenses)

Acceptance: Employee view works

Test: Can see employee features

---

**Step 90M: Create User Management API**

File: `/app/api/businesses/[id]/users/route.ts`

Content: CRUD operations for business users and roles

Acceptance: API works

Test: Can manage users

---

**Step 90N: Create User Management UI**

File: `/app/settings/users/page.tsx`

Content: Page to manage users and assign roles

Acceptance: Page accessible

Test: Navigate to page

---

**Step 90O: Create Invite User Functionality**

File: `/app/api/businesses/[id]/invite/route.ts`

Content: POST handler to invite users to business

Acceptance: Invite works

Test: Can invite users

---

**Step 90P: Add Role-Based UI Rendering**

File: Components

Content: Show/hide features based on user role

Acceptance: UI adapts to role

Test: Features show/hide correctly

---

**Step 90Q: Add Permission Checks to All API Routes**

File: API routes

Content: Add permission checks to all sensitive operations

Acceptance: Permissions enforced

Test: Unauthorized access blocked

---

**Step 90R: Create Role-Based Dashboard**

File: `/app/dashboard/page.tsx`

Content: Dashboard that adapts based on user role

Acceptance: Dashboard adapts

Test: Different views for different roles

---

**Step 90S: Test Multi-User Permissions**

Action: Test all roles and permissions

Acceptance: All permissions work correctly

Test: End-to-end test

---

### GDPR Compliance & Account Management (Steps 90T-90AC)

**Step 90T: Create Account Deletion API**

File: `/app/api/account/delete/route.ts`

Content: POST handler to request account deletion

Acceptance: API works

Test: Can request deletion

---

**Step 90U: Create Account Deletion UI**

File: `/app/settings/account/delete/page.tsx`

Content: UI to request account deletion with confirmation

Acceptance: UI works

Test: Can request deletion

---

**Step 90V: Create Data Export for Deletion**

File: `/lib/gdpr/data-export.ts`

Content: Export all user data before deletion

Acceptance: Export works

Test: Data exported

---

**Step 90W: Create Data Anonymization Service**

File: `/lib/gdpr/anonymization.ts`

Content: Anonymize user data for GDPR compliance

Acceptance: Service works

Test: Data anonymized

---

**Step 90X: Create Right to be Forgotten API**

File: `/app/api/gdpr/forget/route.ts`

Content: POST handler to exercise right to be forgotten

Acceptance: API works

Test: Can exercise right

---

**Step 90Y: Create Data Retention Policies**

File: `/supabase/migrations/043_create_retention_policies.sql`

Content: CREATE TABLE retention_policies for configurable data retention

Acceptance: Table created

Test: Table exists

---

**Step 90Z: Create Retention Policy Enforcement**

File: `/lib/gdpr/retention-enforcement.ts`

Content: Automatically delete data based on retention policies

Acceptance: Enforcement works

Test: Data deleted per policy

---

**Step 90AA: Create Privacy Policy Page**

File: `/app/privacy/page.tsx`

Content: Privacy policy page

Acceptance: Page accessible

Test: Can view privacy policy

---

**Step 90AB: Create Cookie Consent**

File: `/components/CookieConsent.tsx`

Content: Cookie consent banner

Acceptance: Banner displays

Test: Can accept/reject cookies

---

**Step 90AC: Test GDPR Compliance**

Action: Test GDPR compliance features

Acceptance: GDPR compliant

Test: End-to-end test

---

### Multi-Currency Support (Steps 90AD-90AM)

**Step 90AD: Create Currencies Table Migration**

File: `/supabase/migrations/044_create_currencies.sql`

Content: CREATE TABLE currencies with code, name, symbol

Acceptance: Table created

Test: Table exists

---

**Step 90AE: Create Exchange Rates Table** 

File: `/supabase/migrations/045_create_exchange_rates.sql`

Content: CREATE TABLE exchange_rates with from_currency, to_currency, rate, date

Acceptance: Table created

Test: Table exists

---

**Step 90AF: Create Currency Service**

File: `/lib/currency/currency-service.ts`

Content: Service to manage currencies and exchange rates

Acceptance: Service works

Test: Can manage currencies

---

**Step 90AG: Create Exchange Rate API**

File: `/app/api/currency/exchange-rates/route.ts`

Content: GET/POST handlers for exchange rates

Acceptance: API works

Test: Can manage rates

---

**Step 90AH: Add Currency to Business Settings**

File: `/app/settings/business/currency/page.tsx`

Content: UI to set base currency for business

Acceptance: UI works

Test: Can set currency

---

**Step 90AI: Create Currency Conversion Service**

File: `/lib/currency/conversion.ts`

Content: Convert amounts between currencies

Acceptance: Service works

Test: Conversion works

---

**Step 90AJ: Add Currency to Transactions**

File: Update transactions table and UI

Content: Add currency field to transactions

Acceptance: Currency added

Test: Can use currencies

---

**Step 90AK: Create Multi-Currency Reports**

File: Update reports to support multi-currency

Content: Reports with currency conversion

Acceptance: Reports work

Test: Multi-currency reports display

---

**Step 90AL: Add Exchange Rate Provider Integration**   ### real time the exachange API keys from google or something 

File: `/lib/currency/exchange-rate-provider.ts`

Content: Integrate with exchange rate API (Fixer.io, etc.)

Acceptance: Integration works

Test: Rates fetched

---

**Step 90AM: Test Multi-Currency System**

Action: Test multi-currency features

Acceptance: Multi-currency works

Test: End-to-end test

---

### Tax Calculation & Compliance (Steps 90AN-90AW)

**Step 90AN: Create Tax Rates Table Migration**

File: `/supabase/migrations/046_create_tax_rates.sql`

Content: CREATE TABLE tax_rates with name, rate, type, applicable_to

Acceptance: Table created

Test: Table exists

---

**Step 90AO: Create Tax Calculation Service**

File: `/lib/tax/tax-calculator.ts`

Content: Calculate tax for transactions

Acceptance: Service works

Test: Tax calculated

---

**Step 90AP: Create Tax Configuration UI**

File: `/app/settings/tax/page.tsx`

Content: UI to configure tax rates

Acceptance: UI works

Test: Can configure taxes

---

**Step 90AQ: Add Tax to Transactions**

File: Update transactions to include tax

Content: Add tax fields to transactions

Acceptance: Tax added

Test: Tax on transactions

---

**Step 90AR: Create Tax Reports**

File: `/app/reports/tax/page.tsx`

Content: Tax reports and summaries

Acceptance: Reports work

Test: Can view tax reports

---

**Step 90AS: Create Tax Form Generation**

File: `/lib/tax/form-generator.ts`

Content: Generate tax forms (1099, etc.)

Acceptance: Generator works

Test: Forms generated

---

**Step 90AT: Create Tax Form UI**

File: `/app/tax/forms/page.tsx`

Content: UI to generate and download tax forms

Acceptance: UI works

Test: Can generate forms

---

**Step 90AU: Add Tax Compliance Tracking**

File: `/lib/tax/compliance.ts`

Content: Track tax compliance requirements

Acceptance: Tracking works

Test: Compliance tracked

---

**Step 90AV: Create Tax Year Configuration**

File: `/app/settings/tax/year/page.tsx`

Content: Configure tax year and periods

Acceptance: UI works

Test: Can configure tax year

---

**Step 90AW: Test Tax System**

Action: Test tax calculation and reporting

Acceptance: Tax system works

Test: End-to-end test

---

### Chart of Accounts (Steps 91-100)

**Step 91: Create Accounts List Page Route**

File: `/app/accounts/page.tsx`

Content: Basic page structure

Acceptance: Page accessible

Test: Navigate to page

---

**Step 92: Create Get Accounts API Route**

File: `/app/api/accounts/route.ts`

Content: GET handler that fetches accounts for business (NO tokens - reading is free)

Acceptance: API returns accounts

Test: Can fetch accounts

---

**Step 93: Create Accounts List Component**

File: `/components/accounts/AccountsList.tsx`

Content: Component that displays accounts in a table

Acceptance: List displays

Test: Accounts show in table

---

**Step 94: Connect Accounts List to API**

File: `/components/accounts/AccountsList.tsx`

Content: Fetch accounts on mount, display in table

Acceptance: Accounts load

Test: Table shows accounts

---

**Step 95: Create Add Account Form Component**

File: `/components/accounts/AddAccountForm.tsx`

Content: Form with account name, type, number fields

Acceptance: Form displays

Test: Form renders

---

**Step 96: Create Create Account API Route**

File: `/app/api/accounts/route.ts`

Content: POST handler that inserts account (NO tokens - free)

Acceptance: API creates account

Test: Can create account

---

**Step 97: Connect Add Account Form to API**

File: `/components/accounts/AddAccountForm.tsx`

Content: onSubmit handler

Acceptance: Form submits

Test: Submit creates account

---

**Step 98: Refresh Accounts List After Creation**

File: `/components/accounts/AccountsList.tsx`

Content: Refetch accounts after new account created

Acceptance: List updates

Test: New account appears

---

**Step 99: Add Account Type Validation**

File: `/components/accounts/AddAccountForm.tsx`

Content: Validate account type is valid

Acceptance: Validation works

Test: Invalid type shows error

---

**Step 100: Style Accounts Page**

File: `/app/accounts/page.tsx`, account components

Content: Add Tailwind styling

Acceptance: Page styled

Test: Visual inspection

---

### Categories (Steps 101-110)

**Step 101: Create Categories List Page Route**

File: `/app/categories/page.tsx`

Content: Basic page structure

Acceptance: Page accessible

Test: Navigate to page

---

**Step 102: Create Get Categories API Route**

File: `/app/api/categories/route.ts`

Content: GET handler (NO tokens - reading is free)

Acceptance: API returns categories

Test: Can fetch categories

---

**Step 103: Create Categories List Component**

File: `/components/categories/CategoriesList.tsx`

Content: Display categories in list/table

Acceptance: List displays

Test: Categories show

---

**Step 104: Connect Categories List to API**

File: `/components/categories/CategoriesList.tsx`

Content: Fetch and display categories

Acceptance: Categories load

Test: List shows categories

---

**Step 105: Create Add Category Form**

File: `/components/categories/AddCategoryForm.tsx`

Content: Form with category name, type fields

Acceptance: Form displays

Test: Form renders

---

**Step 106: Create Create Category API Route**

File: `/app/api/categories/route.ts`

Content: POST handler (NO tokens - free)

Acceptance: API creates category

Test: Can create category

---

**Step 107: Connect Add Category Form to API**

File: `/components/categories/AddCategoryForm.tsx`

Content: onSubmit handler

Acceptance: Form submits

Test: Submit creates category

---

**Step 108: Refresh Categories List After Creation**

File: `/components/categories/CategoriesList.tsx`

Content: Refetch after creation

Acceptance: List updates

Test: New category appears

---

**Step 109: Add Default Categories Seeder**

File: `/supabase/seed_categories.sql` or migration

Content: Insert default categories (Office Supplies, Travel, Meals, etc.)

Acceptance: Default categories exist

Test: Defaults appear in list

---

**Step 110: Style Categories Page**

File: `/app/categories/page.tsx`, category components

Content: Add Tailwind styling

Acceptance: Page styled

Test: Visual inspection

---

### Transactions - Basic CRUD WITH TOKEN CHECKS (Steps 111-140)

**Step 111: Create Transactions List Page Route**

File: `/app/transactions/page.tsx`

Content: Basic page structure

Acceptance: Page accessible

Test: Navigate to page

---

**Step 112: Create Get Transactions API Route**

File: `/app/api/transactions/route.ts`

Content: GET handler with basic filtering (NO tokens - reading is free)

Acceptance: API returns transactions

Test: Can fetch transactions

---

**Step 113: Create Transactions List Component**

File: `/components/transactions/TransactionsList.tsx`

Content: Table displaying transactions

Acceptance: List displays

Test: Transactions show

---

**Step 114: Connect Transactions List to API**

File: `/components/transactions/TransactionsList.tsx`

Content: Fetch and display transactions

Acceptance: Transactions load

Test: Table shows transactions

---

**Step 115: Create Transaction Form Component (Basic)**

File: `/components/transactions/TransactionForm.tsx`

Content: Form with date, amount, description, category fields

Acceptance: Form displays

Test: Form renders

---

**Step 116: Add Transaction Form State**

File: `/components/transactions/TransactionForm.tsx`

Content: useState for all fields

Acceptance: Form is controlled

Test: Can type in fields

---

**Step 117: Create Double-Entry Validation Function**

File: `/lib/accounting/validation.ts`

Content: Function that validates debits equal credits

Acceptance: Validation function works

Test: Unit test validation

---

**Step 118: Create Create Transaction API Route WITH TOKEN CHECK**

File: `/app/api/transactions/route.ts`

Content: POST handler that checks tokens (1 token), deducts, then creates transaction

Acceptance: API creates transaction, tokens deducted

Test: Can create transaction, tokens decrease

---

**Step 119: Connect Transaction Form to API**

File: `/components/transactions/TransactionForm.tsx`

Content: onSubmit handler

Acceptance: Form submits

Test: Submit creates transaction

---

**Step 120: Refresh Transactions List After Creation**

File: `/components/transactions/TransactionsList.tsx`

Content: Refetch after creation

Acceptance: List updates

Test: New transaction appears

---

### Globalization & i18n Setup (Steps 120A-120J)

**Step 120A: Install i18n Tooling**

File/Command: `npm install next-intl` and create `/messages/{locale}.json`

Content: Install next-intl, bootstrap translation files for all 10 languages (en, de, fr, es, ar, it, pt, tr, zh, hi)

Acceptance: Packages installed, `/messages/en.json` created

Test: `npm run dev` still works

---

**Step 120B: Configure Next.js i18n**

File: `next.config.js`

Content: Add `i18n` block with locales `[ 'en','de','fr','es','ar','it','pt','tr','zh','hi' ]` and default `'en'`

Acceptance: Next.js recognizes locales

Test: Visiting `/de` renders page without error

---

**Step 120C: Create i18n Provider**

File: `/lib/i18n/IntlProvider.tsx`

Content: Create provider wrapping App Router layout, loading messages based on locale

Acceptance: Provider renders children with translations

Test: `useTranslations()` returns strings

---

**Step 120D: Create Locale Middleware**

File: `/middleware.ts` (update)

Content: Detect locale from URL/cookie, set cookie, redirect if missing locale prefix

Acceptance: Locale persists between routes

Test: Switching locale updates cookie and keeps selection

---

**Step 120E: Build Language Switcher Component**

File: `/components/ui/LanguageSwitcher.tsx`

Content: Dropdown/button to change locale using router + cookies

Acceptance: Language switch updates UI strings

Test: Switching to `de` updates nav labels

---

**Step 120F: Seed Translation Files**

File: `/messages/*.json`

Content: Populate base strings for navigation, auth, dashboard in all 10 locales (can start with English + placeholders)

Acceptance: Files exist with keys

Test: Keys resolve in UI

---

**Step 120G: Update Shared Layout/UI to use i18n**

File: `/app/(dashboard)/layout.tsx`, nav/sidebar components

Content: Replace hardcoded strings with `useTranslations`

Acceptance: Layout strings translate

Test: Changing locale changes layout text

---

**Step 120H: Add Backend Locale Support**

File: `/lib/auth/profile.ts`, `/app/api/profile/route.ts`

Content: Store `preferred_locale` on user/business profile; ensure emails/notifications receive locale

Acceptance: Locale saved and retrieved

Test: Updating locale persists in DB

---

**Step 120I: Add Admin Language Controls**

File: `/app/admin/settings/i18n/page.tsx`

Content: Admin UI to enable/disable languages per business, set default locale

Acceptance: Admin can manage locales

Test: Changing default locale updates business settings

---

**Step 120J: Add i18n Testing**

File: `/tests/i18n/i18n.test.tsx`

Content: Snapshot tests per locale + RTL smoke test for Arabic

Acceptance: Tests cover translations/RTL

Test: `npm run test` passes

---

**Step 121: Add Transaction Validation**

File: `/components/transactions/TransactionForm.tsx`

Content: Validate required fields, amount > 0

Acceptance: Validation works

Test: Invalid form shows errors

---

**Step 122: Create Transaction Detail Page Route**

File: `/app/transactions/[id]/page.tsx`

Content: Basic page structure

Acceptance: Page accessible

Test: Navigate to detail page

---

**Step 123: Create Get Transaction API Route**

File: `/app/api/transactions/[id]/route.ts`

Content: GET handler for single transaction (NO tokens - reading is free)

Acceptance: API returns transaction

Test: Can fetch transaction

---

**Step 124: Create Transaction Detail Component**

File: `/components/transactions/TransactionDetail.tsx`

Content: Display transaction details

Acceptance: Details display

Test: Transaction details show

---

**Step 125: Connect Transaction Detail to API**

File: `/components/transactions/TransactionDetail.tsx`

Content: Fetch and display transaction

Acceptance: Details load

Test: Page shows transaction

---

**Step 126: Add Edit Transaction Functionality**

File: `/components/transactions/TransactionForm.tsx`

Content: Support editing existing transaction

Acceptance: Can edit transaction

Test: Edit form pre-fills

---

**Step 127: Create Update Transaction API Route**

File: `/app/api/transactions/[id]/route.ts`

Content: PUT handler (NO tokens - editing is free)

Acceptance: API updates transaction

Test: Can update transaction

---

**Step 128: Add Delete Transaction Functionality**

File: `/components/transactions/TransactionDetail.tsx`

Content: Delete button and handler

Acceptance: Can delete transaction

Test: Delete removes transaction

---

**Step 129: Create Delete Transaction API Route**

File: `/app/api/transactions/[id]/route.ts`

Content: DELETE handler (soft delete - mark as void) (NO tokens - deleting is free)

Acceptance: API deletes transaction

Test: Transaction marked as void

---

**Step 130: Style Transactions Pages**

File: `/app/transactions/page.tsx`, transaction components

Content: Add Tailwind styling

Acceptance: Pages styled

Test: Visual inspection

---

**Step 131: Update Transaction Form for Double-Entry**

File: `/components/transactions/TransactionForm.tsx`

Content: Add debit/credit line items interface

Acceptance: Form shows line items

Test: Can add multiple lines

---

**Step 132: Add Transaction Line Management**

File: `/components/transactions/TransactionForm.tsx`

Content: Add/remove line items, select accounts

Acceptance: Can manage lines

Test: Add/remove works

---

**Step 133: Update Validation for Double-Entry**

File: `/lib/accounting/validation.ts`

Content: Validate debits = credits, at least 2 lines

Acceptance: Validation works

Test: Invalid entries show errors

---

**Step 134: Update Create Transaction API for Double-Entry**

File: `/app/api/transactions/route.ts`

Content: Create transaction_lines along with transaction (still 1 token total)

Acceptance: Creates lines correctly

Test: Transaction has lines

---

**Step 135: Create Account Balance Calculation Function**

File: `/lib/accounting/balances.ts`

Content: Calculate account balance from transaction_lines

Acceptance: Balance calculates correctly

Test: Unit test calculation

---

**Step 136: Update Account Balance on Transaction Create**

File: `/app/api/transactions/route.ts`

Content: Update account balances after transaction creation

Acceptance: Balances update

Test: Account balance changes

---

**Step 137: Display Account Balances**

File: `/components/accounts/AccountsList.tsx`

Content: Show current balance for each account

Acceptance: Balances display

Test: Balances show correctly

---

**Step 138: Add Balance History Query**

File: `/lib/accounting/balances.ts`

Content: Function to get balance as of specific date

Acceptance: Historical balance works

Test: Can get past balance

---

**Step 139: Update Transaction Detail to Show Lines**

File: `/components/transactions/TransactionDetail.tsx`

Content: Display all transaction_lines

Acceptance: Lines display

Test: Detail page shows lines

---

**Step 140: Test Double-Entry System with Tokens**

Action: Create various transactions, verify balances, verify tokens deducted

Acceptance: System works correctly, tokens tracked

Test: End-to-end test

---

### Basic Categorization WITH TOKEN CHECKS (Steps 141-150)

**Step 141: Create Categorization Rules Table**

File: `/supabase/migrations/018_create_categorization_rules.sql`

Content: Table for storing categorization rules

Acceptance: Table created

Test: Table exists

---

**Step 142: Create Rule-Based Categorization Function**

File: `/lib/categorization/rules-engine.ts`

Content: Function that matches transaction to category using rules

Acceptance: Function works

Test: Unit test matching

---

**Step 143: Create Categorize Transaction API Route WITH TOKEN CHECK**

File: `/app/api/transactions/categorize/route.ts`

Content: POST handler that checks tokens (2 tokens), categorizes transaction

Acceptance: API categorizes, tokens deducted

Test: Can categorize transaction, tokens decrease

---

**Step 144: Auto-Categorize on Transaction Create WITH TOKEN CHECK**

File: `/app/api/transactions/route.ts`

Content: After creating transaction, auto-categorize (2 tokens) if user has tokens

Acceptance: Auto-categorizes, tokens deducted

Test: New transaction has category, tokens decrease

---

**Step 145: Create Categorization Rules Management API**

File: `/app/api/categorization-rules/route.ts`

Content: CRUD operations for rules (NO tokens - free)

Acceptance: Can manage rules

Test: Can create/read/update/delete rules

---

**Step 146: Create Rules Management UI**

File: `/app/settings/categorization-rules/page.tsx`

Content: Page to manage rules

Acceptance: Page accessible

Test: Navigate to page

---

**Step 147: Create Add Rule Form**

File: `/components/categorization/AddRuleForm.tsx`

Content: Form to create new rule

Acceptance: Form displays

Test: Can create rule

---

**Step 148: Create Rules List Component**

File: `/components/categorization/RulesList.tsx`

Content: Display all rules

Acceptance: Rules display

Test: Can see rules

---

**Step 149: Add Test Rule Functionality**

File: `/components/categorization/AddRuleForm.tsx`

Content: Test rule against sample transaction

Acceptance: Can test rules

Test: Test works

---

**Step 150: Test Categorization System with Tokens**

Action: Test various transactions, verify categorization, verify tokens deducted

Acceptance: System works, tokens tracked

Test: End-to-end test

---

## PHASE 4: DOCUMENT UPLOAD & OCR WITH TOKEN CHECKS (Steps 151-200)

### Document Upload & OCR (Steps 151-180)

**Step 151: Configure Supabase Storage**

Action: Create storage bucket in Supabase dashboard

Acceptance: Bucket created

Test: Bucket exists

---

**Step 152: Create Document Upload API Route WITH TOKEN CHECK**

File: `/app/api/documents/upload/route.ts`

Content: POST handler that checks tokens (5 tokens per file), deducts, then uploads to Supabase Storage

Acceptance: API accepts files, tokens deducted

Test: Can upload file, tokens decrease

---

**Step 153: Create File Upload Component**

File: `/components/documents/FileUpload.tsx`

Content: File input with drag-and-drop

Acceptance: Component displays

Test: Can select file

---

**Step 154: Connect File Upload to API**

File: `/components/documents/FileUpload.tsx`

Content: Upload file on selection

Acceptance: File uploads

Test: File appears in storage

---

**Step 155: Create Document Record After Upload**

File: `/app/api/documents/upload/route.ts`

Content: Insert record into documents table

Acceptance: Document record created

Test: Record exists in database

---

**Step 156: Install OCR Library**

Command: `npm install tesseract.js` or similar

Acceptance: Package installed

Test: Can import library

---

**Step 157: Create OCR Processing Function**

File: `/lib/ocr/processor.ts`

Content: Function that processes image with OCR

Acceptance: OCR function works

Test: Can extract text from image

---

**Step 158: Create OCR Worker/Queue Setup**

File: `/lib/queue/ocr-queue.ts`

Content: Set up job queue for OCR processing (or simple async)

Acceptance: Queue/processing setup

Test: Can queue OCR job

---

**Step 159: Process OCR After Upload WITH TOKEN CHECK**

File: `/app/api/documents/upload/route.ts` or worker

Content: Check tokens (10 tokens per page), deduct, then trigger OCR processing

Acceptance: OCR processes, tokens deducted

Test: OCR text extracted, tokens decrease

---

**Step 160: Store OCR Results in Database**

File: Update document record

Content: Save OCR text and status to documents table

Acceptance: Results stored

Test: Database has OCR data

---

**Step 161: Create Documents List Page**

File: `/app/documents/page.tsx`

Content: Page to list all documents

Acceptance: Page accessible

Test: Navigate to page

---

**Step 162: Create Get Documents API Route**

File: `/app/api/documents/route.ts`

Content: GET handler (NO tokens - reading is free)

Acceptance: API returns documents

Test: Can fetch documents

---

**Step 163: Create Documents List Component**

File: `/components/documents/DocumentsList.tsx`

Content: Display documents with status

Acceptance: List displays

Test: Documents show

---

**Step 164: Create Document Detail Page**

File: `/app/documents/[id]/page.tsx`

Content: Page to view document

Acceptance: Page accessible

Test: Navigate to detail

---

**Step 165: Display Document Image**

File: `/components/documents/DocumentViewer.tsx`

Content: Display uploaded document image

Acceptance: Image displays

Test: Can see document

---

**Step 166: Display OCR Results**

File: `/components/documents/DocumentViewer.tsx`

Content: Show extracted OCR text

Acceptance: Text displays

Test: Can see OCR text

---

**Step 167: Create Field Extraction Function**

File: `/lib/ocr/extractor.ts`

Content: Extract amount, date, vendor from OCR text

Acceptance: Fields extracted

Test: Unit test extraction

---

**Step 168: Display Extracted Fields**

File: `/components/documents/DocumentViewer.tsx`

Content: Show extracted fields in form

Acceptance: Fields display

Test: Can see extracted data

---

**Step 169: Allow Editing Extracted Fields**

File: `/components/documents/DocumentViewer.tsx`

Content: Make fields editable

Acceptance: Can edit fields

Test: Can modify extracted data

---

**Step 170: Create Transaction from Document**

File: `/app/api/documents/[id]/create-transaction/route.ts`

Content: Create transaction using extracted data (1 token for transaction)

Acceptance: Transaction created

Test: Can create transaction from document

---

**Step 171: Enhance File Upload for Multiple Types**

File: `/app/api/documents/upload/route.ts`

Content: Accept PDF, JPG, PNG, Excel, CSV, Word, ZIP (still 5 tokens each)

Acceptance: All types accepted

Test: Can upload all types

---

**Step 172: Add Bulk Upload Support**

File: `/components/documents/FileUpload.tsx`

Content: Allow multiple file selection (5 tokens per file)

Acceptance: Can select multiple files

Test: Multiple files upload

---

**Step 173: Create ZIP Extraction Function**

File: `/lib/documents/zip-extractor.ts`

Content: Extract files from ZIP, process each (5 tokens per extracted file)

Acceptance: ZIP extracts

Test: Files extracted

---

**Step 174: Add Multi-Page PDF Support**

File: `/lib/ocr/processor.ts`

Content: Process each page of PDF separately (10 tokens per page)

Acceptance: All pages processed

Test: Multi-page PDF works

---

**Step 175: Create Document Type Detector**

File: `/lib/documents/type-detector.ts`

Content: Detect file type and route to appropriate processor

Acceptance: Types detected

Test: Correct processor used

---

**Step 176: Add Excel Parser**

File: `/lib/documents/excel-parser.ts`

Content: Parse Excel files for transaction data (3 tokens for parsing)

Acceptance: Excel parsed

Test: Data extracted

---

**Step 177: Add CSV Parser for Documents**

File: `/lib/documents/csv-parser.ts`

Content: Parse CSV files (different from bank CSV) (3 tokens for parsing)

Acceptance: CSV parsed

Test: Data extracted

---

**Step 178: Add Word Document Parser**

File: `/lib/documents/word-parser.ts`

Content: Extract text from Word documents (3 tokens for parsing)

Acceptance: Word parsed

Test: Text extracted

---

**Step 179: Create Bulk Processing Queue**

File: `/lib/queue/bulk-processor.ts`

Content: Queue system for processing multiple files

Acceptance: Queue works

Test: Files processed in queue

---

**Step 180: Test Document Upload System with Tokens**

Action: Test all file types, verify tokens deducted correctly

Acceptance: All types work, tokens tracked

Test: End-to-end test

---

### Email Ingestion Pipeline (Steps 180A-180Z) - CRITICAL FOR 100% AUTOMATION

**Step 180A: Install Email Libraries**

Command: `npm install imap simple-imap-sync nodemailer`

Acceptance: Packages installed

Test: Can import libraries

---

**Step 180B: Create Email Connections Table Migration**

File: `/supabase/migrations/047_create_email_connections.sql`

Content: CREATE TABLE email_connections with business_id, email, imap_server, credentials (encrypted)

Acceptance: Table created

Test: Table exists

---

**Step 180C: Create Email Connection Service**

File: `/lib/email/connection.ts`

Content: Service to connect to IMAP/POP3 email accounts

Acceptance: Service works

Test: Can connect to email

---

**Step 180D: Create Email Monitoring Cron Job**

File: `/lib/queue/email-monitor.ts`

Content: Background job to fetch emails every 5-15 minutes

Acceptance: Job works

Test: Emails fetched

---

**Step 180E: Create Email Parser**

File: `/lib/email/parser.ts`

Content: Parse emails, extract attachments, categorize (bill, receipt, invoice, statement)

Acceptance: Parser works

Test: Emails parsed

---

**Step 180F: Create Email-to-Document Pipeline**

File: `/lib/email/document-pipeline.ts`

Content: Convert email attachments to documents, trigger OCR processing

Acceptance: Pipeline works

Test: Documents created from emails

---

**Step 180G: Create Email Ingestion API**

File: `/app/api/email/ingest/route.ts`

Content: POST handler to manually trigger email ingestion (NO tokens - ingestion free)

Acceptance: API works

Test: Can trigger ingestion

---

**Step 180H: Create Email Connection UI**

File: `/app/settings/email/connections/page.tsx`

Content: UI to configure email connections

Acceptance: UI works

Test: Can configure email

---

**Step 180I: Create Email Rules Table Migration**

File: `/supabase/migrations/048_create_email_rules.sql`

Content: CREATE TABLE email_rules for rule-based email routing

Acceptance: Table created

Test: Table exists

---

**Step 180J: Create Email Rules Engine**

File: `/lib/email/rules-engine.ts`

Content: Rule-based email routing and categorization

Acceptance: Engine works

Test: Rules applied

---

**Step 180K: Create Email Rules UI**

File: `/app/settings/email/rules/page.tsx`

Content: UI to manage email rules

Acceptance: UI works

Test: Can manage rules

---

**Step 180L: Auto-Create Transactions from Email Documents**

File: `/lib/email/transaction-creator.ts`

Content: Auto-create transactions from processed email documents

Acceptance: Transactions created

Test: Transactions auto-created

---

**Step 180M: Link Emails to Transactions**

File: Update transactions table

Content: Add email_id to transactions, link emails to transactions

Acceptance: Linking works

Test: Emails linked

---

**Step 180N: Create Email Status Dashboard**

File: `/app/settings/email/dashboard/page.tsx`

Content: Dashboard showing email ingestion status, recent emails processed

Acceptance: Dashboard works

Test: Can view status

---

**Step 180O: Test Email Ingestion System**

Action: Test complete email ingestion flow

Acceptance: Email ingestion works

Test: End-to-end test

---

### Autonomous Document Processing Pipeline Enhancement (Steps 180P-180Z) - CRITICAL FOR 100% AUTOMATION

**Step 180P: Create Automated Processing Chain**

File: `/lib/documents/processing-chain.ts`

Content: Fully automated processing chain (detect type → route → extract → validate → create transaction → categorize → match)

Acceptance: Chain works

Test: Processing automated

---

**Step 180Q: Create Document Type Router**

File: `/lib/documents/type-router.ts`

Content: Auto-route documents to appropriate processor (OCR/QR/Barcode)

Acceptance: Router works

Test: Documents routed correctly

---

**Step 180R: Create Field Extraction Pipeline**

File: `/lib/documents/field-extraction-pipeline.ts`

Content: Auto-extract all fields from documents

Acceptance: Pipeline works

Test: Fields extracted

---

**Step 180S: Create Validation Service**

File: `/lib/documents/validation-service.ts`

Content: Auto-validate extracted data

Acceptance: Service works

Test: Data validated

---

**Step 180T: Create Auto-Transaction Creator**

File: `/lib/documents/auto-transaction-creator.ts`

Content: Auto-create transactions from validated documents

Acceptance: Creator works

Test: Transactions created

---

**Step 180U: Create Auto-Categorization Integration**

File: `/lib/documents/auto-categorize.ts`

Content: Auto-categorize transactions created from documents

Acceptance: Integration works

Test: Transactions categorized

---

**Step 180V: Create Auto-Matching Service**

File: `/lib/documents/auto-matching.ts`

Content: Auto-match documents to existing transactions

Acceptance: Service works

Test: Documents matched

---

**Step 180W: Create Retry Logic with Exponential Backoff**

File: `/lib/documents/retry-logic.ts`

Content: Auto-retry failed processing with exponential backoff

Acceptance: Logic works

Test: Retries work

---

**Step 180X: Create Fallback Mechanisms**

File: `/lib/documents/fallback.ts`

Content: Auto-fallback to alternative processing methods

Acceptance: Mechanisms work

Test: Fallbacks work

---

**Step 180Y: Create Manual Review Queue**

File: `/lib/documents/manual-review-queue.ts`

Content: Queue for documents requiring manual review

Acceptance: Queue works

Test: Documents queued

---

**Step 180Z: Test Autonomous Document Processing**

Action: Test complete autonomous processing flow

Acceptance: Autonomous processing works

Test: End-to-end test

---

### QR Code Scanning WITH TOKEN CHECKS (Steps 181-200)

**Step 181: Install QR Code Library**

Command: `npm install qrcode-reader` or `jsqr`

Acceptance: Package installed

Test: Can import library

---

**Step 182: Create QR Code Detection Function**

File: `/lib/qr/detector.ts`

Content: Detect QR codes in images

Acceptance: QR detected

Test: Unit test detection

---

**Step 183: Create QR Code Parser**

File: `/lib/qr/parser.ts`

Content: Parse QR code data (merchant, items, totals, VAT, timestamp)

Acceptance: Data parsed

Test: Unit test parsing

---

**Step 184: Add Country-Specific QR Standards**

File: `/lib/qr/standards.ts`

Content: Support different country QR formats (EU, US, etc.)

Acceptance: Multiple formats supported

Test: Different formats work

---

**Step 185: Create QR Scan API Route WITH TOKEN CHECK**

File: `/app/api/documents/scan-qr/route.ts`

Content: POST handler that checks tokens (3 tokens), deducts, then scans QR from image

Acceptance: API works, tokens deducted

Test: Can scan QR, tokens decrease

---

**Step 186: Create QR Scanner Component**

File: `/components/qr/QRScanner.tsx`

Content: Component to scan QR codes from camera or image

Acceptance: Component displays

Test: Can scan QR

---

**Step 187: Integrate QR Scan into Document Upload**

File: `/app/api/documents/upload/route.ts`

Content: Auto-detect and scan QR codes in uploaded images (3 tokens if QR found)

Acceptance: QR auto-scanned, tokens deducted

Test: QR detected on upload, tokens decrease

---

**Step 188: Create QR Data Extraction UI**

File: `/components/qr/QRDataDisplay.tsx`

Content: Display extracted QR data in form

Acceptance: Data displays

Test: Can see QR data

---

**Step 189: Auto-Fill Transaction from QR**

File: `/app/api/documents/qr-to-transaction/route.ts`

Content: Create transaction from QR data (1 token transaction + 3 QR = 4 total)

Acceptance: Transaction created

Test: Can create from QR

---

**Step 190: Add QR Scan to Camera Capture**

File: Camera capture component

Content: Scan QR codes in real-time from camera (3 tokens per scan)

Acceptance: Real-time QR scan works

Test: Can scan from camera

---

**Step 191: Test QR Scanning System with Tokens**

Action: Test QR scanning, verify tokens deducted

Acceptance: System works, tokens tracked

Test: End-to-end test

---

**Step 192: Install Barcode Library**

Command: `npm install @zxing/library` or similar

Acceptance: Package installed

Test: Can import library

---

**Step 193: Create Barcode Detection Function**

File: `/lib/barcode/detector.ts`

Content: Detect 1D and 2D barcodes

Acceptance: Barcodes detected

Test: Unit test detection

---

**Step 194: Create Barcode Parser**

File: `/lib/barcode/parser.ts`

Content: Parse barcode data (transaction ID, vendor ID, SKU, batch ID)

Acceptance: Data parsed

Test: Unit test parsing

---

**Step 195: Support Multiple Barcode Formats**

File: `/lib/barcode/formats.ts`

Content: Support EAN, UPC, Code128, DataMatrix, etc.

Acceptance: Multiple formats supported

Test: Different formats work

---

**Step 196: Create Barcode Scan API Route WITH TOKEN CHECK**

File: `/app/api/documents/scan-barcode/route.ts`

Content: POST handler that checks tokens (2 tokens), deducts, then scans barcode from image

Acceptance: API works, tokens deducted

Test: Can scan barcode, tokens decrease

---

**Step 197: Create Barcode Scanner Component**

File: `/components/barcode/BarcodeScanner.tsx`

Content: Component to scan barcodes

Acceptance: Component displays

Test: Can scan barcode

---

**Step 198: Integrate Barcode Scan into Document Upload**

File: `/app/api/documents/upload/route.ts`

Content: Auto-detect and scan barcodes (2 tokens if barcode found)

Acceptance: Barcode auto-scanned, tokens deducted

Test: Barcode detected, tokens decrease

---

**Step 199: Create Barcode Data Display**

File: `/components/barcode/BarcodeDataDisplay.tsx`

Content: Display extracted barcode data

Acceptance: Data displays

Test: Can see barcode data

---

**Step 200: Test Barcode Scanning System with Tokens**

Action: Test barcode scanning, verify tokens deducted

Acceptance: System works, tokens tracked

Test: End-to-end test

---

## PHASE 5: CAMERA CAPTURE & MANUAL ENTRY (Steps 201-250)

### Camera Capture WITH TOKEN CHECKS (Steps 201-220)

**Step 201: Create Camera Capture Component**

File: `/components/camera/CameraCapture.tsx`

Content: Access device camera, capture photo

Acceptance: Camera access works

Test: Can capture photo

---

**Step 202: Add Image Auto-Enhancement**

File: `/lib/image/enhancer.ts`

Content: Auto-enhance image (brightness, contrast, sharpness) (2 tokens)

Acceptance: Enhancement works

Test: Images improved

---

**Step 203: Add Image Deskew Function**

File: `/lib/image/deskew.ts`

Content: Correct skewed/rotated images (included in enhancement)

Acceptance: Deskew works

Test: Images corrected

---

**Step 204: Add Auto-Crop Function**

File: `/lib/image/cropper.ts`

Content: Auto-crop edges, detect document boundaries (included in enhancement)

Acceptance: Cropping works

Test: Images cropped

---

**Step 205: Create Real-Time OCR Preview**

File: `/components/camera/OCRPreview.tsx`

Content: Show OCR text in real-time as camera moves (NO tokens - preview only)

Acceptance: Preview works

Test: Can see OCR preview

---

**Step 206: Add Camera Controls**

File: `/components/camera/CameraCapture.tsx`

Content: Flash, zoom, focus controls

Acceptance: Controls work

Test: Can control camera

---

**Step 207: Create Camera Capture Page**

File: `/app/documents/capture/page.tsx`

Content: Dedicated page for camera capture

Acceptance: Page accessible

Test: Navigate to page

---

**Step 208: Add Mobile-Optimized Camera UI**

File: `/components/camera/CameraCapture.tsx`

Content: Touch-friendly, responsive design

Acceptance: Mobile-friendly

Test: Works on mobile

---

**Step 209: Integrate Camera with OCR Pipeline WITH TOKEN CHECK**

File: `/app/api/documents/capture/route.ts`

Content: Process captured image through OCR (5 capture + 2 enhance + 10 OCR = 17 tokens)

Acceptance: Pipeline works, tokens deducted

Test: Image processed, tokens decrease

---

**Step 210: Add Camera Capture to Quick Actions**

File: Dashboard or navigation

Content: Quick access to camera capture

Acceptance: Quick access works

Test: Can access quickly

---

**Step 211: Test Camera Capture System with Tokens**

Action: Test camera capture, verify tokens deducted

Acceptance: System works, tokens tracked

Test: End-to-end test

---

### Manual Entry Enhancement (Steps 212-230)

**Step 212: Enhance Transaction Form with Auto-Complete**

File: `/components/transactions/TransactionForm.tsx`

Content: Auto-complete for vendors, categories (NO tokens - suggestions free)

Acceptance: Auto-complete works

Test: Suggestions appear

---

**Step 213: Create Vendor Database**

File: `/supabase/migrations/019_create_vendors.sql`

Content: CREATE TABLE vendors to store vendor information

Acceptance: Table created

Test: Can store vendors

---

**Step 214: Add Vendor Auto-Complete**

File: `/components/transactions/VendorAutocomplete.tsx`

Content: Auto-complete component for vendors

Acceptance: Component works

Test: Can select vendor

---

### Advanced Vendor/Entity Detection (Steps 214A-214J) - CRITICAL FOR 100% AUTOMATION

**Step 214A: Create Vendor ML Model**

File: `/lib/vendors/ml-model.ts`

Content: ML model for vendor recognition and matching

Acceptance: Model works

Test: Model trained

---

**Step 214B: Create Vendor Training Pipeline**

File: `/lib/vendors/training-pipeline.ts`

Content: Train ML model on vendor names, addresses, patterns

Acceptance: Pipeline works

Test: Model trained

---

**Step 214C: Create Vendor Matching Service**

File: `/lib/vendors/matching-service.ts`

Content: Fuzzy vendor matching using ML

Acceptance: Service works

Test: Vendors matched

---

**Step 214D: Create Vendor Normalization Service**

File: `/lib/vendors/normalization.ts`

Content: Normalize vendor names (handle variations)

Acceptance: Service works

Test: Vendors normalized

---

**Step 214E: Create New Vendor Detection**

File: `/lib/vendors/new-vendor-detector.ts`

Content: Detect new vendors and suggest creation

Acceptance: Detector works

Test: New vendors detected

---

**Step 214F: Create Entity Extraction Model**

File: `/lib/vendors/entity-extraction.ts`

Content: Extract vendor name, address, contact info from documents

Acceptance: Model works

Test: Entities extracted

---

**Step 214G: Create Vendor Creation Service**

File: `/lib/vendors/auto-create.ts`

Content: Auto-create vendor records from extracted entities

Acceptance: Service works

Test: Vendors created

---

**Step 214H: Create Vendor Update Service**

File: `/lib/vendors/auto-update.ts`

Content: Auto-update vendor records with new information

Acceptance: Service works

Test: Vendors updated

---

**Step 214I: Create Vendor Detection Dashboard**

File: `/app/admin/vendors/detection/page.tsx`

Content: Dashboard showing vendor detection statistics

Acceptance: Dashboard works

Test: Can view statistics

---

**Step 214J: Test Advanced Vendor Detection**

Action: Test complete vendor detection flow

Acceptance: Vendor detection works

Test: End-to-end test

---

**Step 215: Add Category Auto-Complete**

File: `/components/transactions/CategoryAutocomplete.tsx`

Content: Auto-complete for categories

Acceptance: Component works

Test: Can select category

---

**Step 216: Create Smart Suggestions Engine**

File: `/lib/suggestions/engine.ts`

Content: Suggest vendors/categories based on history (NO tokens - suggestions free)

Acceptance: Suggestions work

Test: Relevant suggestions

---

**Step 217: Add Payment Method Field**

File: `/components/transactions/TransactionForm.tsx`

Content: Payment method selector (Cash, Card, Bank, etc.)

Acceptance: Field added

Test: Can select method

---

**Step 218: Add Recurring Transaction Detection**

File: `/lib/suggestions/recurring.ts`

Content: Detect and suggest recurring transactions (NO tokens - detection free)

Acceptance: Detection works

Test: Recurring detected

---

**Step 219: Create Quick Entry Mode**

File: `/app/transactions/quick/page.tsx`

Content: Simplified form for quick entry (1 token per transaction)

Acceptance: Page accessible

Test: Can quick enter

---

**Step 220: Add Transaction Templates**

File: `/supabase/migrations/020_create_transaction_templates.sql`

Content: CREATE TABLE transaction_templates to save and reuse templates (NO tokens - templates free)

Acceptance: Templates work

Test: Can use templates

---

**Step 221: Add Bulk Manual Entry**

File: `/components/transactions/BulkEntry.tsx`

Content: Enter multiple transactions at once (1 token per transaction)

Acceptance: Bulk entry works

Test: Can enter multiple

---

**Step 222: Test Manual Entry System**

Action: Test all manual entry features

Acceptance: All features work

Test: End-to-end test

---

### Retry Logic & Manual Fallback (Steps 223-230)

**Step 223: Add Retry Logic to OCR Processing**

File: `/lib/ocr/processor.ts`

Content: Retry OCR up to 3 times if it fails

Acceptance: Retry works

Test: Failed OCR retries

---

**Step 224: Add Retry Logic to QR Scanning**

File: `/lib/qr/detector.ts`

Content: Retry QR scan up to 3 times if it fails

Acceptance: Retry works

Test: Failed QR scan retries

---

**Step 225: Add Retry Logic to Barcode Scanning**

File: `/lib/barcode/detector.ts`

Content: Retry barcode scan up to 3 times if it fails

Acceptance: Retry works

Test: Failed barcode scan retries

---

**Step 226: Add Retry Logic to Camera Capture**

File: `/app/api/documents/capture/route.ts`

Content: Retry camera processing up to 3 times if it fails

Acceptance: Retry works

Test: Failed capture retries

---

**Step 227: Add Manual Entry Fallback for OCR**

File: `/components/documents/DocumentViewer.tsx`

Content: Show manual entry option if OCR fails after 3 retries

Acceptance: Fallback shows

Test: Manual entry appears after failures

---

**Step 228: Add Manual Entry Fallback for QR**

File: `/components/qr/QRScanner.tsx`

Content: Show manual entry option if QR scan fails after 3 retries

Acceptance: Fallback shows

Test: Manual entry appears after failures

---

**Step 229: Add Manual Entry Fallback for Barcode**

File: `/components/barcode/BarcodeScanner.tsx`

Content: Show manual entry option if barcode scan fails after 3 retries

Acceptance: Fallback shows

Test: Manual entry appears after failures

---

**Step 230: Test Retry Logic and Fallback**

Action: Test all retry logic and manual fallback flows

Acceptance: All retry and fallback work

Test: End-to-end test

---

## PHASE 6: FINANCIAL REPORTS (Steps 231-270)

**Reports are FREE to view (no tokens)**

### Profit & Loss Report (Steps 231-250)

**Step 231: Create P&L Calculation Function**

File: `/lib/reports/pl.ts`

Content: Calculate revenue and expenses for date range

Acceptance: Calculation works

Test: Unit test calculation

---

**Step 232: Create P&L API Route**

File: `/app/api/reports/pl/route.ts`

Content: GET handler that returns P&L data (NO tokens - reports free)

Acceptance: API returns data

Test: Can fetch P&L

---

**Step 233: Create P&L Report Page**

File: `/app/reports/pl/page.tsx`

Content: Page to display P&L

Acceptance: Page accessible

Test: Navigate to page

---

**Step 234: Create P&L Report Component**

File: `/components/reports/PLReport.tsx`

Content: Display P&L in table format

Acceptance: Report displays

Test: Can see P&L

---

**Step 235: Add Date Range Selector**

File: `/components/reports/PLReport.tsx`

Content: Date picker for report period

Acceptance: Can select dates

Test: Date selection works

---

**Step 236: Fetch P&L Data on Date Change**

File: `/components/reports/PLReport.tsx`

Content: Refetch when dates change

Acceptance: Data updates

Test: Report updates

---

**Step 237: Add Comparison Period**

File: `/components/reports/PLReport.tsx`

Content: Show previous period for comparison

Acceptance: Comparison shows

Test: Can see comparison

---

**Step 238: Style P&L Report**

File: `/components/reports/PLReport.tsx`

Content: Professional report styling

Acceptance: Report looks good

Test: Visual inspection

---

**Step 239: Add P&L Export to PDF**

File: `/lib/reports/pdf-generator.ts`

Content: Generate PDF from P&L data (NO tokens - exports free)

Acceptance: PDF generates

Test: Can download PDF

---

**Step 240: Add Export Button to P&L**

File: `/components/reports/PLReport.tsx`

Content: Button to export PDF

Acceptance: Export works

Test: Can export

---

### Balance Sheet & Cash Flow (Steps 241-260)

**Step 241: Create Balance Sheet Calculation Function**

File: `/lib/reports/balance-sheet.ts`

Content: Calculate assets, liabilities, equity

Acceptance: Calculation works

Test: Unit test

---

**Step 242: Create Balance Sheet API Route**

File: `/app/api/reports/balance-sheet/route.ts`

Content: GET handler (NO tokens - reports free)

Acceptance: API returns data

Test: Can fetch

---

**Step 243: Create Balance Sheet Page**

File: `/app/reports/balance-sheet/page.tsx`

Content: Page structure

Acceptance: Page accessible

Test: Navigate

---

**Step 244: Create Balance Sheet Component**

File: `/components/reports/BalanceSheet.tsx`

Content: Display balance sheet

Acceptance: Displays

Test: Can see report

---

**Step 245: Create Cash Flow Calculation Function**

File: `/lib/reports/cash-flow.ts`

Content: Calculate operating, investing, financing activities

Acceptance: Calculation works

Test: Unit test

---

**Step 246: Create Cash Flow API Route**

File: `/app/api/reports/cash-flow/route.ts`

Content: GET handler (NO tokens - reports free)

Acceptance: API returns data

Test: Can fetch

---

**Step 247: Create Cash Flow Page**

File: `/app/reports/cash-flow/page.tsx`

Content: Page structure

Acceptance: Page accessible

Test: Navigate

---

**Step 248: Create Cash Flow Component**

File: `/components/reports/CashFlow.tsx`

Content: Display cash flow statement

Acceptance: Displays

Test: Can see report

---

**Step 249: Add Charts to Reports**

File: Report components

Content: Add Chart.js or similar for visualizations

Acceptance: Charts display

Test: Can see charts

---

**Step 250: Add Excel Export**

File: `/lib/reports/excel-generator.ts`

Content: Generate Excel from report data (NO tokens - exports free)

Acceptance: Excel generates

Test: Can download Excel

---

### Bank Reconciliation WITH TOKEN CHECKS (Steps 251-270)

**Step 251: Create Bank Accounts Page**

File: `/app/settings/bank-accounts/page.tsx`

Content: Page to manage bank accounts

Acceptance: Page accessible

Test: Navigate

---

**Step 252: Create Get Bank Accounts API**

File: `/app/api/bank-accounts/route.ts`

Content: GET handler (NO tokens - reading free)

Acceptance: API returns accounts

Test: Can fetch

---

**Step 253: Create Bank Accounts List Component**

File: `/components/bank/BankAccountsList.tsx`

Content: Display bank accounts

Acceptance: List displays

Test: Accounts show

---

**Step 254: Create Add Bank Account Form**

File: `/components/bank/AddBankAccountForm.tsx`

Content: Form with bank name, account number fields

Acceptance: Form displays

Test: Form renders

---

**Step 255: Create Create Bank Account API**

File: `/app/api/bank-accounts/route.ts`

Content: POST handler (NO tokens - setup free)

Acceptance: API creates account

Test: Can create

---

**Step 256: Connect Form to API**

File: `/components/bank/AddBankAccountForm.tsx`

Content: onSubmit handler

Acceptance: Form submits

Test: Submit works

---

**Step 257: Add Bank Connection Status**

File: Bank account components

Content: Show connection status (Connected, Disconnected, etc.)

Acceptance: Status displays

Test: Can see status

---

**Step 257A: Install Bank Integration Library (Plaid)**

Command: `npm install plaid` or similar bank integration service

Acceptance: Package installed

Test: Can import library

---

**Step 257B: Set Up Plaid Environment Variables**

File: `/.env.local`

Content: Add Plaid API keys (PLAID_CLIENT_ID, PLAID_SECRET, PLAID_ENV)

Acceptance: Environment variables added

Test: Variables accessible

---

**Step 257C: Create Plaid Configuration**

File: `/lib/bank/plaid-config.ts`

Content: Configure Plaid client with API keys

Acceptance: Plaid configured

Test: Can create Plaid client

---

**Step 257D: Create Bank Link Token API**

File: `/app/api/bank-accounts/link-token/route.ts`

Content: POST handler that creates Plaid link token for bank connection

Acceptance: Link token created

Test: Can get link token

---

**Step 257E: Create Bank Connection UI Component**

File: `/components/bank/BankConnection.tsx`

Content: Component that uses Plaid Link to connect bank account

Acceptance: Component displays

Test: Can see connection UI

---

**Step 257F: Handle Bank Connection Success**

File: `/components/bank/BankConnection.tsx`

Content: Handle successful bank connection, store access token

Acceptance: Connection stored

Test: Bank connected successfully

---

**Step 257G: Create Exchange Public Token API**

File: `/app/api/bank-accounts/exchange-token/route.ts`

Content: POST handler that exchanges Plaid public token for access token

Acceptance: Token exchanged

Test: Access token stored

---

**Step 257H: Create Fetch Bank Transactions API**

File: `/app/api/bank-accounts/[id]/fetch-transactions/route.ts`

Content: POST handler that fetches transactions from bank using Plaid (5 tokens per fetch)

Acceptance: Transactions fetched

Test: Can fetch transactions from bank

---

**Step 257I: Create Auto-Sync Bank Transactions Job**

File: `/lib/queue/bank-sync.ts`

Content: Background job to automatically sync bank transactions daily

Acceptance: Auto-sync works

Test: Transactions sync automatically

---

**Step 257J: Add Bank Sync Settings**

File: `/app/settings/bank-sync/page.tsx`

Content: Page to configure auto-sync frequency and settings

Acceptance: Settings page accessible

Test: Can configure sync

---

**Step 257K: Create Manual Bank Sync Trigger**

File: `/app/api/bank-accounts/[id]/sync/route.ts`

Content: POST handler to manually trigger bank sync (5 tokens)

Acceptance: Manual sync works

Test: Can trigger sync manually

---

**Step 257L: Add Bank Sync Status Display**

File: `/components/bank/BankSyncStatus.tsx`

Content: Display last sync time, sync status, next sync time

Acceptance: Status displays

Test: Can see sync status

---

**Step 257M: Handle Bank Connection Errors**

File: `/components/bank/BankConnection.tsx`

Content: Handle and display bank connection errors

Acceptance: Errors handled

Test: Errors display correctly

---

**Step 257N: Add Disconnect Bank Account**

File: `/app/api/bank-accounts/[id]/disconnect/route.ts`

Content: POST handler to disconnect bank account

Acceptance: Disconnect works

Test: Can disconnect bank

---

**Step 257O: Test Bank Integration**

Action: Test complete bank connection and transaction fetching flow

Acceptance: Bank integration works

Test: End-to-end test

---

### Credit Card Auto-Import (Steps 257OA-257OJ) - CRITICAL FOR 100% AUTOMATION

**Step 257OA: Create Credit Card Connector**

File: `/lib/credit-cards/connector.ts`

Content: Connect to credit card accounts via Plaid or similar

Acceptance: Connector works

Test: Can connect to credit cards

---

**Step 257OB: Create Credit Card Transaction Fetcher**

File: `/lib/credit-cards/transaction-fetcher.ts`

Content: Auto-fetch credit card transactions

Acceptance: Fetcher works

Test: Transactions fetched

---

**Step 257OC: Create Credit Card Statement Importer**

File: `/lib/credit-cards/statement-importer.ts`

Content: Auto-import credit card statements

Acceptance: Importer works

Test: Statements imported

---

**Step 257OD: Create Credit Card Accounts Table**

File: `/supabase/migrations/060_create_credit_card_accounts.sql`

Content: CREATE TABLE credit_card_accounts

Acceptance: Table created

Test: Table exists

---

**Step 257OE: Create Credit Card Management UI**

File: `/app/settings/credit-cards/page.tsx`

Content: UI to manage credit card accounts

Acceptance: UI works

Test: Can manage credit cards

---

**Step 257OF: Create Credit Card Sync Job**

File: `/lib/queue/credit-card-sync.ts`

Content: Scheduled job to sync credit card transactions

Acceptance: Job works

Test: Transactions synced

---

**Step 257OG: Integrate Credit Cards with Transactions**

File: Update transactions to support credit card source

Content: Link credit card transactions to main transaction system

Acceptance: Integration works

Test: Transactions linked

---

**Step 257OH: Create Credit Card Reconciliation**

File: `/lib/credit-cards/reconciliation.ts`

Content: Reconcile credit card transactions

Acceptance: Reconciliation works

Test: Transactions reconciled

---

**Step 257OI: Create Credit Card Dashboard**

File: `/app/credit-cards/dashboard/page.tsx`

Content: Dashboard showing credit card activity

Acceptance: Dashboard works

Test: Can view activity

---

**Step 257OJ: Test Credit Card Auto-Import**

Action: Test complete credit card import flow

Acceptance: Credit card import works

Test: End-to-end test

---

### PayPal/Stripe/Square Integration (Steps 257OK-257OT) - CRITICAL FOR 100% AUTOMATION

**Step 257OK: Install Payment Processor SDKs**

Command: `npm install paypal-rest-sdk stripe squareup`

Acceptance: Packages installed

Test: Can import libraries

---

**Step 257OL: Create PayPal Connector**

File: `/lib/payment-processors/paypal-connector.ts`

Content: Connect to PayPal and fetch transactions

Acceptance: Connector works

Test: Can connect to PayPal

---

**Step 257OM: Create Stripe Connector**

File: `/lib/payment-processors/stripe-connector.ts`

Content: Connect to Stripe and fetch transactions

Acceptance: Connector works

Test: Can connect to Stripe

---

**Step 257ON: Create Square Connector**

File: `/lib/payment-processors/square-connector.ts`

Content: Connect to Square and fetch transactions

Acceptance: Connector works

Test: Can connect to Square

---

**Step 257OO: Create Payment Processor Accounts Table**

File: `/supabase/migrations/061_create_payment_processor_accounts.sql`

Content: CREATE TABLE payment_processor_accounts

Acceptance: Table created

Test: Table exists

---

**Step 257OP: Create Transaction Fetcher Service**

File: `/lib/payment-processors/transaction-fetcher.ts`

Content: Unified service to fetch transactions from all processors

Acceptance: Service works

Test: Transactions fetched

---

**Step 257OQ: Create Statement Importer**

File: `/lib/payment-processors/statement-importer.ts`

Content: Auto-import statements from payment processors

Acceptance: Importer works

Test: Statements imported

---

**Step 257OR: Create Payment Processor Management UI**

File: `/app/settings/payment-processors/page.tsx`

Content: UI to manage payment processor connections

Acceptance: UI works

Test: Can manage connections

---

**Step 257OS: Create Payment Processor Sync Jobs**

File: `/lib/queue/payment-processor-sync.ts`

Content: Scheduled jobs to sync all payment processors

Acceptance: Jobs work

Test: Processors synced

---

**Step 257OT: Test Payment Processor Integration**

Action: Test complete payment processor integration flow

Acceptance: Payment processor integration works

Test: End-to-end test

---

### ERP & Accounting Software Integration (Steps 257P-257Z)

**Step 257P: Install QuickBooks Integration Library**

Command: `npm install intuit-oauth` or QuickBooks API SDK

Acceptance: Package installed

Test: Can import library

---

**Step 257Q: Set Up QuickBooks API Configuration**

File: `/.env.local`

Content: Add QuickBooks API credentials (QB_CLIENT_ID, QB_CLIENT_SECRET, QB_ENVIRONMENT)

Acceptance: Environment variables added

Test: Variables accessible

---

**Step 257R: Create QuickBooks OAuth Flow**

File: `/app/api/integrations/quickbooks/oauth/route.ts`

Content: OAuth flow to connect QuickBooks account

Acceptance: OAuth works

Test: Can connect QuickBooks

---

**Step 257S: Create QuickBooks Sync Service**

File: `/lib/integrations/quickbooks/sync.ts`

Content: Service to sync transactions, customers, vendors from QuickBooks

Acceptance: Sync service works

Test: Can sync data

---

**Step 257T: Create QuickBooks Sync API**

File: `/app/api/integrations/quickbooks/sync/route.ts`

Content: POST handler to sync QuickBooks data (10 tokens per sync)

Acceptance: Sync API works

Test: Can trigger sync

---

**Step 257U: Install Xero Integration Library**

Command: `npm install xero-node` or Xero API SDK

Acceptance: Package installed

Test: Can import library

---

**Step 257V: Set Up Xero API Configuration**

File: `/.env.local`

Content: Add Xero API credentials (XERO_CLIENT_ID, XERO_CLIENT_SECRET)

Acceptance: Environment variables added

Test: Variables accessible

---

**Step 257W: Create Xero OAuth Flow**

File: `/app/api/integrations/xero/oauth/route.ts`

Content: OAuth flow to connect Xero account

Acceptance: OAuth works

Test: Can connect Xero

---

**Step 257X: Create Xero Sync Service**

File: `/lib/integrations/xero/sync.ts`

Content: Service to sync transactions, contacts, invoices from Xero

Acceptance: Sync service works

Test: Can sync data

---

**Step 257Y: Create Integration Management UI**

File: `/app/settings/integrations/page.tsx`

Content: Page to manage all integrations (QuickBooks, Xero, etc.)

Acceptance: Page accessible

Test: Can see integrations

---

**Step 257Z: Add Integration Recommendations**

File: `/components/integrations/IntegrationRecommendations.tsx`

Content: Show recommendations for small/medium companies (suggest QuickBooks, Xero, etc.)

Acceptance: Recommendations display

Test: Can see recommendations

---

**Step 257AA: Create Integration Status Component**

File: `/components/integrations/IntegrationStatus.tsx`

Content: Display connection status for each integration

Acceptance: Status displays

Test: Can see integration status

---

**Step 257AB: Add Auto-Sync for Integrations**

File: `/lib/queue/integration-sync.ts`

Content: Background job to auto-sync integrations daily

Acceptance: Auto-sync works

Test: Integrations sync automatically

---

**Step 257AC: Test ERP Integrations**

Action: Test QuickBooks and Xero integration flows

Acceptance: Integrations work

Test: End-to-end test

---

### Supplier Invoice Portal Scraping (Steps 257AD-257AZ) - CRITICAL FOR 100% AUTOMATION

**Step 257AD: Install Web Scraping Libraries**

Command: `npm install puppeteer playwright cheerio`

Acceptance: Packages installed

Test: Can import libraries

---

**Step 257AE: Create Supplier Portals Table Migration**

File: `/supabase/migrations/052_create_supplier_portals.sql`

Content: CREATE TABLE supplier_portals with business_id, supplier_id, portal_url, credentials (encrypted), scraping_config

Acceptance: Table created

Test: Table exists

---

**Step 257AF: Create Portal Connector Service**

File: `/lib/suppliers/portal-connector.ts`

Content: Service to connect to supplier portals (web scraping or API)

Acceptance: Service works

Test: Can connect to portals

---

**Step 257AG: Create Web Scraping Service**

File: `/lib/suppliers/scraper.ts`

Content: Web scraping service using Puppeteer/Playwright

Acceptance: Service works

Test: Can scrape portals

---

**Step 257AH: Create Credential Management Service**

File: `/lib/suppliers/credential-manager.ts`

Content: Secure storage and retrieval of portal credentials

Acceptance: Service works

Test: Credentials managed securely

---

**Step 257AI: Create Portal Monitoring Cron Job**

File: `/lib/queue/portal-monitor.ts`

Content: Background job to monitor supplier portals for new invoices (daily/weekly)

Acceptance: Job works

Test: Portals monitored

---

**Step 257AJ: Create Invoice Fetcher Service**

File: `/lib/suppliers/invoice-fetcher.ts`

Content: Auto-fetch invoices from supplier portals

Acceptance: Service works

Test: Invoices fetched

---

**Step 257AK: Create New Invoice Detection**

File: `/lib/suppliers/invoice-detector.ts`

Content: Detect new invoices on supplier portals

Acceptance: Detection works

Test: New invoices detected

---

**Step 257AL: Create Invoice Download Service**

File: `/lib/suppliers/invoice-downloader.ts`

Content: Auto-download invoices from portals

Acceptance: Service works

Test: Invoices downloaded

---

**Step 257AM: Integrate with Document Processing Pipeline**

File: `/lib/suppliers/document-integration.ts`

Content: Auto-process downloaded invoices through OCR pipeline

Acceptance: Integration works

Test: Invoices processed

---

**Step 257AN: Auto-Create Transactions from Fetched Invoices**

File: `/lib/suppliers/transaction-creator.ts`

Content: Auto-create transactions from fetched invoices

Acceptance: Service works

Test: Transactions created

---

**Step 257AO: Create Portal Configuration UI**

File: `/app/settings/suppliers/portals/page.tsx`

Content: UI to configure supplier portals

Acceptance: UI works

Test: Can configure portals

---

**Step 257AP: Create Credential Management UI**

File: `/app/settings/suppliers/portals/[id]/credentials/page.tsx`

Content: UI to manage portal credentials securely

Acceptance: UI works

Test: Can manage credentials

---

**Step 257AQ: Create Portal Status Monitoring**

File: `/app/settings/suppliers/portals/[id]/status/page.tsx`

Content: UI to monitor portal connection status and recent fetches

Acceptance: UI works

Test: Can view status

---

**Step 257AR: Create Portal Error Handling**

File: `/lib/suppliers/error-handler.ts`

Content: Handle portal connection errors, scraping failures, retry logic

Acceptance: Handler works

Test: Errors handled

---

**Step 257AS: Create Portal Logs**

File: `/supabase/migrations/053_create_portal_logs.sql`

Content: CREATE TABLE portal_logs for tracking portal activities

Acceptance: Table created

Test: Table exists

---

**Step 257AT: Create Portal Logs UI**

File: `/app/settings/suppliers/portals/[id]/logs/page.tsx`

Content: UI to view portal activity logs

Acceptance: UI works

Test: Can view logs

---

**Step 257AU: Test Supplier Portal Scraping**

Action: Test complete supplier portal scraping flow

Acceptance: Portal scraping works

Test: End-to-end test

---

**Step 258: Create CSV Import UI**

File: `/components/bank/CSVImport.tsx`

Content: File upload for bank statement CSV

Acceptance: Upload displays

Test: Can select file

---

**Step 259: Create CSV Parser Function**

File: `/lib/bank/csv-parser.ts`

Content: Parse bank statement CSV

Acceptance: Parses correctly

Test: Unit test parser

---

**Step 260: Create Import Bank Transactions API WITH TOKEN CHECK**

File: `/app/api/bank-accounts/[id]/import/route.ts`

Content: POST handler that checks tokens (3 tokens for parsing), deducts, then imports CSV

Acceptance: API imports, tokens deducted

Test: Can import, tokens decrease

---

**Step 261: Create Bank Transactions List API**

File: `/app/api/bank-transactions/route.ts`

Content: GET handler with filters (NO tokens - reading free)

Acceptance: API returns transactions

Test: Can fetch

---

**Step 262: Create Basic Matching Function**

File: `/lib/reconciliation/matcher.ts`

Content: Match by amount and date

Acceptance: Matching works

Test: Unit test

---

**Step 263: Create Match Suggestions API WITH TOKEN CHECK**

File: `/app/api/reconciliation/match/route.ts`

Content: POST handler that checks tokens (5 tokens per match), deducts, then finds matches

Acceptance: API returns matches, tokens deducted

Test: Can get matches, tokens decrease

---

**Step 264: Create Reconciliation Page**

File: `/app/reconciliation/page.tsx`

Content: Page for reconciliation

Acceptance: Page accessible

Test: Navigate

---

**Step 265: Create Bank Transactions List Component**

File: `/components/reconciliation/BankTransactionsList.tsx`

Content: Display bank transactions

Acceptance: List displays

Test: Transactions show

---

**Step 266: Show Match Suggestions**

File: `/components/reconciliation/BankTransactionsList.tsx`

Content: Display suggested matches (5 tokens per suggestion check)

Acceptance: Suggestions show

Test: Can see matches

---

**Step 267: Create Manual Match Interface**

File: `/components/reconciliation/MatchDialog.tsx`

Content: Dialog to manually match transactions (5 tokens per manual match)

Acceptance: Dialog displays

Test: Can open dialog

---

**Step 268: Create Apply Match API WITH TOKEN CHECK**

File: `/app/api/reconciliation/[id]/match/route.ts`

Content: POST handler that checks tokens (5 tokens), deducts, then applies match

Acceptance: API matches, tokens deducted

Test: Can match, tokens decrease

---

**Step 269: Update Match Status**

File: `/components/reconciliation/BankTransactionsList.tsx`

Content: Update UI after match

Acceptance: UI updates

Test: Status changes

---

**Step 270: Mark as Reconciled**

File: `/app/api/reconciliation/[id]/reconcile/route.ts`

Content: Mark transaction as reconciled (NO tokens - marking free)

Acceptance: Status updates

Test: Can reconcile

---

### Automated Bank Reconciliation Enhancement (Steps 270A-270J) - CRITICAL FOR 100% AUTOMATION

**Step 270A: Create Automated Reconciliation Service**

File: `/lib/reconciliation/automated-reconciliation.ts`

Content: Fully automated daily reconciliation service

Acceptance: Service works

Test: Reconciliation automated

---

**Step 270B: Create Daily Reconciliation Job**

File: `/lib/queue/daily-reconciliation.ts`

Content: Scheduled job to auto-reconcile daily

Acceptance: Job works

Test: Daily reconciliation runs

---

**Step 270C: Create Auto-Matching System**

File: `/lib/reconciliation/auto-matching.ts`

Content: Auto-match all transactions using ML

Acceptance: System works

Test: Transactions auto-matched

---

**Step 270D: Create Unmatched Item Flagging**

File: `/lib/reconciliation/unmatched-flagging.ts`

Content: Auto-flag unmatched items for review

Acceptance: Flagging works

Test: Items flagged

---

**Step 270E: Create Reconciliation Report Generator**

File: `/lib/reconciliation/report-generator.ts`

Content: Auto-generate reconciliation reports

Acceptance: Generator works

Test: Reports generated

---

**Step 270F: Create Exception Handler**

File: `/lib/reconciliation/exception-handler.ts`

Content: Handle reconciliation exceptions automatically

Acceptance: Handler works

Test: Exceptions handled

---

**Step 270G: Create Escalation System**

File: `/lib/reconciliation/escalation.ts`

Content: Escalate to manual review when needed

Acceptance: System works

Test: Escalation works

---

**Step 270H: Create Reconciliation Dashboard**

File: `/app/reconciliation/dashboard/page.tsx`

Content: Dashboard showing reconciliation status and statistics

Acceptance: Dashboard works

Test: Can view status

---

**Step 270I: Create Reconciliation Alerts**

File: `/lib/notifications/reconciliation-alerts.ts`

Content: Alert on reconciliation issues

Acceptance: Alerts work

Test: Alerts sent

---

**Step 270J: Test Automated Bank Reconciliation**

Action: Test complete automated reconciliation flow

Acceptance: Automated reconciliation works

Test: End-to-end test

---

### Receipt-to-Transaction Matching (Steps 270K-270T) - CRITICAL FOR 100% AUTOMATION

**Step 270A: Create Receipt Matching Service**

File: `/lib/reconciliation/receipt-matcher.ts`

Content: Match receipts to bank/credit card transactions using fuzzy matching

Acceptance: Service works

Test: Receipts matched

---

**Step 270B: Create Receipt Matching Algorithm**

File: `/lib/reconciliation/receipt-matching-algorithm.ts`

Content: Fuzzy matching algorithm (amount, date, vendor) with confidence scoring

Acceptance: Algorithm works

Test: Matching accurate

---

**Step 270C: Create Receipt Matching ML Model**

File: `/lib/reconciliation/receipt-ml-model.ts`

Content: ML model for intelligent receipt matching

Acceptance: Model works

Test: ML matching works

---

**Step 270D: Create Auto-Matching API**

File: `/app/api/reconciliation/receipts/auto-match/route.ts`

Content: POST handler to auto-match receipts to transactions (5 tokens per match)

Acceptance: API works

Test: Auto-matching works

---

**Step 270E: Create Duplicate Receipt Detection**

File: `/lib/reconciliation/duplicate-receipt-detector.ts`

Content: Detect duplicate receipts and prevent duplicate transactions

Acceptance: Detection works

Test: Duplicates detected

---

**Step 270F: Create Receipt Matching UI**

File: `/app/reconciliation/receipts/page.tsx`

Content: UI to view and manage receipt matching

Acceptance: UI works

Test: Can view matches

---

**Step 270G: Create Match Confidence Display**

File: `/components/reconciliation/ReceiptMatchConfidence.tsx`

Content: Display confidence scores for receipt matches

Acceptance: Display works

Test: Confidence shown

---

**Step 270H: Create Manual Match Override**

File: `/app/api/reconciliation/receipts/manual-match/route.ts`

Content: POST handler for manual receipt matching

Acceptance: API works

Test: Manual matching works

---

**Step 270I: Create Receipt Matching Dashboard**

File: `/app/reconciliation/receipts/dashboard/page.tsx`

Content: Dashboard showing receipt matching statistics

Acceptance: Dashboard works

Test: Can view statistics

---

**Step 270J: Test Automated Bank Reconciliation**

Action: Test complete automated reconciliation flow

Acceptance: Automated reconciliation works

Test: End-to-end test

---

**Step 270K: Create Receipt Matching Service**

File: `/lib/reconciliation/receipt-matcher.ts`

Content: Match receipts to bank/credit card transactions using fuzzy matching

Acceptance: Service works

Test: Receipts matched

---

**Step 270L: Create Receipt Matching Algorithm**

File: `/lib/reconciliation/receipt-matching-algorithm.ts`

Content: Fuzzy matching algorithm (amount, date, vendor) with confidence scoring

Acceptance: Algorithm works

Test: Matching accurate

---

**Step 270M: Create Receipt Matching ML Model**

File: `/lib/reconciliation/receipt-ml-model.ts`

Content: ML model for intelligent receipt matching

Acceptance: Model works

Test: ML matching works

---

**Step 270N: Create Auto-Matching API**

File: `/app/api/reconciliation/receipts/auto-match/route.ts`

Content: POST handler to auto-match receipts to transactions (5 tokens per match)

Acceptance: API works

Test: Auto-matching works

---

**Step 270O: Create Duplicate Receipt Detection**

File: `/lib/reconciliation/duplicate-receipt-detector.ts`

Content: Detect duplicate receipts and prevent duplicate transactions

Acceptance: Detection works

Test: Duplicates detected

---

**Step 270P: Create Receipt Matching UI**

File: `/app/reconciliation/receipts/page.tsx`

Content: UI to view and manage receipt matching

Acceptance: UI works

Test: Can view matches

---

**Step 270Q: Create Match Confidence Display**

File: `/components/reconciliation/ReceiptMatchConfidence.tsx`

Content: Display confidence scores for receipt matches

Acceptance: Display works

Test: Confidence shown

---

**Step 270R: Create Manual Match Override**

File: `/app/api/reconciliation/receipts/manual-match/route.ts`

Content: POST handler for manual receipt matching

Acceptance: API works

Test: Manual matching works

---

**Step 270S: Create Receipt Matching Dashboard**

File: `/app/reconciliation/receipts/dashboard/page.tsx`

Content: Dashboard showing receipt matching statistics

Acceptance: Dashboard works

Test: Can view statistics

---

**Step 270T: Test Receipt-to-Transaction Matching**

Action: Test complete receipt matching flow

Acceptance: Receipt matching works

Test: End-to-end test

---

**Step 271: Show Reconciliation Status**

File: Reconciliation components

Content: Show matched/unmatched counts

Acceptance: Status shows

Test: Can see status

---

### Data Export & Import (Steps 271A-271L)

**Step 271A: Create Data Export Service**

File: `/lib/export/export-service.ts`

Content: Service to export data (transactions, documents, reports) as CSV, Excel, JSON

Acceptance: Service works

Test: Can export data

---

**Step 271B: Create Export API**

File: `/app/api/export/route.ts`

Content: POST handler to export data with format selection

Acceptance: API works

Test: Can export via API

---

**Step 271C: Create Export UI**

File: `/app/settings/data/export/page.tsx`

Content: UI to select data types and export format

Acceptance: UI works

Test: Can export data

---

**Step 271D: Create Scheduled Export Job**

File: `/lib/queue/scheduled-export.ts`

Content: Background job for scheduled exports

Acceptance: Job works

Test: Exports scheduled

---

**Step 271E: Create Export Templates**

File: `/lib/export/templates.ts`

Content: Pre-defined export templates

Acceptance: Templates work

Test: Can use templates

---

**Step 271F: Create Data Import Service**

File: `/lib/import/import-service.ts`

Content: Service to import data from CSV, Excel, JSON

Acceptance: Service works

Test: Can import data

---

**Step 271G: Create Import Validation**

File: `/lib/import/validation.ts`

Content: Validate imported data before processing

Acceptance: Validation works

Test: Invalid data rejected

---

**Step 271H: Create Import Preview UI**

File: `/app/settings/data/import/preview/page.tsx`

Content: UI to preview imported data before confirming

Acceptance: UI works

Test: Can preview import

---

**Step 271I: Create Import Mapping Tool**

File: `/components/import/ImportMapper.tsx`

Content: UI to map imported columns to system fields

Acceptance: Tool works

Test: Can map fields

---

**Step 271J: Create Import History**

File: `/app/settings/data/import/history/page.tsx`

Content: View import history and rollback imports

Acceptance: History works

Test: Can view history

---

**Step 271K: Create Bulk Export for Compliance**

File: `/app/api/export/compliance/route.ts`

Content: Export all data for GDPR/compliance requests

Acceptance: API works

Test: Can export for compliance

---

**Step 271L: Test Data Export/Import**

Action: Test export and import flows

Acceptance: Export/import work

Test: End-to-end test

---

### Automated Month-End Close Pipeline (Steps 271M-271Z) - CRITICAL FOR 100% AUTOMATION

**Step 271M: Create Month-End Close Table Migration**

File: `/supabase/migrations/054_create_month_end_close.sql`

Content: CREATE TABLE month_end_close with period, status, closed_at, closed_by

Acceptance: Table created

Test: Table exists

---

**Step 271N: Create Month-End Close Workflow Service**

File: `/lib/accounting/month-end-close.ts`

Content: Auto-trigger month-end close workflow

Acceptance: Service works

Test: Workflow triggered

---

**Step 271O: Create Closing Entry Generator**

File: `/lib/accounting/closing-entries.ts`

Content: Auto-generate closing entries for month-end

Acceptance: Generator works

Test: Closing entries generated

---

**Step 271P: Create Closing Reports Generator**

File: `/lib/accounting/closing-reports.ts`

Content: Auto-run closing reports (P&L, Balance Sheet, etc.)

Acceptance: Generator works

Test: Reports generated

---

**Step 271Q: Create Balance Verification Service**

File: `/lib/accounting/balance-verification.ts`

Content: Auto-verify closing balances

Acceptance: Service works

Test: Balances verified

---

**Step 271R: Create Closing Checklist Generator**

File: `/lib/accounting/closing-checklist.ts`

Content: Auto-generate closing checklist and verify items

Acceptance: Generator works

Test: Checklist generated

---

**Step 271S: Create Month-End Close API**

File: `/app/api/accounting/month-end-close/route.ts`

Content: POST handler to trigger month-end close (NO tokens - free)

Acceptance: API works

Test: Month-end close triggered

---

**Step 271T: Create Month-End Close UI**

File: `/app/accounting/month-end-close/page.tsx`

Content: UI to view and manage month-end close process

Acceptance: UI works

Test: Can view close process

---

**Step 271U: Create Month-End Close Scheduler**

File: `/lib/queue/month-end-scheduler.ts`

Content: Auto-schedule month-end close (last day of month)

Acceptance: Scheduler works

Test: Close scheduled

---

**Step 271V: Create Closing Status Dashboard**

File: `/app/accounting/month-end-close/dashboard/page.tsx`

Content: Dashboard showing closing status and checklist

Acceptance: Dashboard works

Test: Can view status

---

**Step 271W: Create Year-End Close Service**

File: `/lib/accounting/year-end-close.ts`

Content: Auto-trigger year-end close workflow

Acceptance: Service works

Test: Year-end close works

---

**Step 271X: Create Audit Package Generator**

File: `/lib/accounting/audit-package.ts`

Content: Auto-generate audit package with all required documents

Acceptance: Generator works

Test: Audit package generated

---

**Step 271Y: Create Year-End Reports Generator**

File: `/lib/accounting/year-end-reports.ts`

Content: Auto-generate year-end reports

Acceptance: Generator works

Test: Reports generated

---

**Step 271Z: Test Month-End & Year-End Close**

Action: Test complete closing workflows

Acceptance: Closing workflows work

Test: End-to-end test

---

**Step 272: Filter Unmatched Transactions**

File: `/components/reconciliation/BankTransactionsList.tsx`

Content: Filter to show only unmatched

Acceptance: Filter works

Test: Can filter

---

**Step 273: Add Fuzzy String Matching**

File: `/lib/reconciliation/matcher.ts`

Content: Improve matching with string similarity (still 5 tokens)

Acceptance: Better matches

Test: More matches found

---

**Step 274: Add Amount Tolerance**

File: `/lib/reconciliation/matcher.ts`

Content: Match with small amount differences

Acceptance: Tolerant matching works

Test: Matches with tolerance

---

**Step 275: Add Date Window Matching**

File: `/lib/reconciliation/matcher.ts`

Content: Match within date range

Acceptance: Date window works

Test: Matches in range

---

**Step 276: Create Reconciliation Rules**

File: `/app/api/reconciliation-rules/route.ts`

Content: CRUD for reconciliation rules (NO tokens - free)

Acceptance: Can manage rules

Test: Rules work

---

**Step 277: Apply Reconciliation Rules**

File: `/lib/reconciliation/matcher.ts`

Content: Use rules in matching

Acceptance: Rules applied

Test: Rules improve matching

---

**Step 278: Show Match Confidence Scores**

File: Reconciliation components

Content: Display confidence for matches

Acceptance: Scores display

Test: Can see confidence

---

**Step 279: Auto-Match High Confidence**

File: `/app/api/reconciliation/auto-match/route.ts`

Content: Auto-match transactions above threshold (5 tokens per auto-match)

Acceptance: Auto-matches

Test: High confidence auto-matched

---

**Step 280: Test Reconciliation System with Tokens**

Action: Import bank statement, test matching, verify tokens deducted

Acceptance: System works, tokens tracked

Test: End-to-end test

---

## PHASE 7: ADVANCED AI FEATURES WITH TOKEN CHECKS (Steps 281-330)

**Step 281: Create ML Categorization Model**

File: `/lib/categorization/ml-model.ts`

Content: ML model for categorization (2 tokens per categorization)

Acceptance: Model works

Test: Unit test model

---

**Step 282: Integrate ML Categorization**

File: `/app/api/transactions/categorize/route.ts`

Content: Use ML model for categorization (2 tokens)

Acceptance: ML categorization works

Test: Can categorize with ML

---

### Advanced Auto-Categorization Enhancement (Steps 282A-282J) - CRITICAL FOR 100% AUTOMATION

**Step 282A: Install Deep Learning Libraries**

Command: `npm install @tensorflow/tfjs @huggingface/transformers`

Acceptance: Packages installed

Test: Can import libraries

---

**Step 282B: Create Deep Learning Categorization Model**

File: `/lib/categorization/deep-learning-model.ts`

Content: Transformer-based model (BERT/GPT) for context-aware categorization

Acceptance: Model works

Test: Model trained

---

**Step 282C: Create Training Pipeline**

File: `/lib/categorization/training-pipeline.ts`

Content: Train deep learning model on transaction data

Acceptance: Pipeline works

Test: Model trained

---

**Step 282D: Create Inference Service**

File: `/lib/categorization/inference-service.ts`

Content: Inference service for deep learning model

Acceptance: Service works

Test: Inference works

---

**Step 282E: Create Multi-Label Categorization**

File: `/lib/categorization/multi-label.ts`

Content: Support multiple categories per transaction

Acceptance: Multi-label works

Test: Multiple categories assigned

---

**Step 282F: Create Embedding Service**

File: `/lib/categorization/embeddings.ts`

Content: Generate embeddings for transactions

Acceptance: Service works

Test: Embeddings generated

---

**Step 282G: Create Similarity Matching Service**

File: `/lib/categorization/similarity-matching.ts`

Content: Find similar transactions using embeddings

Acceptance: Service works

Test: Similar transactions found

---

**Step 282H: Create Category Suggestion System**

File: `/lib/categorization/suggestion-system.ts`

Content: Suggest categories based on similarity

Acceptance: System works

Test: Suggestions appear

---

**Step 282I: Create Model Versioning System**

File: `/lib/categorization/model-versioning.ts`

Content: Version and manage multiple model versions

Acceptance: System works

Test: Versions managed

---

**Step 282J: Create A/B Testing for Models**

File: `/lib/categorization/ab-testing.ts`

Content: A/B test different model versions

Acceptance: Testing works

Test: A/B tests run

---

**Step 283: Install ML Forecasting Libraries**

Command: `npm install tensorflow @tensorflow/tfjs-node prophet-node` or similar

Acceptance: Packages installed

Test: Can import libraries

---

**Step 284: Create Cash Flow Forecast Function (Daily, Weekly, Monthly)**

File: `/lib/analytics/cashflow-forecast.ts`

Content: Function to forecast cash flow for daily, weekly, monthly periods using LSTM/GRU models (20 tokens per forecast)

Acceptance: Cash flow forecast works

Test: Unit test forecasting

---

**Step 285: Create Expense Forecast by Category Function**

File: `/lib/analytics/expense-forecast.ts`

Content: Forecast expenses by category using time series models (20 tokens per forecast)

Acceptance: Expense forecast works

Test: Unit test

---

**Step 286: Create Revenue Projection Function**

File: `/lib/analytics/revenue-projection.ts`

Content: Project revenue using Prophet or GBM models for trends & seasonality (20 tokens per forecast)

Acceptance: Revenue projection works

Test: Unit test

---

**Step 287: Create Seasonality Detection Function**

File: `/lib/analytics/seasonality.ts`

Content: Detect seasonal patterns in financial data using Prophet models

Acceptance: Seasonality detection works

Test: Unit test

---

**Step 288: Create Risk Flags Function (Cash Shortage Detection)**

File: `/lib/analytics/risk-flags.ts`

Content: Identify months with expected cash shortage based on forecasts (20 tokens per analysis)

Acceptance: Risk flags work

Test: Unit test

---

**Step 289: Create Supplier Cost Prediction Function**

File: `/lib/analytics/supplier-cost-prediction.ts`

Content: Predict supplier costs based on historical data using ensemble models (20 tokens per prediction)

Acceptance: Supplier prediction works

Test: Unit test

---

**Step 290: Create Ensemble Prediction Function**

File: `/lib/analytics/ensemble-forecast.ts`

Content: Combine LSTM, Prophet, and GBM models for improved accuracy

Acceptance: Ensemble works

Test: Unit test

---

**Step 291: Create Predictive Analytics API WITH TOKEN CHECK**

File: `/app/api/analytics/predictive/route.ts`

Content: GET handler that checks tokens (20 tokens), deducts, then returns forecasts (cashflow, expenses, revenue, risk flags)

Acceptance: API works, tokens deducted

Test: Can get forecasts, tokens decrease

---

**Step 292: Create Cash Flow Forecast UI**

File: `/app/analytics/cashflow-forecast/page.tsx`

Content: Page to display cash flow forecasts (daily, weekly, monthly views)

Acceptance: Page accessible

Test: Navigate to page

---

**Step 293: Create Expense Forecast UI**

File: `/app/analytics/expense-forecast/page.tsx`

Content: Page to display expense forecasts by category

Acceptance: Page accessible

Test: Navigate to page

---

**Step 294: Create Revenue Projection UI**

File: `/app/analytics/revenue-projection/page.tsx`

Content: Page to display revenue projections with seasonality

Acceptance: Page accessible

Test: Navigate to page

---

**Step 295: Create Risk Flags UI**

File: `/app/analytics/risk-flags/page.tsx`

Content: Page to display risk flags (cash shortage warnings)

Acceptance: Page accessible

Test: Navigate to page

---

**Step 296: Add Forecast Visualization Charts**

File: Forecast components

Content: Charts showing forecasts vs actuals, confidence intervals

Acceptance: Charts display

Test: Can see visualizations

---

**Step 297: Add Forecast Accuracy Metrics**

File: `/lib/analytics/forecast-accuracy.ts`

Content: Calculate and display forecast accuracy metrics

Acceptance: Metrics calculated

Test: Accuracy displayed

---

**Step 298: Test Predictive Analytics System**

Action: Test all forecasting features, verify tokens deducted

Acceptance: All forecasts work, tokens tracked

Test: End-to-end test

---

## PHASE 7B: AI RECOMMENDATIONS & INSIGHTS (Steps 299-330)

### Cost Optimization Insights (Steps 299-310)

**Step 299: Create Cost Optimization Analysis Function**

File: `/lib/insights/cost-optimization.ts`

Content: Analyze spending patterns, identify overspending, compare to historical data (15 tokens per analysis)

Acceptance: Analysis works

Test: Unit test

---

**Step 300: Create Overspending Detection**

File: `/lib/insights/overspending-detection.ts`

Content: Detect overspending by category/vendor compared to last month/average (15 tokens)

Acceptance: Detection works

Test: Unit test

---

**Step 301: Create Supplier Cost Comparison**

File: `/lib/insights/supplier-comparison.ts`

Content: Compare supplier costs to average, identify expensive suppliers (15 tokens)

Acceptance: Comparison works

Test: Unit test

---

**Step 302: Create Subscription Duplicate Detection**

File: `/lib/insights/duplicate-detection.ts`

Content: Detect duplicate subscriptions and cost increases (15 tokens)

Acceptance: Detection works

Test: Unit test

---

**Step 303: Create Cost Optimization Insights API**

File: `/app/api/insights/cost-optimization/route.ts`

Content: GET handler that checks tokens (15 tokens), returns cost optimization insights

Acceptance: API works, tokens deducted

Test: Can get insights, tokens decrease

---

**Step 304: Create Cost Optimization Insights UI**

File: `/app/insights/cost-optimization/page.tsx`

Content: Page to display cost optimization recommendations

Acceptance: Page accessible

Test: Navigate to page

---

**Step 305: Display Overspending Alerts**

File: `/components/insights/OverspendingAlerts.tsx`

Content: Display alerts for overspending categories

Acceptance: Alerts display

Test: Can see alerts

---

**Step 306: Display Supplier Recommendations**

File: `/components/insights/SupplierRecommendations.tsx`

Content: Display supplier cost comparisons and recommendations

Acceptance: Recommendations display

Test: Can see recommendations

---

### Waste Detection (Steps 307-315)

**Step 307: Create Duplicate Payment Detection**

File: `/lib/insights/duplicate-payments.ts`

Content: Detect duplicate payments (same amount, same vendor, close dates) (10 tokens)

Acceptance: Detection works

Test: Unit test

---

**Step 308: Create Unused Subscription Detection**

File: `/lib/insights/unused-subscriptions.ts`

Content: Detect unused subscriptions based on usage patterns (10 tokens)

Acceptance: Detection works

Test: Unit test

---

**Step 309: Create Rarely Used Items Detection**

File: `/lib/insights/rarely-used-items.ts`

Content: Detect items purchased but rarely used (10 tokens)

Acceptance: Detection works

Test: Unit test

---

**Step 310: Create Over-Budget Category Detection**

File: `/lib/insights/over-budget.ts`

Content: Detect categories exceeding budget (10 tokens)

Acceptance: Detection works

Test: Unit test

---

**Step 311: Create Waste Detection API**

File: `/app/api/insights/waste-detection/route.ts`

Content: GET handler that checks tokens (10 tokens), returns waste detection results

Acceptance: API works, tokens deducted

Test: Can get waste detection, tokens decrease

---

**Step 312: Create Waste Detection UI**

File: `/app/insights/waste-detection/page.tsx`

Content: Page to display waste detection results

Acceptance: Page accessible

Test: Navigate to page

---

**Step 313: Display Duplicate Payments**

File: `/components/insights/DuplicatePayments.tsx`

Content: Display detected duplicate payments

Acceptance: Duplicates display

Test: Can see duplicates

---

**Step 314: Display Unused Subscriptions**

File: `/components/insights/UnusedSubscriptions.tsx`

Content: Display unused subscriptions with cost savings potential

Acceptance: Subscriptions display

Test: Can see unused subscriptions

---

**Step 315: Test Waste Detection System**

Action: Test all waste detection features

Acceptance: All detection works

Test: End-to-end test

---

### ROI Insights (Steps 316-325)

**Step 316: Create ROI Analysis Function**

File: `/lib/insights/roi-analysis.ts`

Content: Analyze which expenses generate value vs drain money (20 tokens per analysis)

Acceptance: Analysis works

Test: Unit test

---

**Step 317: Create Marketing ROI Analysis**

File: `/lib/insights/marketing-roi.ts`

Content: Calculate ROI for different marketing channels (20 tokens)

Acceptance: Analysis works

Test: Unit test

---

**Step 318: Create Expense Value Analysis**

File: `/lib/insights/expense-value.ts`

Content: Identify which expenses generate value vs drain money (20 tokens)

Acceptance: Analysis works

Test: Unit test

---

**Step 319: Create ROI Insights API**

File: `/app/api/insights/roi/route.ts`

Content: GET handler that checks tokens (20 tokens), returns ROI insights

Acceptance: API works, tokens deducted

Test: Can get ROI insights, tokens decrease

---

**Step 320: Create ROI Insights UI**

File: `/app/insights/roi/page.tsx`

Content: Page to display ROI insights and recommendations

Acceptance: Page accessible

Test: Navigate to page

---

**Step 321: Display Marketing Channel ROI**

File: `/components/insights/MarketingROI.tsx`

Content: Display ROI for each marketing channel

Acceptance: ROI displays

Test: Can see marketing ROI

---

**Step 322: Display Expense Value Analysis**

File: `/components/insights/ExpenseValue.tsx`

Content: Display which expenses generate value vs drain money

Acceptance: Analysis displays

Test: Can see expense value

---

**Step 323: Add ROI Recommendations**

File: `/components/insights/ROIRecommendations.tsx`

Content: Display recommendations based on ROI analysis

Acceptance: Recommendations display

Test: Can see recommendations

---

**Step 324: Test ROI Insights System**

Action: Test all ROI analysis features

Acceptance: All ROI features work

Test: End-to-end test

---

**Step 325: Create Insights Dashboard**

File: `/app/insights/dashboard/page.tsx`

Content: Dashboard showing all insights (cost optimization, waste, ROI)

Acceptance: Dashboard accessible

Test: Navigate to dashboard

---

## PHASE 7C: BUDGETING & SMART ALERTS (Steps 326-350)

### Auto-Budget Creation (Steps 326-340)

**Step 326: Create Budget Table Migration**

File: `/supabase/migrations/022_create_budgets.sql`

Content: CREATE TABLE budgets with category, amount, period fields

Acceptance: Table created

Test: Table exists

---

**Step 327: Create Auto-Budget Generation Function**

File: `/lib/budget/auto-generate.ts`

Content: Generate budgets automatically based on past spending data (NO tokens - free)

Acceptance: Auto-generation works

Test: Unit test

---

**Step 328: Create Budget Generation API**

File: `/app/api/budgets/generate/route.ts`

Content: POST handler to generate budgets from historical data

Acceptance: API works

Test: Can generate budgets

---

**Step 329: Create Budget Generation UI**

File: `/app/budgets/generate/page.tsx`

Content: Page to generate and review auto-budgets

Acceptance: Page accessible

Test: Navigate to page

---

**Step 330: Add Budget Review and Edit**

File: `/components/budget/BudgetReview.tsx`

Content: Review and edit auto-generated budgets

Acceptance: Can review and edit

Test: Budget editing works

---

**Step 331: Create Manual Budget Creation**

File: `/components/budget/CreateBudgetForm.tsx`

Content: Form to manually create budgets

Acceptance: Form works

Test: Can create budget manually

---

**Step 332: Create Budget Management API**

File: `/app/api/budgets/route.ts`

Content: CRUD operations for budgets (NO tokens - free)

Acceptance: API works

Test: Can manage budgets

---

**Step 333: Create Budgets List Page**

File: `/app/budgets/page.tsx`

Content: Page to list all budgets

Acceptance: Page accessible

Test: Navigate to page

---

**Step 334: Display Budgets by Category**

File: `/components/budget/BudgetsList.tsx`

Content: Display budgets organized by category

Acceptance: Budgets display

Test: Can see budgets

---

**Step 335: Add Budget Period Selection**

File: `/components/budget/BudgetPeriodSelector.tsx`

Content: Select budget period (monthly, quarterly, yearly)

Acceptance: Period selection works

Test: Can select period

---

### Real-Time Budget Tracking (Steps 336-350)

**Step 336: Create Budget vs Actual Calculation**

File: `/lib/budget/tracking.ts`

Content: Calculate actual spending vs budget in real-time (NO tokens - free)

Acceptance: Calculation works

Test: Unit test

---

**Step 337: Create Budget Tracking API**

File: `/app/api/budgets/[id]/tracking/route.ts`

Content: GET handler returning budget vs actual data

Acceptance: API works

Test: Can get tracking data

---

**Step 338: Create Budget Tracking UI**

File: `/app/budgets/[id]/tracking/page.tsx`

Content: Page showing budget vs actual spending

Acceptance: Page accessible

Test: Navigate to page

---

**Step 339: Display Budget Progress Bars**

File: `/components/budget/BudgetProgress.tsx`

Content: Visual progress bars showing budget usage

Acceptance: Progress displays

Test: Can see progress

---

**Step 340: Add Budget Variance Alerts**

File: `/lib/alerts/budget-alerts.ts`

Content: Alert when spending exceeds budget thresholds (50%, 75%, 90%, 100%)

Acceptance: Alerts work

Test: Alerts trigger

---

**Step 341: Create Budget Alert Notifications**

File: `/components/alerts/BudgetAlerts.tsx`

Content: Display budget alerts in UI

Acceptance: Alerts display

Test: Can see alerts

---

**Step 342: Add Budget Alert Email Notifications**

File: `/lib/notifications/budget-email.ts`

Content: Send email when budget thresholds exceeded

Acceptance: Emails sent

Test: Can receive emails

---

**Step 343: Create Smart Budget Recommendations**

File: `/lib/budget/recommendations.ts`

Content: Recommend budget adjustments based on spending patterns (NO tokens - free)

Acceptance: Recommendations work

Test: Unit test

---

**Step 344: Display Budget Recommendations**

File: `/components/budget/BudgetRecommendations.tsx`

Content: Display smart budget recommendations

Acceptance: Recommendations display

Test: Can see recommendations

---

**Step 345: Add Budget Forecasting**

File: `/lib/budget/forecast.ts`

Content: Forecast if budget will be exceeded based on current spending rate (15 tokens)

Acceptance: Forecasting works

Test: Unit test

---

**Step 346: Display Budget Forecast**

File: `/components/budget/BudgetForecast.tsx`

Content: Display budget forecast and warnings

Acceptance: Forecast displays

Test: Can see forecast

---

**Step 347: Add Budget Comparison**

File: `/components/budget/BudgetComparison.tsx`

Content: Compare budgets across different periods

Acceptance: Comparison displays

Test: Can compare budgets

---

**Step 348: Create Budget Reports**

File: `/app/api/reports/budget/route.ts`

Content: Generate budget reports (NO tokens - reports free)

Acceptance: Reports generate

Test: Can generate reports

---

**Step 349: Add Budget Export**

File: `/lib/reports/budget-export.ts`

Content: Export budgets to PDF/Excel

Acceptance: Export works

Test: Can export budgets

---

**Step 350: Test Budgeting System**

Action: Test all budgeting features

Acceptance: All features work

Test: End-to-end test

---

## PHASE 7D: COMPREHENSIVE DASHBOARDS & VISUALIZATIONS (Steps 351-400)

### Real-Time Cashflow Graph (Steps 351-360)

**Step 351: Install Chart Libraries**

Command: `npm install recharts` or `chart.js react-chartjs-2` for powerful charts

Acceptance: Packages installed

Test: Can import libraries

---

**Step 352: Create Real-Time Cashflow Data Function**

File: `/lib/dashboard/cashflow-data.ts`

Content: Function to fetch real-time cashflow data (NO tokens - dashboard free)

Acceptance: Data function works

Test: Unit test

---

**Step 353: Create Real-Time Cashflow Graph Component**

File: `/components/dashboard/CashflowGraph.tsx`

Content: Real-time cashflow graph with time series (daily, weekly, monthly views)

Acceptance: Graph displays

Test: Can see cashflow graph

---

**Step 354: Add Real-Time Updates to Cashflow Graph**

File: `/components/dashboard/CashflowGraph.tsx`

Content: Auto-refresh cashflow data every 30 seconds

Acceptance: Graph updates in real-time

Test: Graph refreshes

---

**Step 355: Add Cashflow Graph Controls**

File: `/components/dashboard/CashflowControls.tsx`

Content: Controls to switch between daily, weekly, monthly views

Acceptance: Controls work

Test: Can switch views

---

### Spending Heatmap (Steps 356-365)

**Step 356: Create Spending Heatmap Data Function**

File: `/lib/dashboard/heatmap-data.ts`

Content: Function to generate spending heatmap data by date and category

Acceptance: Data function works

Test: Unit test

---

**Step 357: Create Spending Heatmap Component**

File: `/components/dashboard/SpendingHeatmap.tsx`

Content: Calendar-style heatmap showing spending intensity by day

Acceptance: Heatmap displays

Test: Can see heatmap

---

**Step 358: Add Heatmap Tooltips**

File: `/components/dashboard/SpendingHeatmap.tsx`

Content: Show spending details on hover

Acceptance: Tooltips work

Test: Can see details on hover

---

**Step 359: Add Heatmap Color Scale**

File: `/components/dashboard/SpendingHeatmap.tsx`

Content: Color scale from low (green) to high (red) spending

Acceptance: Colors display correctly

Test: Colors show intensity

---

**Step 360: Add Heatmap Category Filter**

File: `/components/dashboard/HeatmapFilters.tsx`

Content: Filter heatmap by category

Acceptance: Filter works

Test: Can filter heatmap

---

### Expense Category Breakdown (Steps 361-370)

**Step 361: Create Expense Category Data Function**

File: `/lib/dashboard/category-breakdown.ts`

Content: Function to calculate expense breakdown by category

Acceptance: Data function works

Test: Unit test

---

**Step 362: Create Expense Category Pie Chart**

File: `/components/dashboard/CategoryPieChart.tsx`

Content: Pie chart showing expense breakdown by category

Acceptance: Pie chart displays

Test: Can see pie chart

---

**Step 363: Create Expense Category Bar Chart**

File: `/components/dashboard/CategoryBarChart.tsx`

Content: Bar chart showing expenses by category

Acceptance: Bar chart displays

Test: Can see bar chart

---

**Step 364: Add Category Breakdown Table**

File: `/components/dashboard/CategoryTable.tsx`

Content: Table showing category breakdown with percentages

Acceptance: Table displays

Test: Can see table

---

**Step 365: Add Category Drill-Down**

File: `/components/dashboard/CategoryDrillDown.tsx`

Content: Click category to see detailed transactions

Acceptance: Drill-down works

Test: Can drill down

---

### Profit vs Loss Visualization (Steps 366-375)

**Step 366: Create P&L Data Function**

File: `/lib/dashboard/pl-data.ts`

Content: Function to calculate profit vs loss data

Acceptance: Data function works

Test: Unit test

---

**Step 367: Create Profit vs Loss Line Chart**

File: `/components/dashboard/ProfitLossChart.tsx`

Content: Line chart showing profit vs loss over time

Acceptance: Chart displays

Test: Can see chart

---

**Step 368: Add P&L Comparison**

File: `/components/dashboard/PLComparison.tsx`

Content: Compare current period vs previous period

Acceptance: Comparison displays

Test: Can see comparison

---

**Step 369: Add P&L Breakdown**

File: `/components/dashboard/PLBreakdown.tsx`

Content: Breakdown of revenue and expenses

Acceptance: Breakdown displays

Test: Can see breakdown

---

**Step 370: Add P&L Forecast Overlay**

File: `/components/dashboard/PLForecast.tsx`

Content: Overlay forecasted P&L on actual P&L chart

Acceptance: Forecast overlay displays

Test: Can see forecast

---

### Forecast Curves (Steps 371-380)

**Step 371: Create Forecast Curves Data Function**

File: `/lib/dashboard/forecast-curves.ts`

Content: Function to generate forecast curves for cashflow, revenue, expenses

Acceptance: Data function works

Test: Unit test

---

**Step 372: Create Forecast Curves Chart**

File: `/components/dashboard/ForecastCurves.tsx`

Content: Chart showing forecast curves with confidence intervals

Acceptance: Chart displays

Test: Can see forecast curves

---

**Step 373: Add Forecast vs Actual Comparison**

File: `/components/dashboard/ForecastComparison.tsx`

Content: Compare forecasted vs actual values

Acceptance: Comparison displays

Test: Can see comparison

---

**Step 374: Add Forecast Accuracy Metrics**

File: `/components/dashboard/ForecastAccuracy.tsx`

Content: Display forecast accuracy metrics

Acceptance: Metrics display

Test: Can see accuracy

---

**Step 375: Add Multiple Forecast Scenarios**

File: `/components/dashboard/ForecastScenarios.tsx`

Content: Show optimistic, realistic, pessimistic scenarios

Acceptance: Scenarios display

Test: Can see scenarios

---

### Vendor Ranking (Steps 376-385)

**Step 376: Create Vendor Ranking Data Function**

File: `/lib/dashboard/vendor-ranking.ts`

Content: Function to rank vendors by spending, frequency, etc.

Acceptance: Data function works

Test: Unit test

---

**Step 377: Create Vendor Ranking Chart**

File: `/components/dashboard/VendorRankingChart.tsx`

Content: Bar chart ranking vendors by spending

Acceptance: Chart displays

Test: Can see ranking

---

**Step 378: Add Vendor Ranking Table**

File: `/components/dashboard/VendorRankingTable.tsx`

Content: Table showing vendor rankings with details

Acceptance: Table displays

Test: Can see table

---

**Step 379: Add Vendor Ranking Filters**

File: `/components/dashboard/VendorFilters.tsx`

Content: Filter by time period, category, etc.

Acceptance: Filters work

Test: Can filter rankings

---

**Step 380: Add Vendor Details Modal**

File: `/components/dashboard/VendorDetailsModal.tsx`

Content: Modal showing detailed vendor information

Acceptance: Modal displays

Test: Can see vendor details

---

### Waste Detection Report (Steps 381-390)

**Step 381: Create Waste Detection Report Data Function**

File: `/lib/dashboard/waste-report.ts`

Content: Function to generate waste detection report data

Acceptance: Data function works

Test: Unit test

---

**Step 382: Create Waste Detection Report Component**

File: `/components/dashboard/WasteReport.tsx`

Content: Report showing duplicate payments, unused subscriptions, etc.

Acceptance: Report displays

Test: Can see report

---

**Step 383: Add Waste Detection Charts**

File: `/components/dashboard/WasteCharts.tsx`

Content: Charts visualizing waste detection results

Acceptance: Charts display

Test: Can see charts

---

**Step 384: Add Waste Detection Summary**

File: `/components/dashboard/WasteSummary.tsx`

Content: Summary of potential savings from waste reduction

Acceptance: Summary displays

Test: Can see summary

---

**Step 385: Add Waste Detection Actions**

File: `/components/dashboard/WasteActions.tsx`

Content: Actions to resolve waste (cancel subscriptions, etc.)

Acceptance: Actions work

Test: Can take actions

---

### Inventory + COGS Intelligence (Steps 386-395)

**Step 386: Create Inventory Table Migration**

File: `/supabase/migrations/027_create_inventory.sql`

Content: CREATE TABLE inventory with items, quantities, costs

Acceptance: Table created

Test: Table exists

---

**Step 387: Create COGS Calculation Function**

File: `/lib/dashboard/cogs-calculation.ts`

Content: Calculate Cost of Goods Sold (COGS) from inventory

Acceptance: Calculation works

Test: Unit test

---

**Step 388: Create Inventory Dashboard Component**

File: `/components/dashboard/InventoryDashboard.tsx`

Content: Dashboard showing inventory levels, turnover, COGS

Acceptance: Dashboard displays

Test: Can see inventory

---

**Step 389: Create Inventory Charts**

File: `/components/dashboard/InventoryCharts.tsx`

Content: Charts showing inventory trends, turnover rates

Acceptance: Charts display

Test: Can see charts

---

**Step 390: Create COGS Intelligence Component**

File: `/components/dashboard/COGSIntelligence.tsx`

Content: AI-powered insights on COGS optimization

Acceptance: Component displays

Test: Can see COGS insights

---

**Step 391: Add Inventory Alerts**

File: `/components/dashboard/InventoryAlerts.tsx`

Content: Alerts for low stock, high turnover items

Acceptance: Alerts display

Test: Can see alerts

---

**Step 392: Add Inventory Forecasting**

File: `/lib/dashboard/inventory-forecast.ts`

Content: Forecast inventory needs based on sales trends

Acceptance: Forecasting works

Test: Unit test

---

**Step 393: Create Comprehensive Main Dashboard**

File: `/app/dashboard/page.tsx`

Content: Main dashboard combining all visualizations (cashflow, heatmap, categories, P&L, forecasts, vendors, waste, inventory)

Acceptance: Dashboard displays all components

Test: Can see all visualizations

---

**Step 394: Add Dashboard Customization**

File: `/components/dashboard/DashboardCustomizer.tsx`

Content: Allow users to customize dashboard layout and widgets

Acceptance: Customization works

Test: Can customize dashboard

---

**Step 395: Add Dashboard Export**

File: `/lib/dashboard/export.ts`

Content: Export dashboard as PDF/image

Acceptance: Export works

Test: Can export dashboard

---

**Step 396: Add Real-Time Dashboard Updates**

File: `/lib/dashboard/realtime.ts`

Content: Real-time updates for all dashboard components

Acceptance: Updates work

Test: Dashboard updates in real-time

---

**Step 397: Add Dashboard Filters**

File: `/components/dashboard/DashboardFilters.tsx`

Content: Global filters for date range, categories, etc.

Acceptance: Filters work

Test: Can filter dashboard

---

**Step 398: Add Dashboard Widgets**

File: `/components/dashboard/DashboardWidgets.tsx`

Content: Reusable widgets for different metrics

Acceptance: Widgets work

Test: Can use widgets

---

**Step 399: Optimize Dashboard Performance**

File: Dashboard components

Content: Optimize queries, caching, lazy loading for dashboard

Acceptance: Dashboard loads fast

Test: Performance test

---

**Step 400: Test Comprehensive Dashboard**

Action: Test all dashboard features and visualizations

Acceptance: All features work

Test: End-to-end test

---

**Step 286: Install NLP/LLM Libraries**

Command: `npm install openai` or `@anthropic-ai/sdk` for LLM integration

Acceptance: Packages installed

Test: Can import libraries

---

**Step 287: Create NLP Chat Function with Financial Context**

File: `/lib/nlp/chat.ts`

Content: NLP query processing with financial data context (5 tokens per query, token cost varies by plan)

Acceptance: NLP works

Test: Unit test

---

**Step 288: Create Plan-Based Token Control for NLP**

File: `/lib/nlp/plan-limits.ts`

Content: Check user's plan and apply token limits for NLP (Basic: 5 tokens, Starter: 5 tokens, Pro: 5 tokens, Plus: 5 tokens - can be adjusted via admin)

Acceptance: Plan limits work

Test: Unit test

---

**Step 289: Create Financial Query Intent Classifier**

File: `/lib/nlp/intent-classifier.ts`

Content: Classify user queries (expense analysis, cashflow, forecasting, waste detection, etc.)

Acceptance: Intent classification works

Test: Unit test

---

**Step 290: Create Financial Data Query Generator**

File: `/lib/nlp/query-generator.ts`

Content: Generate database queries from natural language

Acceptance: Query generation works

Test: Unit test

---

**Step 291: Create Chart Generation from Queries**

File: `/lib/nlp/chart-generator.ts`

Content: Generate charts based on query results

Acceptance: Chart generation works

Test: Unit test

---

**Step 292: Create NLP Chat API WITH TOKEN CHECK & PLAN CONTROL**

File: `/app/api/nlp/chat/route.ts`

Content: POST handler that checks plan, checks tokens (varies by plan), deducts, then processes query with charts

Acceptance: API works, tokens deducted based on plan

Test: Can query, tokens decrease

---

**Step 293: Create Enhanced NLP Chat UI**

File: `/app/chat/page.tsx`

Content: Chat interface with message history, chart display, query suggestions

Acceptance: UI displays

Test: Can use chat

---

**Step 294: Add Query Suggestions**

File: `/components/nlp/QuerySuggestions.tsx`

Content: Show suggested queries (e.g., "Why did expenses increase?", "Show cashflow risks")

Acceptance: Suggestions display

Test: Can see suggestions

---

**Step 295: Add Chart Display in Chat**

File: `/components/nlp/ChatChart.tsx`

Content: Display charts inline in chat responses

Acceptance: Charts display in chat

Test: Can see charts

---

**Step 296: Add Financial Health Summary**

File: `/lib/nlp/health-summary.ts`

Content: Generate financial health summary from user query

Acceptance: Summary works

Test: Unit test

---

**Step 297: Add Query Examples**

File: `/components/nlp/QueryExamples.tsx`

Content: Show example queries users can ask

Acceptance: Examples display

Test: Can see examples

---

**Step 298: Test NLP Chat with Plan Control**

Action: Test NLP chat with different plans, verify token costs

Acceptance: Plan-based token control works

Test: End-to-end test

---

**Step 289: Install Fraud Detection Libraries**

Command: `npm install isolation-forest` or similar anomaly detection libraries

Acceptance: Packages installed

Test: Can import libraries

---

**Step 290: Create Anomaly Detection Function (Isolation Forest)**

File: `/lib/fraud/anomaly-detector.ts`

Content: Detect anomalies in transactions using Isolation Forest algorithm (10 tokens per analysis)

Acceptance: Anomaly detection works

Test: Unit test

---

**Step 291: Create Fraud Pattern Detection**

File: `/lib/fraud/pattern-detector.ts`

Content: Detect fraud patterns (unusual amounts, frequencies, vendors, times) (10 tokens)

Acceptance: Pattern detection works

Test: Unit test

---

**Step 292: Create Risk Scoring Function**

File: `/lib/fraud/risk-scoring.ts`

Content: Calculate risk scores for transactions (0-100 scale) (10 tokens)

Acceptance: Risk scoring works

Test: Unit test

---

**Step 293: Create Fraud Detection API WITH TOKEN CHECK**

File: `/app/api/fraud/detect/route.ts`

Content: POST handler that checks tokens (10 tokens), deducts, then analyzes transactions for fraud/anomalies

Acceptance: API works, tokens deducted

Test: Can detect fraud, tokens decrease

---

**Step 294: Create Fraud Detection UI**

File: `/app/fraud/page.tsx`

Content: Page to display fraud alerts with risk scores

Acceptance: Page accessible

Test: Navigate to page

---

**Step 295: Display Fraud Alerts**

File: `/components/fraud/FraudAlerts.tsx`

Content: Display fraud alerts with risk scores and details

Acceptance: Alerts display

Test: Can see fraud alerts

---

**Step 296: Add Fraud Alert Notifications**

File: `/lib/notifications/fraud-alerts.ts`

Content: Send notifications for high-risk fraud alerts

Acceptance: Notifications sent

Test: Can receive notifications

---

**Step 297: Create Fraud Investigation Tools**

File: `/app/fraud/[id]/investigate/page.tsx`

Content: Page to investigate flagged transactions

Acceptance: Page accessible

Test: Can investigate fraud

---

**Step 298: Add Fraud Whitelist/Blacklist**

File: `/app/api/fraud/whitelist/route.ts`

Content: API to whitelist/blacklist vendors or patterns

Acceptance: Whitelist works

Test: Can manage whitelist

---

**Step 299: Test Fraud Detection System**

Action: Test all fraud detection features

Acceptance: All features work

Test: End-to-end test

---

**Step 292: Test All AI Features with Tokens**

Action: Test all AI features, verify tokens deducted

Acceptance: All features work, tokens tracked

Test: End-to-end test

---

## PHASE 8: TOKEN SYSTEM ENHANCEMENTS (Steps 293-330)

**Step 293: Add Token Usage Alerts**

File: `/lib/billing/alerts.ts`

Content: Alert when tokens at 80%, 90%, 100%

Acceptance: Alerts work

Test: Alerts trigger

---

**Step 294: Add Trial Warning Notifications**

File: `/components/billing/TrialWarning.tsx`

Content: Show warning when trial ending soon (3 days, 1 day)

Acceptance: Warnings show

Test: Can see warnings

---

**Step 295: Reset Tokens on Subscription Renewal**

File: `/lib/billing/tokens.ts`

Content: Reset tokens on period end, allocate new tokens

Acceptance: Tokens reset

Test: Tokens reset correctly

---

**Step 296: Add Token Purchase Option (Plus Plan)**

File: `/app/api/subscription/purchase-tokens/route.ts`

Content: Allow Plus plan to purchase additional tokens

Acceptance: Purchase works

Test: Can purchase tokens

---

**Step 297: Handle Token Rollover (Plus Plan)**

File: `/lib/billing/tokens.ts`

Content: Allow Plus plan to rollover unused tokens (up to 50%)

Acceptance: Rollover works

Test: Tokens rollover

---

**Step 298: Create Token Usage Reports**

File: `/app/api/reports/token-usage/route.ts`

Content: Generate token usage reports (NO tokens - reports free)

Acceptance: Reports generate

Test: Can generate reports

---

**Step 299: Create Token Usage Dashboard**

File: `/components/billing/TokenUsageDashboard.tsx`

Content: Show token usage breakdown by action type

Acceptance: Dashboard displays

Test: Can see usage

---

**Step 300: Create Token Usage API**

File: `/app/api/subscription/token-usage/route.ts`

Content: GET handler returning usage statistics

Acceptance: API returns usage

Test: Can fetch usage

---

**Step 301: Add Token Usage to Subscription Status**

File: `/components/billing/SubscriptionStatus.tsx`

Content: Show tokens used vs allocated

Acceptance: Status shows tokens

Test: Can see token status

---

**Step 302: Add Upgrade/Downgrade API**

File: `/app/api/subscription/change/route.ts`

Content: POST handler to change subscription plan

Acceptance: Can change plan

Test: Plan changes

---

**Step 303: Create Billing Settings Page**

File: `/app/settings/billing/page.tsx`

Content: Page to view and manage subscription

Acceptance: Page accessible

Test: Navigate to page

---

**Step 304: Add Plan Comparison UI**

File: `/components/billing/PlanComparison.tsx`

Content: Compare all plans side-by-side

Acceptance: Comparison displays

Test: Can see all plans

---

**Step 305: Add Error Handling for Token Exhaustion**

File: Token check middleware

Content: Handle token exhaustion gracefully

Acceptance: Errors handled

Test: Graceful error messages

---

**Step 306: Add Loading States for Token Checks**

File: API routes and components

Content: Show loading during token checks

Acceptance: Loading states work

Test: Loading displays

---

**Step 307: Optimize Token Check Performance**

File: `/lib/middleware/token-check.ts`

Content: Cache token status, optimize queries

Acceptance: Performance improved

Test: Faster token checks

---

**Step 308: Add Token Usage Analytics**

File: `/lib/billing/analytics.ts`

Content: Track token usage patterns

Acceptance: Analytics work

Test: Can see patterns

---

**Step 309: Create Subscription Management UI**

File: `/app/settings/subscription/page.tsx`

Content: UI to manage subscription

Acceptance: UI displays

Test: Can manage subscription

---

**Step 310: Add Payment Integration**

File: `/app/api/payment/checkout/route.ts`

Content: Payment processing integration

Acceptance: Payment works

Test: Can process payment

---

**Step 310A: Create Admin Token Management API**

File: `/app/api/admin/token-plans/route.ts`

Content: GET/PUT handlers to view and update token allocations for each plan

Acceptance: API works

Test: Can update token allocations

---

**Step 310B: Create Admin Token Management UI**

File: `/app/admin/token-plans/page.tsx`

Content: Admin page to view and edit token allocations per plan

Acceptance: Admin page accessible

Test: Can access admin page

---

**Step 310C: Create Token Plan Edit Form**

File: `/components/admin/TokenPlanEditForm.tsx`

Content: Form to edit token allocations for each plan

Acceptance: Form displays

Test: Can edit token allocations

---

**Step 310D: Add Token Plan Update Validation**

File: `/app/api/admin/token-plans/route.ts`

Content: Validate token allocation changes (must be positive, reasonable limits)

Acceptance: Validation works

Test: Invalid values rejected

---

**Step 310E: Update Existing Subscriptions on Plan Change**

File: `/lib/billing/token-plans.ts`

Content: When plan token allocation changes, update existing subscriptions (pro-rated or next period)

Acceptance: Existing subscriptions updated

Test: Subscriptions reflect new token amounts

---

**Step 310F: Add Token Plan Change History**

File: `/supabase/migrations/021_create_token_plan_history.sql`

Content: CREATE TABLE to track token plan changes over time

Acceptance: History tracked

Test: Changes logged

---

**Step 310G: Create Token Plan Change Log UI**

File: `/app/admin/token-plans/history/page.tsx`

Content: Display history of token plan changes

Acceptance: History displays

Test: Can see change history

---

**Step 310H: Add Admin Authentication**

File: `/lib/auth/admin.ts`

Content: Admin role check and authentication

Acceptance: Admin auth works

Test: Only admins can access

---

**Step 310I: Add Token Plan Preview**

File: `/components/admin/TokenPlanPreview.tsx`

Content: Preview how token changes affect existing users

Acceptance: Preview works

Test: Can preview changes

---

**Step 310J: Test Token Plan Management**

Action: Test updating token allocations and verify changes apply

Acceptance: Token management works

Test: End-to-end test

---

**Step 311: Add Email Notifications**

File: `/lib/notifications/email.ts`

Content: Email notifications for token alerts, trial warnings

Acceptance: Emails sent

Test: Can receive emails

---

**Step 312: Add In-App Notifications**

File: `/components/notifications/NotificationCenter.tsx`

Content: In-app notification system

Acceptance: Notifications work

Test: Can see notifications

---

**Step 313: Comprehensive Testing**

Action: Test all token flows (allocation, usage, exhaustion, renewal)

Acceptance: System works

Test: End-to-end test

---

**Step 314: Documentation**

File: `/docs/TOKEN_SYSTEM.md`

Content: Document token system architecture and usage

Acceptance: Documentation complete

Test: Documentation is clear

---

**Step 315: Test Complete Token System**

Action: Final end-to-end test of entire token system

Acceptance: All features work correctly

Test: Complete system test

---

## PHASE 9: MOBILE APP DEVELOPMENT (Steps 316-400)

### Mobile App Foundation (Steps 316-330)

**Step 316: Initialize React Native Project**

Command: `npx react-native init iBookkeeperMobile --template react-native-template-typescript`

Folder: `/mobile/` (separate from web app)

Acceptance: React Native project created

Test: Can run on iOS and Android simulators

---

**Step 317: Set Up React Native Project Structure**

File: `/mobile/` folder structure

Content: Organize folders (screens, components, services, navigation)

Acceptance: Structure created

Test: Project compiles

---

**Step 318: Install React Native Dependencies**

Command: Install navigation, async storage, camera, image picker, etc.

Acceptance: Dependencies installed

Test: No errors

---

**Step 319: Create Shared API Client**

File: `/mobile/services/api.ts`

Content: API client that works with same backend as web app

Acceptance: API client works

Test: Can make API calls

---

**Step 320: Set Up React Navigation**

File: `/mobile/navigation/AppNavigator.tsx`

Content: Navigation structure for mobile app

Acceptance: Navigation works

Test: Can navigate between screens

---

**Step 321: Create Mobile Authentication Service**

File: `/mobile/services/auth.ts`

Content: Auth service using Supabase (same as web)

Acceptance: Auth service works

Test: Can authenticate

---

**Step 322: Create Mobile Token Service**

File: `/mobile/services/tokens.ts`

Content: Token checking and management (same logic as web)

Acceptance: Token service works

Test: Can check tokens

---

**Step 323: Set Up AsyncStorage for Offline**

File: `/mobile/services/storage.ts`

Content: Local storage for offline mode

Acceptance: Storage works

Test: Can store/retrieve data

---

**Step 324: Create Mobile App Config**

File: `/mobile/config.ts`

Content: API endpoints, app config

Acceptance: Config works

Test: Can access config

---

**Step 325: Test Mobile App Foundation**

Action: Test basic app structure

Acceptance: Foundation works

Test: App runs on both platforms

---

### Mobile Authentication Screens (Steps 326-340)

**Step 326: Create Mobile Login Screen**

File: `/mobile/screens/auth/LoginScreen.tsx`

Content: Login screen for mobile

Acceptance: Screen displays

Test: Can see login screen

---

**Step 327: Create Mobile Sign Up Screen**

File: `/mobile/screens/auth/SignUpScreen.tsx`

Content: Sign up screen for mobile

Acceptance: Screen displays

Test: Can see sign up screen

---

**Step 328: Connect Mobile Login to API**

File: `/mobile/screens/auth/LoginScreen.tsx`

Content: Connect login form to auth service

Acceptance: Login works

Test: Can login

---

**Step 329: Connect Mobile Sign Up to API**

File: `/mobile/screens/auth/SignUpScreen.tsx`

Content: Connect sign up form to auth service

Acceptance: Sign up works

Test: Can sign up

---

**Step 330: Add Mobile Auth Navigation**

File: `/mobile/navigation/AuthNavigator.tsx`

Content: Navigation for auth screens

Acceptance: Navigation works

Test: Can navigate auth screens

---

**Step 331: Add Mobile Auth Persistence**

File: `/mobile/services/auth.ts`

Content: Persist auth state, auto-login

Acceptance: Auth persists

Test: Stays logged in

---

**Step 332: Create Mobile Loading Screen**

File: `/mobile/screens/LoadingScreen.tsx`

Content: Loading screen while checking auth

Acceptance: Loading screen shows

Test: Shows during auth check

---

**Step 333: Add Mobile Error Handling**

File: `/mobile/components/ErrorHandler.tsx`

Content: Error handling for auth

Acceptance: Errors handled

Test: Errors display correctly

---

**Step 334: Style Mobile Auth Screens**

File: Mobile auth screens

Content: Mobile-friendly styling

Acceptance: Screens look good

Test: Visual inspection

---

**Step 335: Test Mobile Authentication Flow**

Action: Test complete auth flow

Acceptance: Flow works

Test: End-to-end test

---

### Mobile Dashboard & Navigation (Steps 336-350)

**Step 336: Create Mobile Dashboard Screen**

File: `/mobile/screens/dashboard/DashboardScreen.tsx`

Content: Main dashboard for mobile

Acceptance: Dashboard displays

Test: Can see dashboard

---

**Step 337: Create Mobile Bottom Tab Navigation**

File: `/mobile/navigation/TabNavigator.tsx`

Content: Bottom tabs (Dashboard, Transactions, Documents, Reports, Settings)

Acceptance: Tabs work

Test: Can switch tabs

---

**Step 338: Create Mobile Drawer Navigation**

File: `/mobile/navigation/DrawerNavigator.tsx`

Content: Side drawer for navigation

Acceptance: Drawer works

Test: Can open drawer

---

**Step 339: Add Mobile Token Status Display**

File: `/mobile/components/TokenStatus.tsx`

Content: Show token balance on dashboard

Acceptance: Token status shows

Test: Can see tokens

---

**Step 340: Create Mobile Trial Status Component**

File: `/mobile/components/TrialStatus.tsx`

Content: Show trial status on mobile

Acceptance: Trial status shows

Test: Can see trial info

---

**Step 341: Add Mobile Quick Actions**

File: `/mobile/components/QuickActions.tsx`

Content: Quick action buttons (Add Transaction, Capture Receipt, etc.)

Acceptance: Quick actions work

Test: Can use quick actions

---

**Step 342: Create Mobile Settings Screen**

File: `/mobile/screens/settings/SettingsScreen.tsx`

Content: Settings screen

Acceptance: Settings screen displays

Test: Can see settings

---

**Step 343: Add Mobile Logout Functionality**

File: `/mobile/screens/settings/SettingsScreen.tsx`

Content: Logout button and handler

Acceptance: Logout works

Test: Can logout

---

**Step 344: Style Mobile Dashboard**

File: Mobile dashboard components

Content: Mobile-friendly styling

Acceptance: Dashboard looks good

Test: Visual inspection

---

**Step 345: Test Mobile Dashboard**

Action: Test dashboard functionality

Acceptance: Dashboard works

Test: End-to-end test

---

### Mobile Transaction Management (Steps 346-365)

**Step 346: Create Mobile Transactions List Screen**

File: `/mobile/screens/transactions/TransactionsScreen.tsx`

Content: List of transactions

Acceptance: List displays

Test: Can see transactions

---

**Step 347: Create Mobile Transaction Item Component**

File: `/mobile/components/TransactionItem.tsx`

Content: Transaction list item

Acceptance: Item displays

Test: Can see transaction details

---

**Step 348: Connect Mobile Transactions to API**

File: `/mobile/screens/transactions/TransactionsScreen.tsx`

Content: Fetch transactions from API

Acceptance: Transactions load

Test: Can see transactions

---

**Step 349: Add Mobile Transaction Filters**

File: `/mobile/screens/transactions/TransactionsScreen.tsx`

Content: Filter by date, category, etc.

Acceptance: Filters work

Test: Can filter transactions

---

**Step 350: Create Mobile Transaction Detail Screen**

File: `/mobile/screens/transactions/TransactionDetailScreen.tsx`

Content: View single transaction

Acceptance: Detail screen displays

Test: Can see transaction details

---

**Step 351: Create Mobile Transaction Form Screen**

File: `/mobile/screens/transactions/TransactionFormScreen.tsx`

Content: Form to create/edit transaction

Acceptance: Form displays

Test: Can see form

---

**Step 352: Add Mobile Transaction Form Fields**

File: `/mobile/screens/transactions/TransactionFormScreen.tsx`

Content: All form fields (date, amount, description, category)

Acceptance: Fields work

Test: Can fill form

---

**Step 353: Connect Mobile Transaction Form to API WITH TOKEN CHECK**

File: `/mobile/screens/transactions/TransactionFormScreen.tsx`

Content: Submit transaction with token check (1 token)

Acceptance: Transaction creates

Test: Can create transaction

---

**Step 354: Add Mobile Transaction Edit Functionality**

File: `/mobile/screens/transactions/TransactionFormScreen.tsx`

Content: Edit existing transaction

Acceptance: Edit works

Test: Can edit transaction

---

**Step 355: Test Mobile Transaction Management**

Action: Test all transaction features

Acceptance: All features work

Test: End-to-end test

---

### Mobile Camera & Document Capture (Steps 356-380)

**Step 356: Install Mobile Camera Libraries**

Command: Install react-native-camera or expo-camera

Acceptance: Libraries installed

Test: Can import camera

---

**Step 357: Create Mobile Camera Screen**

File: `/mobile/screens/camera/CameraScreen.tsx`

Content: Camera screen for capturing receipts

Acceptance: Camera screen displays

Test: Can see camera

---

**Step 358: Add Mobile Camera Controls**

File: `/mobile/screens/camera/CameraScreen.tsx`

Content: Capture button, flash, switch camera

Acceptance: Controls work

Test: Can control camera

---

**Step 359: Implement Mobile Photo Capture**

File: `/mobile/screens/camera/CameraScreen.tsx`

Content: Capture photo functionality

Acceptance: Can capture photo

Test: Photo captured

---

**Step 360: Add Mobile Image Preview**

File: `/mobile/screens/camera/ImagePreviewScreen.tsx`

Content: Preview captured image before upload

Acceptance: Preview displays

Test: Can see preview

---

**Step 361: Connect Mobile Camera to Upload API WITH TOKEN CHECK**

File: `/mobile/screens/camera/ImagePreviewScreen.tsx`

Content: Upload image with token check (5 tokens capture + 10 OCR)

Acceptance: Image uploads

Test: Can upload image

---

**Step 362: Add Mobile QR Code Scanner**

File: `/mobile/screens/camera/QRScannerScreen.tsx`

Content: QR code scanner for receipts

Acceptance: QR scanner works

Test: Can scan QR codes

---

**Step 363: Connect Mobile QR Scanner to API WITH TOKEN CHECK**

File: `/mobile/screens/camera/QRScannerScreen.tsx`

Content: Process QR code with token check (3 tokens)

Acceptance: QR processing works

Test: Can process QR

---

**Step 364: Add Mobile Barcode Scanner**

File: `/mobile/screens/camera/BarcodeScannerScreen.tsx`

Content: Barcode scanner

Acceptance: Barcode scanner works

Test: Can scan barcodes

---

**Step 365: Connect Mobile Barcode Scanner to API WITH TOKEN CHECK**

File: `/mobile/screens/camera/BarcodeScannerScreen.tsx`

Content: Process barcode with token check (2 tokens)

Acceptance: Barcode processing works

Test: Can process barcode

---

**Step 366: Create Mobile Documents List Screen**

File: `/mobile/screens/documents/DocumentsScreen.tsx`

Content: List of captured documents

Acceptance: List displays

Test: Can see documents

---

**Step 367: Connect Mobile Documents to API**

File: `/mobile/screens/documents/DocumentsScreen.tsx`

Content: Fetch documents from API

Acceptance: Documents load

Test: Can see documents

---

**Step 368: Create Mobile Document Detail Screen**

File: `/mobile/screens/documents/DocumentDetailScreen.tsx`

Content: View document details

Acceptance: Detail screen displays

Test: Can see document details

---

**Step 369: Add Mobile Document Image Viewer**

File: `/mobile/components/DocumentImageViewer.tsx`

Content: View document images

Acceptance: Images display

Test: Can view images

---

**Step 370: Add Mobile OCR Results Display**

File: `/mobile/screens/documents/DocumentDetailScreen.tsx`

Content: Show OCR extracted data

Acceptance: OCR data displays

Test: Can see OCR results

---

**Step 371: Add Mobile Document to Transaction Flow**

File: `/mobile/screens/documents/DocumentDetailScreen.tsx`

Content: Create transaction from document

Acceptance: Flow works

Test: Can create transaction

---

**Step 372: Add Mobile Image Gallery Picker**

File: `/mobile/screens/documents/ImagePickerScreen.tsx`

Content: Pick images from gallery

Acceptance: Gallery picker works

Test: Can pick images

---

**Step 373: Add Mobile Bulk Image Upload**

File: `/mobile/screens/documents/DocumentsScreen.tsx`

Content: Upload multiple images at once

Acceptance: Bulk upload works

Test: Can upload multiple

---

**Step 374: Add Mobile Image Enhancement**

File: `/mobile/services/imageProcessor.ts`

Content: Enhance images before upload (2 tokens)

Acceptance: Enhancement works

Test: Images enhanced

---

**Step 375: Test Mobile Camera & Document System**

Action: Test all camera and document features

Acceptance: All features work

Test: End-to-end test

---

### Mobile Reports & Analytics (Steps 376-390)

**Step 376: Create Mobile Reports Screen**

File: `/mobile/screens/reports/ReportsScreen.tsx`

Content: Reports list screen

Acceptance: Screen displays

Test: Can see reports

---

**Step 377: Create Mobile P&L Report Screen**

File: `/mobile/screens/reports/PLReportScreen.tsx`

Content: P&L report display

Acceptance: Report displays

Test: Can see P&L

---

**Step 378: Connect Mobile P&L to API**

File: `/mobile/screens/reports/PLReportScreen.tsx`

Content: Fetch P&L data (NO tokens - reports free)

Acceptance: Data loads

Test: Can see P&L data

---

**Step 379: Create Mobile Balance Sheet Screen**

File: `/mobile/screens/reports/BalanceSheetScreen.tsx`

Content: Balance sheet display

Acceptance: Screen displays

Test: Can see balance sheet

---

**Step 380: Create Mobile Cash Flow Screen**

File: `/mobile/screens/reports/CashFlowScreen.tsx`

Content: Cash flow display

Acceptance: Screen displays

Test: Can see cash flow

---

**Step 381: Add Mobile Report Charts**

File: `/mobile/components/ReportChart.tsx`

Content: Charts for reports (using react-native-chart-kit)

Acceptance: Charts display

Test: Can see charts

---

**Step 382: Add Mobile Report Date Filters**

File: `/mobile/screens/reports/ReportsScreen.tsx`

Content: Date range picker

Acceptance: Filters work

Test: Can filter reports

---

**Step 383: Add Mobile Report Export**

File: `/mobile/screens/reports/ReportsScreen.tsx`

Content: Export reports (share functionality)

Acceptance: Export works

Test: Can export reports

---

**Step 384: Style Mobile Reports**

File: Mobile report screens

Content: Mobile-friendly styling

Acceptance: Reports look good

Test: Visual inspection

---

**Step 385: Test Mobile Reports**

Action: Test all report features

Acceptance: All features work

Test: End-to-end test

---

### Mobile Offline Mode & Sync (Steps 386-400)

**Step 386: Set Up Mobile Offline Storage**

File: `/mobile/services/offlineStorage.ts`

Content: Local database for offline data

Acceptance: Storage works

Test: Can store offline

---

**Step 387: Implement Mobile Offline Transaction Creation**

File: `/mobile/services/offlineStorage.ts`

Content: Create transactions offline, queue for sync

Acceptance: Offline creation works

Test: Can create offline

---

**Step 388: Implement Mobile Sync Service**

File: `/mobile/services/sync.ts`

Content: Sync offline data when online

Acceptance: Sync works

Test: Data syncs

---

**Step 389: Add Mobile Sync Status Indicator**

File: `/mobile/components/SyncStatus.tsx`

Content: Show sync status

Acceptance: Status displays

Test: Can see sync status

---

**Step 390: Implement Mobile Conflict Resolution**

File: `/mobile/services/sync.ts`

Content: Handle sync conflicts

Acceptance: Conflicts resolved

Test: Conflicts handled

---

**Step 391: Add Mobile Offline Mode Toggle**

File: `/mobile/screens/settings/SettingsScreen.tsx`

Content: Enable/disable offline mode

Acceptance: Toggle works

Test: Can toggle offline

---

**Step 392: Test Mobile Offline Mode**

Action: Test offline functionality

Acceptance: Offline works

Test: End-to-end test

---

**Step 393: Add Mobile Push Notifications Setup**

File: `/mobile/services/notifications.ts`

Content: Set up push notifications

Acceptance: Notifications work

Test: Can receive notifications

---

**Step 394: Add Mobile Notification Handlers**

File: `/mobile/services/notifications.ts`

Content: Handle different notification types

Acceptance: Handlers work

Test: Notifications handled

---

**Step 395: Test Mobile Notifications**

Action: Test push notifications

Acceptance: Notifications work

Test: Can receive notifications

---

**Step 396: Add Mobile App Icons**

File: `/mobile/assets/icons/`

Content: App icons for iOS and Android

Acceptance: Icons created

Test: Icons display

---

**Step 397: Add Mobile Splash Screens**

File: `/mobile/assets/splash/`

Content: Splash screens for both platforms

Acceptance: Splash screens created

Test: Splash screens show

---

**Step 398: Optimize Mobile App Performance**

File: Mobile app code

Content: Performance optimizations

Acceptance: App is fast

Test: Performance test

---

**Step 399: Add Mobile Error Boundaries**

File: `/mobile/components/ErrorBoundary.tsx`

Content: Error handling

Acceptance: Errors handled

Test: Errors don't crash app

---

**Step 400: Final Mobile App Testing**

Action: Comprehensive testing on iOS and Android

Acceptance: App is production-ready

Test: End-to-end test

---

## PHASE 10: RESPONSIVE WEB DESIGN (Steps 401-420)

**Step 401: Add Responsive Breakpoints**

File: `/tailwind.config.js`

Content: Mobile, tablet, desktop breakpoints

Acceptance: Breakpoints defined

Test: Responsive works

---

**Step 402: Make Dashboard Responsive**

File: `/app/dashboard/page.tsx`

Content: Responsive layout

Acceptance: Dashboard responsive

Test: Works on mobile

---

**Step 403: Make Transaction Forms Responsive**

File: Transaction form components

Content: Mobile-friendly forms

Acceptance: Forms responsive

Test: Works on mobile

---

**Step 404: Make Reports Responsive**

File: Report components

Content: Responsive report layouts

Acceptance: Reports responsive

Test: Works on mobile

---

**Step 405: Add Touch-Friendly Controls**

File: Web components

Content: Larger touch targets

Acceptance: Touch-friendly

Test: Easy to use on mobile

---

**Step 406: Optimize Web for Mobile Performance**

File: Web app code

Content: Performance optimizations

Acceptance: Fast on mobile

Test: Performance test

---

**Step 407: Test Web on Various Devices**

Action: Test on different devices

Acceptance: Works on all devices

Test: Cross-device test

---

**Step 408: Add PWA Support**

File: `/next.config.js`, `/public/manifest.json`

Content: Progressive Web App features

Acceptance: PWA works

Test: Can install as PWA

---

**Step 409: Add Web App Icons**

File: `/public/icons/`

Content: App icons for PWA

Acceptance: Icons created

Test: Icons display

---

**Step 410: Test PWA Installation**

Action: Test PWA installation

Acceptance: Can install PWA

Test: Installation works

---

## PHASE 11: FINAL POLISH & OPTIMIZATION (Steps 411-500)

### Performance Optimization (Steps 411-430)

**Step 411: Optimize Database Queries**

File: API routes

Content: Add query optimization, reduce N+1 queries

Acceptance: Queries optimized

Test: Faster response times

---

**Step 412: Add Caching Layer**

File: `/lib/cache/`

Content: Implement caching for frequently accessed data

Acceptance: Caching works

Test: Faster data access

---

**Step 413: Optimize Image Loading**

File: Image components

Content: Lazy loading, image optimization

Acceptance: Images load efficiently

Test: Faster page loads

---

**Step 414: Add Code Splitting**

File: Next.js config

Content: Implement code splitting for better performance

Acceptance: Code splitting works

Test: Smaller bundle sizes

---

**Step 415: Optimize Bundle Size**

File: Build configuration

Content: Tree shaking, minification

Acceptance: Bundle size reduced

Test: Smaller bundles

---

**Step 416: Add Service Worker**

File: `/public/sw.js`

Content: Service worker for offline support

Acceptance: Service worker works

Test: Offline functionality

---

**Step 417: Optimize API Response Times**

File: API routes

Content: Optimize database queries, add indexes

Acceptance: Faster API responses

Test: Response time improved

---

**Step 418: Add Request Batching**

File: API routes

Content: Batch multiple requests when possible

Acceptance: Batching works

Test: Fewer requests

---

**Step 419: Optimize Token Check Performance**

File: `/lib/middleware/token-check.ts`

Content: Cache token status, optimize queries

Acceptance: Faster token checks

Test: Performance improved

---

**Step 420: Performance Testing**

Action: Run performance tests

Acceptance: Performance meets targets

Test: Performance benchmarks

---

### Security Enhancements (Steps 421-440)

**Step 421: Add Rate Limiting**

File: `/lib/middleware/rate-limit.ts`

Content: Rate limiting for API endpoints

Acceptance: Rate limiting works

Test: Limits enforced

---

**Step 422: Add Input Sanitization**

File: API routes

Content: Sanitize all user inputs

Acceptance: Inputs sanitized

Test: No injection attacks

---

**Step 423: Add CSRF Protection**

File: API routes

Content: CSRF token validation

Acceptance: CSRF protection works

Test: CSRF attacks prevented

---

**Step 424: Add XSS Protection**

File: Components

Content: Sanitize user-generated content

Acceptance: XSS protection works

Test: XSS attacks prevented

---

**Step 425: Add SQL Injection Protection**

File: Database queries

Content: Use parameterized queries

Acceptance: SQL injection prevented

Test: Injection attacks blocked

---

**Step 426: Add Security Headers**

File: `/next.config.js`

Content: Add security headers (CSP, HSTS, etc.)

Acceptance: Headers added

Test: Headers present

---

**Step 427: Add Audit Logging**

File: `/lib/audit/logger.ts`

Content: Log all sensitive operations

Acceptance: Audit logs created

Test: Logs recorded

---

**Step 428: Add Data Encryption**

File: Sensitive data handling

Content: Encrypt sensitive data at rest

Acceptance: Data encrypted

Test: Encryption works

---

**Step 429: Add Two-Factor Authentication**

File: `/app/api/auth/2fa/`

Content: 2FA implementation

Acceptance: 2FA works

Test: Can enable 2FA

---

**Step 430: Security Audit**

Action: Conduct security audit

Acceptance: Security issues resolved

Test: Security review

---

### Error Handling & Monitoring (Steps 431-450)

**Step 431: Add Global Error Handler**

File: `/app/error.tsx`

Content: Global error boundary

Acceptance: Errors handled gracefully

Test: Errors don't crash app

---

**Step 432: Add Error Logging**

File: `/lib/logging/error-logger.ts`

Content: Log errors to monitoring service

Acceptance: Errors logged

Test: Logs captured

---

**Step 433: Add Error Monitoring**

File: Error monitoring setup

Content: Set up error monitoring (Sentry, etc.)

Acceptance: Monitoring works

Test: Errors tracked

---

**Step 434: Add Performance Monitoring**

File: Performance monitoring setup

Content: Set up performance monitoring

Acceptance: Performance tracked

Test: Metrics collected

---

**Step 435: Add User Feedback System**

File: `/components/feedback/FeedbackForm.tsx`

Content: Allow users to report issues

Acceptance: Feedback system works

Test: Can submit feedback

---

**Step 436: Add Health Check Endpoint**

File: `/app/api/health/route.ts`

Content: Health check for monitoring

Acceptance: Health check works

Test: Can check health

---

**Step 437: Add Uptime Monitoring**

File: Monitoring setup

Content: Set up uptime monitoring

Acceptance: Uptime tracked

Test: Monitoring works

---

**Step 438: Add Alert System**

File: `/lib/alerts/`

Content: Alert on errors and issues

Acceptance: Alerts work

Test: Alerts sent

---

**Step 439: Add Error Recovery**

File: Error handling

Content: Automatic error recovery where possible

Acceptance: Recovery works

Test: Errors recovered

---

**Step 440: Test Error Handling**

Action: Test all error scenarios

Acceptance: Errors handled properly

Test: Error testing

---

### Documentation & Testing (Steps 441-460)

**Step 441: Create API Documentation**

File: `/docs/API.md`

Content: Document all API endpoints

Acceptance: API documented

Test: Documentation complete

---

**Step 442: Create User Documentation**

File: `/docs/USER_GUIDE.md`

Content: User guide for the application

Acceptance: User guide complete

Test: Documentation clear

---

**Step 443: Create Developer Documentation**

File: `/docs/DEVELOPER_GUIDE.md`

Content: Developer guide for contributors

Acceptance: Developer guide complete

Test: Documentation clear

---

**Step 444: Add Code Comments**

File: All code files

Content: Add meaningful comments

Acceptance: Code well-commented

Test: Comments helpful

---

**Step 445: Create Deployment Guide**

File: `/docs/DEPLOYMENT.md`

Content: Guide for deploying the application

Acceptance: Deployment guide complete

Test: Can follow guide

---

**Step 446: Add Unit Tests**

File: Test files

Content: Unit tests for core functions

Acceptance: Tests pass

Test: Run test suite

---

**Step 447: Add Integration Tests**

File: Test files

Content: Integration tests for API routes

Acceptance: Tests pass

Test: Run test suite

---

**Step 448: Add E2E Tests**

File: E2E test files

Content: End-to-end tests for critical flows

Acceptance: Tests pass

Test: Run E2E tests

---

**Step 449: Add Test Coverage**

File: Test configuration

Content: Ensure good test coverage

Acceptance: Coverage meets targets

Test: Coverage report

---

**Step 450: Test Documentation**

Action: Review and test all documentation

Acceptance: Documentation accurate

Test: Documentation review

---

### Final Features & Polish (Steps 451-500)

**Step 451: Add Search Functionality**

File: `/app/api/search/route.ts`

Content: Global search across transactions, documents, etc.

Acceptance: Search works

Test: Can search

---

**Step 452: Add Filters and Sorting**

File: List components

Content: Advanced filtering and sorting

Acceptance: Filters work

Test: Can filter and sort

---

**Step 453: Add Export Functionality**

File: Export utilities

Content: Export data in various formats

Acceptance: Export works

Test: Can export data

---

**Step 454: Add Import Functionality**

File: Import utilities

Content: Import data from various sources

Acceptance: Import works

Test: Can import data

---

**Step 455: Add Keyboard Shortcuts**

File: Keyboard handlers

Content: Keyboard shortcuts for common actions

Acceptance: Shortcuts work

Test: Can use shortcuts

---

**Step 456: Add Dark Mode**

File: Theme configuration

Content: Dark mode support

Acceptance: Dark mode works

Test: Can toggle dark mode

---

**Step 457: Add Internationalization**

File: i18n setup

Content: Multi-language support

Acceptance: i18n works

Test: Can switch languages

---

**Step 458: Add Accessibility Features**

File: Components

Content: ARIA labels, keyboard navigation

Acceptance: Accessible

Test: Accessibility audit

---

**Step 459: Add Onboarding Flow**

File: `/app/onboarding/`

Content: User onboarding tutorial

Acceptance: Onboarding works

Test: Can complete onboarding

---

**Step 460: Add Help System**

File: `/app/help/`

Content: Help center and tutorials

Acceptance: Help system works

Test: Can access help

---

**Step 461: Add Feature Flags**

File: `/lib/features/flags.ts`

Content: Feature flag system

Acceptance: Feature flags work

Test: Can toggle features

---

**Step 462: Add A/B Testing**

File: A/B testing setup

Content: A/B testing framework

Acceptance: A/B testing works

Test: Can run tests

---

**Step 463: Add Analytics**

File: Analytics setup

Content: User analytics tracking

Acceptance: Analytics work

Test: Data tracked

---

**Step 464: Add User Preferences**

File: `/app/settings/preferences/`

Content: User preference settings

Acceptance: Preferences work

Test: Can save preferences

---

**Step 465: Add Customization Options**

File: Customization features

Content: Allow users to customize UI

Acceptance: Customization works

Test: Can customize

---

**Step 466: Add Backup and Restore**

File: `/app/api/backup/`

Content: Backup and restore functionality

Acceptance: Backup works

Test: Can backup and restore

---

**Step 467: Add Data Migration Tools**

File: Migration utilities

Content: Tools for data migration

Acceptance: Migration works

Test: Can migrate data

---

**Step 468: Add Compliance Features**

File: Compliance modules

Content: GDPR, SOC 2 compliance features

Acceptance: Compliance features work

Test: Compliance audit

---

**Step 469: Final UI Polish**

File: All UI components

Content: Final UI refinements

Acceptance: UI polished

Test: Visual inspection

---

**Step 470: Final Testing**

Action: Comprehensive final testing

Acceptance: All features work

Test: Complete system test

---

**Step 471: Performance Optimization Review**

Action: Review and optimize performance

Acceptance: Performance optimal

Test: Performance benchmarks

---

**Step 472: Security Review**

Action: Final security review

Acceptance: Security issues resolved

Test: Security audit

---

**Step 473: Code Review**

Action: Review all code

Acceptance: Code quality high

Test: Code review

---

**Step 474: Documentation Review**

Action: Review all documentation

Acceptance: Documentation complete

Test: Documentation review

---

**Step 475: User Acceptance Testing**

Action: Conduct UAT

Acceptance: Users accept system

Test: UAT completed

---

**Step 476: Load Testing**

Action: Conduct load testing

Acceptance: System handles load

Test: Load test results

---

**Step 477: Stress Testing**

Action: Conduct stress testing

Acceptance: System handles stress

Test: Stress test results

---

**Step 478: Disaster Recovery Testing**

Action: Test disaster recovery

Acceptance: Recovery works

Test: DR test completed

---

**Step 479: Production Deployment Preparation**

Action: Prepare for production

Acceptance: Ready for production

Test: Deployment checklist

---

**Step 480: Production Deployment**

Action: Deploy to production

Acceptance: Deployed successfully

Test: Production deployment

---

**Step 481: Post-Deployment Monitoring**

Action: Monitor production system

Acceptance: System stable

Test: Monitoring active

---

**Step 482: Bug Fixes and Patches**

Action: Fix any production issues

Acceptance: Issues resolved

Test: Bugs fixed

---

**Step 483: Performance Tuning**

Action: Tune performance based on production data

Acceptance: Performance optimized

Test: Performance improved

---

**Step 484: User Feedback Integration**

Action: Integrate user feedback

Acceptance: Feedback integrated

Test: Improvements made

---

**Step 485: Feature Enhancements**

Action: Add requested enhancements

Acceptance: Enhancements added

Test: Features improved

---

**Step 486: Continuous Integration Setup**

File: CI/CD configuration

Content: Set up CI/CD pipeline

Acceptance: CI/CD works

Test: Pipeline runs

---

**Step 487: Automated Testing Pipeline**

File: Test pipeline

Content: Automated test execution

Acceptance: Tests automated

Test: Pipeline works

---

**Step 488: Automated Deployment Pipeline**

File: Deployment pipeline

Content: Automated deployment

Acceptance: Deployment automated

Test: Pipeline works

---

**Step 489: Monitoring and Alerting Setup**

File: Monitoring configuration

Content: Set up monitoring and alerts

Acceptance: Monitoring works

Test: Alerts configured

---

**Step 490: Backup and Recovery Setup**

File: Backup configuration

Content: Set up automated backups

Acceptance: Backups work

Test: Backup tested

---

**Step 491: Scaling Preparation**

File: Scaling configuration

Content: Prepare for scaling

Acceptance: Ready to scale

Test: Scaling tested

---

**Step 492: Cost Optimization**

Action: Optimize costs

Acceptance: Costs optimized

Test: Cost analysis

---

**Step 493: Final Documentation Update**

Action: Update all documentation

Acceptance: Documentation current

Test: Documentation review

---

**Step 494: Training Materials**

File: Training materials

Content: Create training materials

Acceptance: Materials created

Test: Materials complete

---

**Step 495: Launch Preparation**

Action: Prepare for launch

Acceptance: Ready to launch

Test: Launch checklist

---

**Step 496: Marketing Site Integration**

File: Marketing site

Content: Integrate with marketing site

Acceptance: Integration works

Test: Site integrated

---

**Step 497: Customer Support Setup**

File: Support system

Content: Set up customer support

Acceptance: Support ready

Test: Support works

---

**Step 498: Final Quality Assurance**

Action: Final QA testing

Acceptance: Quality meets standards

Test: QA completed

---

**Step 499: Production Launch**

Action: Launch to production

Acceptance: Successfully launched

Test: Launch successful

---

**Step 500: Post-Launch Support**

Action: Provide post-launch support

Acceptance: Support active

Test: Support working

---

## PHASE 12: SELF-HEALING AUTOMATION INFRASTRUCTURE (Steps 501-550)

### Self-Healing Pipeline System (Steps 501-520)

**Step 501: Create Failure Detection Service**

File: `/lib/automation/failure-detector.ts`

Content: Auto-detect failures in processing pipelines

Acceptance: Service works

Test: Failures detected

---

**Step 502: Create Retry System with Exponential Backoff**

File: `/lib/automation/retry-system.ts`

Content: Auto-retry failed operations with exponential backoff

Acceptance: System works

Test: Retries work

---

**Step 503: Create Fallback Mechanisms**

File: `/lib/automation/fallback.ts`

Content: Auto-fallback to alternative methods when primary fails

Acceptance: Mechanisms work

Test: Fallbacks work

---

**Step 504: Create Escalation Rules**

File: `/lib/automation/escalation.ts`

Content: Auto-escalate to manual review only when necessary

Acceptance: Rules work

Test: Escalation works

---

**Step 505: Create Self-Healing Service**

File: `/lib/automation/self-healing.ts`

Content: Orchestrate self-healing for all pipelines

Acceptance: Service works

Test: Self-healing works

---

**Step 506: Create Exception Queue**

File: `/supabase/migrations/058_create_exception_queue.sql`

Content: CREATE TABLE exception_queue for exceptions requiring attention

Acceptance: Table created

Test: Table exists

---

**Step 507: Create Exception Handler**

File: `/lib/automation/exception-handler.ts`

Content: Handle exceptions and route to appropriate resolution

Acceptance: Handler works

Test: Exceptions handled

---

**Step 508: Create Exception Resolution UI**

File: `/app/admin/exceptions/page.tsx`

Content: UI to view and resolve exceptions

Acceptance: UI works

Test: Can resolve exceptions

---

**Step 509: Create Exception Learning System**

File: `/lib/automation/exception-learning.ts`

Content: Learn from exception resolutions to prevent future exceptions

Acceptance: System works

Test: Learning works

---

**Step 510: Test Self-Healing Pipeline**

Action: Test complete self-healing flow

Acceptance: Self-healing works

Test: End-to-end test

---

### Comprehensive Cron Job System (Steps 511-540)

**Step 511: Create Cron Job Scheduler**

File: `/lib/automation/cron-scheduler.ts`

Content: Centralized cron job scheduler

Acceptance: Scheduler works

Test: Jobs scheduled

---

**Step 512: Create Daily Automation Jobs**

File: `/lib/automation/daily-jobs.ts`

Content: Daily jobs (reconcile, fetch emails, fetch invoices, process documents, match receipts, generate journal entries, post to ledger, validate data, detect duplicates, update forecasts)

Acceptance: Jobs work

Test: Daily jobs run

---

**Step 513: Create Weekly Automation Jobs**

File: `/lib/automation/weekly-jobs.ts`

Content: Weekly jobs (generate reports, send emails, retrain models, archive data)

Acceptance: Jobs work

Test: Weekly jobs run

---

**Step 514: Create Monthly Automation Jobs**

File: `/lib/automation/monthly-jobs.ts`

Content: Monthly jobs (month-end close, generate reports, send summaries, backup data)

Acceptance: Jobs work

Test: Monthly jobs run

---

**Step 515: Create Yearly Automation Jobs**

File: `/lib/automation/yearly-jobs.ts`

Content: Yearly jobs (year-end close, generate reports, generate audit package)

Acceptance: Jobs work

Test: Yearly jobs run

---

**Step 516: Create Job Monitoring Service**

File: `/lib/automation/job-monitor.ts`

Content: Monitor all cron jobs and alert on failures

Acceptance: Service works

Test: Jobs monitored

---

**Step 517: Create Job History**

File: `/supabase/migrations/059_create_job_history.sql`

Content: CREATE TABLE job_history for tracking job executions

Acceptance: Table created

Test: Table exists

---

**Step 518: Create Job Dashboard**

File: `/app/admin/automation/jobs/page.tsx`

Content: Dashboard showing all cron jobs and their status

Acceptance: Dashboard works

Test: Can view jobs

---

**Step 519: Create Job Configuration UI**

File: `/app/admin/automation/jobs/configure/page.tsx`

Content: UI to configure cron job schedules

Acceptance: UI works

Test: Can configure jobs

---

**Step 520: Test Cron Job System**

Action: Test all cron jobs

Acceptance: Cron jobs work

Test: End-to-end test

---

### Data Quality Validation (Steps 521-530)

**Step 521: Create Data Quality Validation Service**

File: `/lib/validation/data-quality.ts`

Content: Comprehensive data quality validation for all extracted data

Acceptance: Service works

Test: Validation works

---

**Step 522: Create Confidence Scoring System**

File: `/lib/validation/confidence-scoring.ts`

Content: Score confidence for all AI extractions

Acceptance: System works

Test: Confidence scored

---

**Step 523: Create Low-Confidence Flagging**

File: `/lib/validation/flagging.ts`

Content: Auto-flag low-confidence extractions for review

Acceptance: Flagging works

Test: Low-confidence flagged

---

**Step 524: Create Data Quality Dashboard**

File: `/app/admin/data-quality/page.tsx`

Content: Dashboard showing data quality metrics

Acceptance: Dashboard works

Test: Can view metrics

---

**Step 525: Create Validation Rules Engine**

File: `/lib/validation/rules-engine.ts`

Content: Configurable validation rules

Acceptance: Engine works

Test: Rules applied

---

**Step 526: Create Validation Rules UI**

File: `/app/admin/data-quality/rules/page.tsx`

Content: UI to configure validation rules

Acceptance: UI works

Test: Can configure rules

---

**Step 527: Create Data Quality Alerts**

File: `/lib/notifications/data-quality-alerts.ts`

Content: Alert on data quality issues

Acceptance: Alerts work

Test: Alerts sent

---

**Step 528: Create Auto-Correction Service**

File: `/lib/validation/auto-correction.ts`

Content: Auto-correct common data quality issues

Acceptance: Service works

Test: Corrections work

---

**Step 529: Create Data Quality Reports**

File: `/app/admin/data-quality/reports/page.tsx`

Content: Reports on data quality trends

Acceptance: Reports work

Test: Can view reports

---

**Step 530: Test Data Quality System**

Action: Test complete data quality validation flow

Acceptance: Data quality system works

Test: End-to-end test

---

### n8n Workflow Integration (Steps 531-540)

**Step 531: Create n8n Connector**

File: `/lib/integrations/n8n-connector.ts`

Content: Connect to n8n for workflow automation

Acceptance: Connector works

Test: Can connect to n8n

---

**Step 532: Create Pre-Built Workflow Templates**

File: `/lib/integrations/n8n-templates.ts`

Content: Pre-built workflow templates for common automations

Acceptance: Templates work

Test: Templates available

---

**Step 533: Create Workflow UI**

File: `/app/settings/integrations/n8n/page.tsx`

Content: UI to configure n8n workflows

Acceptance: UI works

Test: Can configure workflows

---

**Step 534: Create Workflow Execution Service**

File: `/lib/integrations/n8n-executor.ts`

Content: Execute n8n workflows from system

Acceptance: Service works

Test: Workflows executed

---

**Step 535: Test n8n Integration**

Action: Test n8n workflow integration

Acceptance: n8n integration works

Test: End-to-end test

---

**Step 536: Create Automation Configuration UI**

File: `/app/admin/automation/configure/page.tsx`

Content: UI to configure all automation settings

Acceptance: UI works

Test: Can configure automations

---

**Step 537: Create Automation Status Dashboard**

File: `/app/admin/automation/dashboard/page.tsx`

Content: Dashboard showing all automation statuses

Acceptance: Dashboard works

Test: Can view status

---

**Step 538: Create Automation Logs**

File: `/app/admin/automation/logs/page.tsx`

Content: UI to view automation logs

Acceptance: UI works

Test: Can view logs

---

**Step 539: Create Automation Analytics**

File: `/app/admin/automation/analytics/page.tsx`

Content: Analytics on automation performance

Acceptance: Analytics work

Test: Can view analytics

---

**Step 540: Test Complete Automation Infrastructure**

Action: Test all automation infrastructure

Acceptance: Automation infrastructure works

Test: End-to-end test

---

## SUMMARY

**Total Steps: 1500+**

**Critical Features Merged from Gap Analysis:**

### API Infrastructure & Documentation (Steps 50A-50AD)
- API Documentation (Swagger/OpenAPI) with interactive explorer
- API Versioning (`/api/v1/`, `/api/v2/`)
- Health Check & System Status endpoints
- Error Tracking (Sentry integration)
- Structured Logging
- API Keys Management (generate, revoke, rate limiting)
- Webhook System (registration, delivery, retry logic, signature verification)

### Security & Authentication Enhancements (Steps 20A-30M)
- Email Verification (verify on signup, resend)
- Password Reset Flow (forgot password, secure tokens)
- Two-Factor Authentication (2FA) with TOTP, SMS, backup codes
- Session Management (active sessions, revoke, timeout, remember me)
- Account Deletion & GDPR Compliance (data export, anonymization, right to be forgotten)

### Payment Processing (Steps 80AD-80AM)
- Stripe Integration (subscriptions, payment methods)
- Payment Method Management
- Subscription Checkout
- Stripe Webhook Handlers
- Invoice Generation & Sending
- Payment History

### Email & Notification System (Steps 80CB-80CS)
- Email Service Integration (SendGrid/Resend/SES)
- Email Queue System
- Email Delivery Tracking
- Bounce/Complaint Handling
- In-App Notifications (real-time notification center)
- Notification Preferences (user/business level, channels, quiet hours)
- Notification History

### Data Export/Import (Steps 271A-271L)
- Comprehensive Data Export (CSV, Excel, JSON)
- Scheduled Exports
- Export Templates
- Data Import from Other Systems
- Import Validation & Preview
- Import Mapping Tool
- Import History & Rollback
- Bulk Export for Compliance

### GDPR Compliance (Steps 90T-90AC)
- Account Deletion Request
- Data Export Before Deletion
- Data Anonymization Service
- Right to be Forgotten API
- Data Retention Policies
- Privacy Policy Page
- Cookie Consent

### Multi-Currency Support (Steps 90AD-90AM)
- Currency Management
- Exchange Rate Management
- Currency Conversion Service
- Multi-Currency Transactions
- Multi-Currency Reports
- Exchange Rate Provider Integration

### Tax Calculation & Compliance (Steps 90AN-90AW)
- Tax Rates Configuration
- Tax Calculation Engine
- Tax on Transactions
- Tax Reports
- Tax Form Generation (1099, etc.)
- Tax Compliance Tracking
- Tax Year Configuration

**Original Features:**
- **API Infrastructure (Steps 50A-50AD)**: API documentation (Swagger/OpenAPI), versioning, health checks, API keys, webhook system
- **Security Enhancements (Steps 20A-30M)**: Email verification, password reset, two-factor authentication (2FA), session management
- **Payment Processing (Steps 80AD-80AM)**: Stripe integration, payment methods, checkout, invoices, webhooks
- **Email & Notifications (Steps 80CB-80CS)**: Email service integration, email queue, in-app notifications, notification preferences
- **Data Export/Import (Steps 271A-271L)**: Comprehensive data export, import from other systems, scheduled exports, compliance exports
- **GDPR Compliance (Steps 90T-90AC)**: Account deletion, data anonymization, right to be forgotten, data retention policies, cookie consent
- **Multi-Currency Support (Steps 90AD-90AM)**: Currency management, exchange rates, currency conversion, multi-currency reports
- **Tax Calculation (Steps 90AN-90AW)**: Tax rates, tax calculation, tax reports, tax form generation (1099, etc.)

**Original Features:**
- **Direct Bank Integration (Steps 257A-257O)**: Connect bank accounts using Plaid, auto-sync transactions, manual sync option
- **ERP/Accounting Software Integration (Steps 257P-257AC)**: QuickBooks, Xero integrations with recommendations for small/medium companies
- **Enhanced Predictive Analytics (Steps 283-298)**: Comprehensive forecasting with multiple model types (LSTM, Prophet, GBM, Ensemble)
- **AI Recommendations & Insights (Steps 299-325)**: Cost optimization, waste detection, ROI analysis
- **Budgeting & Smart Alerts (Steps 326-350)**: Auto-budget creation, real-time tracking, smart alerts
- **Enhanced Fraud & Anomaly Detection (Steps 289-299)**: Isolation Forest, pattern detection, risk scoring, investigation tools
- **Enhanced AI Chat Assistant (Steps 286-298)**: Plan-based token control, financial queries, chart generation, query suggestions
- **Multi-User Access & Permissions (Steps 90A-90S)**: Full RBAC system with Owner, Accountant, Auditor, Employee roles
- **Comprehensive Dashboards & Visualizations (Steps 351-400)**: Real-time cashflow graphs, spending heatmap, category breakdown, P&L, forecasts, vendor ranking, waste reports, inventory/COGS
- **Comprehensive Admin Dashboard (Steps 80A-80CZ)**: Complete production-ready admin dashboard allowing control of ALL system settings without code changes:
  - System Settings (feature toggles, model settings, token costs, retry limits, env/config)
  - Token & Subscription Control (edit token allocations, token costs, view/reset usage, manage plans)
  - User & Business Management (view users, promote/demote admin, suspend users, manage businesses)
  - Transactions & Categorization (global category editor, auto-categorization rules, force recategorization)
  - Document Pipeline (view documents, retry failed jobs, configure OCR/QR/Barcode rules)
  - AI Forecasting & Insights Configuration (configure models, set thresholds)
  - Notifications Management (edit email/Slack templates, enable/disable alerts)
  - Analytics & Logs (system metrics, token usage stats, pipeline performance, audit logs)

**Platform Support:**
- ✅ Web App (Next.js) - Responsive, works on all devices
- ✅ Android App (React Native)
- ✅ iPhone App (React Native)
- ✅ Shared API Backend (works for web and mobile)
- ✅ PWA Support (installable web app)

**Key Features:**
- Token-based subscription system (built early - Steps 51-80)
- **Comprehensive Admin Dashboard (Steps 80A-80CZ)** - Control ALL system settings without code changes (token allocations, feature toggles, model settings, user management, etc.)
- All features integrate tokens from the start
- Free Trial with 1,000 tokens (14 days)
- Multi-input methods (File, QR, Barcode, Camera, Manual)
- **Direct bank integration (Plaid) - Steps 257A-257O** - Connect bank accounts and auto-sync transactions
- **ERP/Accounting Software Integration (Steps 257P-257AC)** - QuickBooks, Xero integrations with recommendations for small/medium companies
- Retry logic (3 attempts) with manual fallback
- Double-entry bookkeeping
- Financial reports (P&L, Balance Sheet, Cash Flow)
- Bank reconciliation (with direct bank sync and CSV import)
- **Enhanced Predictive Analytics (Steps 283-298)**:
  - Cash flow forecast (daily, weekly, monthly)
  - Expense forecast by category
  - Revenue projection with seasonality
  - Risk flags (cash shortage detection)
  - Supplier cost prediction
  - LSTM/GRU, Prophet, GBM, Ensemble models
- **AI Recommendations & Insights (Steps 299-325)**:
  - Cost optimization insights (overspending detection, supplier comparison)
  - Waste detection (duplicate payments, unused subscriptions, rarely used items)
  - ROI insights (marketing ROI, expense value analysis)
- **Budgeting & Smart Alerts (Steps 326-350)**:
  - Auto-budget creation from historical data
  - Real-time budget vs actual tracking
  - Budget alerts (50%, 75%, 90%, 100% thresholds)
  - Budget forecasting
  - Budget recommendations
- **Enhanced Fraud & Anomaly Detection (Steps 289-299)**:
  - Isolation Forest anomaly detection
  - Fraud pattern detection
  - Risk scoring (0-100 scale)
  - Fraud alerts and notifications
  - Fraud investigation tools
  - Whitelist/blacklist management
- **Enhanced AI Chat Assistant (NLP) (Steps 286-298)**:
  - Plan-based token control (token costs vary by subscription plan)
  - Financial query intent classification
  - Natural language to database query generation
  - Chart generation from queries
  - Query suggestions and examples
  - Financial health summaries
  - Supports queries like: "Why did expenses increase?", "Show cashflow risks", "Top wasteful expenses", "Forecast revenue", "Financial health summary"
- **Multi-User Access & Permissions (RBAC) (Steps 90A-90S)**:
  - Role-based access control (Owner, Accountant, Auditor, Employee)
  - Permission system (view, create, edit, delete)
  - User management and invitations
  - Role-based UI rendering
  - Permission checks on all API routes
  - Role-based dashboards
- **Comprehensive Dashboards & Visualizations (Steps 351-400)**:
  - Real-time cashflow graphs (daily, weekly, monthly)
  - Spending heatmap (calendar-style intensity map)
  - Expense category breakdown (pie charts, bar charts, tables)
  - Profit vs Loss visualization (line charts, comparisons, forecast overlay)
  - Forecast curves (with confidence intervals, multiple scenarios)
  - Vendor ranking (charts and tables)
  - Waste detection report (with charts and actions)
  - Inventory + COGS Intelligence (inventory tracking, COGS calculation, forecasting)
  - Dashboard customization
  - Real-time updates
  - Dashboard export (PDF/image)
- AI features (Categorization)
- Mobile apps with offline mode
- Responsive web design
- Security and compliance features
- Performance optimization
- Comprehensive testing

**Follow steps 1-550+ in exact order. Test after each step. Commit frequently.**

**ALL AUTOMATION FEATURES SUCCESSFULLY MERGED WITH PROPER STEP ORDERING:**

✅ **24 Major Automation Feature Sets Added:**
1. Email Ingestion Pipeline (Steps 180A-180O)
2. Auto Journal Entry Generation (Steps 150A-150J)
3. Auto-Ledger Posting (Steps 150K-150T)
4. Receipt-to-Transaction Matching (Steps 270K-270T)
5. Supplier Portal Scraping (Steps 257AD-257AU)
6. Automated Month-End Close (Steps 271M-271Z)
7. Zero-Touch Approval Workflow (Steps 144A-144J)
8. Continuous Learning System (Steps 298A-298J)
9. Self-Healing Pipeline (Steps 501-510)
10. Comprehensive Cron Job System (Steps 511-520)
11. Data Quality Validation (Steps 521-530)
12. n8n Workflow Integration (Steps 531-540)
13. Manual Entry Auto-Learning (Steps 222A-222J)
14. Auto-Fetching Bank Statements (Steps 257IA-257IJ)
15. Autonomous Document Processing Pipeline (Steps 180P-180Z)
16. Advanced Vendor/Entity Detection (Steps 214A-214J)
17. Advanced Auto-Categorization Enhancement (Steps 282A-282J)
18. Credit Card Auto-Import (Steps 257OA-257OJ)
19. PayPal/Stripe/Square Integration (Steps 257OK-257OT)
20. Automated Bank Reconciliation Enhancement (Steps 270A-270J)
21. Double-Entry Consistency Checks (Steps 150TA-150TJ)
22. Exception Handling System (Steps 80DA-80DJ)
23. Automation Configuration UI (Steps 80DK-80DT)
24. ML Model Management UI (Steps 80DU-80DZ)

**Total Automation Steps Added:** 200+  
**All steps are properly numbered and ordered for sequential development.**

**ADDITIONAL AUTOMATION FEATURES ADDED:**
- **Manual Entry Auto-Learning (Steps 222A-222J)**: Pattern learning, recurring detection, suggestion improvement
- **Auto-Fetching Bank Statements (Steps 257IA-257IJ)**: Auto-fetch statements, parsing, reconciliation
- **Autonomous Document Processing Pipeline (Steps 180P-180Z)**: Fully automated processing chain, retry logic, fallback
- **Advanced Vendor/Entity Detection (Steps 214A-214J)**: ML-powered vendor recognition, entity extraction, auto-create/update
- **Advanced Auto-Categorization Enhancement (Steps 282A-282J)**: Deep learning model, embeddings, similarity matching, A/B testing
- **Credit Card Auto-Import (Steps 257OA-257OJ)**: Credit card connector, transaction fetcher, reconciliation
- **PayPal/Stripe/Square Integration (Steps 257OK-257OT)**: Payment processor connectors, transaction fetching, statement import
- **Automated Bank Reconciliation Enhancement (Steps 272A-272J)**: Daily auto-reconciliation, auto-matching, exception handling
- **Double-Entry Consistency Checks (Steps 150TA-150TJ)**: Balance verification, imbalance detection, auto-correction
- **Exception Handling System (Steps 80DA-80DJ)**: Exception queue, resolution, learning, analytics
- **Automation Configuration UI (Steps 80DK-80DT)**: Configure all automations, job scheduler, rules, status dashboard
- **ML Model Management UI (Steps 80DU-80DZ)**: Model performance, retraining, A/B testing, deployment

**CRITICAL AUTOMATION FEATURES ADDED (Merged from Automation Gap Analysis):**
- **Email Ingestion Pipeline (Steps 180A-180O)**: Auto-fetch emails, extract attachments, process documents, auto-create transactions
- **Auto Journal Entry Generation (Steps 150A-150J)**: Auto-generate journal entries from transactions, accruals, adjustments
- **Auto-Ledger Posting (Steps 150K-150T)**: Auto-post to General Ledger, update balances, manage sub-ledgers
- **Receipt-to-Transaction Matching (Steps 270A-270J)**: ML-powered receipt matching, duplicate detection
- **Supplier Portal Scraping (Steps 257AD-257AU)**: Auto-fetch invoices from supplier portals, web scraping, API integration
- **Automated Month-End Close (Steps 271M-271Z)**: Auto-trigger month-end close, generate closing entries, reports, year-end close, audit package
- **Zero-Touch Approval Workflow (Steps 144A-144J)**: Auto-approve within thresholds, approval queue, rules engine
- **Continuous Learning System (Steps 298A-298J)**: Learn from corrections, auto-retrain models, pattern detection
- **Self-Healing Pipeline (Steps 501-510)**: Auto-detect failures, retry with backoff, fallback mechanisms, escalation
- **Comprehensive Cron Job System (Steps 511-520)**: Daily/weekly/monthly/yearly automation jobs
- **Data Quality Validation (Steps 521-530)**: Comprehensive validation, confidence scoring, auto-flagging, auto-correction
- **n8n Workflow Integration (Steps 531-540)**: Connect to n8n, pre-built workflows, custom workflows

**Each step maintains the same structure:**
- Step number
- File path
- Content description
- Acceptance criteria
- Test instructions

**This plan is optimized for Cursor AI development - each step is small, focused, and self-contained.**

### Finance Intelligence Module (Expanded) (Steps 330A-330Z)

**Step 330A: Define Accounts Receivable (AR) Automation Schema**  
File: `/supabase/migrations/062_create_accounts_receivable.sql`  
Content: Tables for invoices, invoice_lines, dunning_schedule, customer_portal_tokens with statuses + business/user foreign keys  
Acceptance: Migration runs and tables appear in Supabase  
Test: Supabase dashboard shows all AR tables

**Step 330B: Build AR Automation Service**  
File: `/lib/ar/automation-service.ts`  
Content: Generate invoices from approved sales entries or API, attach documents, push to customer portal (2 tokens per invoice)  
Acceptance: Service creates invoice + line items  
Test: Unit test auto-invoice generation

**Step 330C: Customer Payment Portal**  
File: `/app/portal/invoices/[token]/page.tsx`  
Content: Secure portal (signed token + optional PIN) to view invoices, pay via Stripe/ACH, download receipts  
Acceptance: Customer can open portal and submit test payment  
Test: Use sample token link and complete Stripe test checkout

**Step 330D: Smart Dunning & Reminder Engine**  
File: `/lib/ar/dunning-engine.ts`  
Content: Rule + ML driven reminder schedules (tone, cadence) with email/SMS templates (3 tokens per reminder run)  
Acceptance: Overdue invoices enqueue reminders automatically  
Test: Mark invoice overdue and verify reminder queue item

**Step 330E: Cash Application & Auto-Matching**  
File: `/lib/ar/cash-application.ts`  
Content: Match incoming payments from bank feeds to invoices with confidence scoring + manual review queue  
Acceptance: Payments auto-apply when confidence > threshold  
Test: Import payment and confirm invoice closed

**Step 330F: AR Intelligence Dashboard**  
File: `/app/analytics/ar-intelligence/page.tsx`  
Content: KPIs (DSO, aging, forecasted receipts) + collection risk flags and what-if simulation  
Acceptance: Dashboard renders KPIs with filters  
Test: Load dashboard and change filters

**Step 330G: Define Accounts Payable (AP) Automation Schema**  
File: `/supabase/migrations/063_create_accounts_payable.sql`  
Content: Tables for bills, bill_lines, approval_routes, payment_batches, vendor_terms, early-pay_discounts  
Acceptance: Migration succeeds  
Test: Tables visible in Supabase

**Step 330H: AP Invoice Intake & Coding**  
File: `/lib/ap/intake-service.ts`  
Content: Convert OCR/email documents into bills, auto-code GL accounts, detect duplicates (5 tokens per bill)  
Acceptance: Uploaded invoice creates draft bill with coding  
Test: Upload sample invoice and inspect resulting bill

**Step 330I: AP Approval Workflow Builder**  
File: `/app/settings/ap/approvals/page.tsx`  
Content: Drag-and-drop approval routing per amount/vendor/department with escalation timers  
Acceptance: Users can define/activate approval chains  
Test: Create rule and verify it applies to new bill

**Step 330J: Smart Payment Scheduling**  
File: `/lib/ap/payment-scheduler.ts`  
Content: Optimize payment runs vs discount windows & cash runway, integrate with Stripe/ACH providers  
Acceptance: Scheduler produces recommended payment batch  
Test: Run scheduler and review batch output

**Step 330K: AP Cash Requirement Forecasting**  
File: `/app/analytics/ap-forecast/page.tsx`  
Content: Rolling 13-week cash requirement combining due bills + predicted spend  
Acceptance: Chart/table render with filters  
Test: Navigate to page and adjust horizon

**Step 330L: Industry Module Framework**  
File: `/lib/industry/industry-engine.ts`  
Content: Pluggable config for sector rules (warehouse, logistics, supermarket) with feature flags + token multipliers  
Acceptance: Engine loads configs and exposes helpers  
Test: Unit test toggling industries

**Step 330M: Warehouse & Inventory Intelligence Module**  
File: `/app/industry/warehouse/page.tsx`  
Content: KPIs (inventory turns, shrinkage, fulfillment costs) + auto-journals for stock moves  
Acceptance: Module renders when business selects warehouse preset  
Test: Toggle warehouse mode and verify widgets

**Step 330N: Logistics Module**  
File: `/app/industry/logistics/page.tsx`  
Content: Mileage-based expense rules, carrier settlement imports, lane profitability charts  
Acceptance: Logistics KPIs visible with drill-down  
Test: Enable logistics preset and view module

**Step 330O: Supermarket/Retail Module**  
File: `/app/industry/supermarket/page.tsx`  
Content: Department-level margin tracking, spoilage detection, vendor rebate automation  
Acceptance: Retail KPIs render  
Test: Switch to retail preset and inspect dashboards

**Step 330P: Marketplace Architecture Definition**  
File: `/supabase/migrations/064_create_marketplace_tables.sql`  
Content: Tables for marketplace_apps, app_versions, app_subscriptions, revenue_share, scopes  
Acceptance: Migration runs successfully  
Test: Tables exist in Supabase

**Step 330Q: Marketplace Vendor Onboarding Workflow**  
File: `/app/admin/marketplace/vendors/page.tsx`  
Content: Approve partner apps, manage scopes, API keys, listing metadata  
Acceptance: Admin can approve or reject vendor submissions  
Test: Create mock vendor and walk through approval

**Step 330R: Marketplace Billing & Token Mapping**  
File: `/lib/marketplace/billing.ts`  
Content: Share tokens/revenue with partners, compute charges, surface analytics in admin dashboard  
Acceptance: Revenue splits calculated and logged  
Test: Unit test billing distribution

**Step 330S: Financial Health Score Engine**  
File: `/lib/analytics/financial-health-score.ts`  
Content: Composite score (0-100) using liquidity, profitability, burn, DSO/DPO, forecast risk, alert thresholds  
Acceptance: Score computation deterministic for inputs  
Test: Unit tests for various scenarios

**Step 330T: Financial Health Score UI & Alerts**  
File: `/app/analytics/health-score/page.tsx`  
Content: Gauge + trend chart, driver explanations, plan-based token cost (5 tokens per recalculation)  
Acceptance: UI displays score and drivers; alerts trigger when score dips  
Test: Load page and simulate driver change

**Step 330U: AI Explanation Service**  
File: `/lib/ai/explanations.ts`  
Content: SHAP/LIME-style explanation for categorization/reconciliation decisions with audit log entries  
Acceptance: API returns human-readable explanation + factors  
Test: Call service for sample transaction

**Step 330V: Transparent Explanation UI**  
File: `/components/ai/ExplanationDrawer.tsx`  
Content: Drawer showing “Why this category?” with factors, overrides, manual feedback option  
Acceptance: Drawer opens from transactions list/detail  
Test: Click “Explain” and view content

**Step 330W: Real-Time Proactive Insights Engine**  
File: `/lib/insights/proactive-engine.ts`  
Content: Stream processing (Supabase Realtime/BullMQ) to push alerts on anomalies, cash crunch, KPI breaches  
Acceptance: Engine emits insight within <1 minute of triggering event  
Test: Trigger sample anomaly and confirm notification

**Step 330X: Executive Command Center**  
File: `/app/executive/command-center/page.tsx`  
Content: Combined P&L, cash runway, trends, “What changed?” digest, benchmark vs industry, interactive scenarios  
Acceptance: Exec role loads dashboard with drill-downs  
Test: Log in as owner role and view command center

**Step 330Y: Competitive Concierge & Digest Features**  
File: `/lib/insights/executive-digest.ts`  
Content: Weekly autopilot email/slack summary (Bookeeping.ai/Zeni parity) + optional human-review queue  
Acceptance: Digest generated and queued for delivery  
Test: Run job and inspect email preview

**Step 330Z: Finance Intelligence Regression Suite**  
File: `/tests/finance-intelligence/finance-intelligence.spec.ts`  
Content: Integration tests covering AR/AP automation, industry modules, health score, proactive insights  
Acceptance: Test suite passes in CI  
Test: `npm run test -- finance-intelligence`
