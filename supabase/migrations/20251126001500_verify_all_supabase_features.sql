-- Comprehensive test of autonomous Supabase deployment
-- Tests: Tables, RLS, Functions, Triggers, Indexes

-- =============================================================================
-- 1. CREATE TABLE
-- =============================================================================

CREATE TABLE IF NOT EXISTS public.supabase_autonomous_verification (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    feature_tested text NOT NULL,
    test_passed boolean DEFAULT true,
    test_details jsonb,
    tested_at timestamptz DEFAULT now(),
    deployed_by text DEFAULT 'Cursor AI Autonomous System'
);

-- =============================================================================
-- 2. ADD RLS (Row Level Security)
-- =============================================================================

ALTER TABLE public.supabase_autonomous_verification ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read access" 
ON public.supabase_autonomous_verification 
FOR SELECT 
USING (true);

CREATE POLICY "Authenticated insert access"
ON public.supabase_autonomous_verification
FOR INSERT
WITH CHECK (auth.role() = 'authenticated');

-- =============================================================================
-- 3. CREATE FUNCTION
-- =============================================================================

CREATE OR REPLACE FUNCTION public.test_autonomous_function()
RETURNS text
LANGUAGE sql
STABLE
AS $$
    SELECT 'Autonomous Supabase deployment verified at ' || now()::text;
$$;

COMMENT ON FUNCTION public.test_autonomous_function IS 'Test function for autonomous deployment verification';

-- =============================================================================
-- 4. CREATE TRIGGER FUNCTION
-- =============================================================================

CREATE OR REPLACE FUNCTION public.log_verification()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    NEW.tested_at = now();
    RAISE NOTICE 'Verification logged: %', NEW.feature_tested;
    RETURN NEW;
END;
$$;

-- =============================================================================
-- 5. CREATE TRIGGER
-- =============================================================================

CREATE TRIGGER set_verification_timestamp
BEFORE INSERT ON public.supabase_autonomous_verification
FOR EACH ROW
EXECUTE FUNCTION public.log_verification();

-- =============================================================================
-- 6. CREATE INDEXES
-- =============================================================================

CREATE INDEX idx_verification_tested_at ON public.supabase_autonomous_verification(tested_at);
CREATE INDEX idx_verification_feature ON public.supabase_autonomous_verification(feature_tested);

-- =============================================================================
-- 7. ADD COMMENTS (Documentation)
-- =============================================================================

COMMENT ON TABLE public.supabase_autonomous_verification IS 'Verifies: tables, RLS, functions, triggers, indexes all deploy autonomously via Cursor AI + GitHub Actions';
COMMENT ON COLUMN public.supabase_autonomous_verification.feature_tested IS 'Name of the Supabase feature being tested';
COMMENT ON COLUMN public.supabase_autonomous_verification.test_passed IS 'Whether the test passed';

-- =============================================================================
-- ROLLBACK INSTRUCTIONS
-- =============================================================================

-- To rollback this migration, run:
-- DROP TRIGGER IF EXISTS set_verification_timestamp ON public.supabase_autonomous_verification;
-- DROP FUNCTION IF EXISTS public.log_verification();
-- DROP FUNCTION IF EXISTS public.test_autonomous_function();
-- DROP TABLE IF EXISTS public.supabase_autonomous_verification CASCADE;

