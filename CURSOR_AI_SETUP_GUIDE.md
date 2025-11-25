# Asenay-Book Setup Guide

## Prerequisites

Before starting, ensure you have:
- Node.js 18+ installed
- npm or yarn package manager
- Git installed
- A Supabase account (free tier works)
- VS Code or Cursor IDE

## Step 1: Initialize Next.js Project

```bash
npx create-next-app@latest . --typescript --tailwind --app --no-src-dir --import-alias "@/*"
```

When prompted:
- ✅ TypeScript: Yes
- ✅ ESLint: Yes
- ✅ Tailwind CSS: Yes
- ✅ `src/` directory: No
- ✅ App Router: Yes
- ✅ Import alias: `@/*`

## Step 2: Install Core Dependencies

```bash
npm install @supabase/supabase-js @supabase/ssr
npm install @supabase/auth-helpers-nextjs
npm install zod react-hook-form @hookform/resolvers
npm install date-fns
npm install lucide-react
```

## Step 3: Set Up Supabase

1. Go to [supabase.com](https://supabase.com) and create a new project
2. Get your project URL and anon key from Settings > API
3. Create `.env.local` file:

```env
NEXT_PUBLIC_SUPABASE_URL=your-project-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

## Step 4: Project Structure

```
/
├── app/                    # Next.js App Router
│   ├── (auth)/            # Auth routes (login, signup)
│   ├── (dashboard)/       # Protected dashboard routes
│   ├── api/               # API routes
│   └── layout.tsx         # Root layout
├── components/            # React components
│   ├── ui/               # Reusable UI components
│   └── features/         # Feature-specific components
├── lib/                   # Utilities and helpers
│   ├── supabase/         # Supabase client setup
│   └── utils.ts          # Utility functions
├── types/                 # TypeScript types
└── public/               # Static assets
```

## Step 5: Create Supabase Client

Create `lib/supabase/client.ts` and `lib/supabase/server.ts` for client and server-side Supabase clients.

## Next Steps

Follow the REORGANIZED_PLAN.md starting with Phase 1, Steps 1-50.
