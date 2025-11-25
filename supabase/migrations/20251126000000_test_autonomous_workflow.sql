-- Test: Verify 100% autonomous deployment works
-- This migration tests the complete autonomous workflow

CREATE TABLE IF NOT EXISTS public.autonomous_test (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    test_name text DEFAULT 'Autonomous workflow test',
    deployed_at timestamptz DEFAULT now(),
    deployed_by text DEFAULT 'Cursor AI',
    workflow_version text DEFAULT 'v1.0'
);

-- Add RLS for security
ALTER TABLE public.autonomous_test ENABLE ROW LEVEL SECURITY;

-- Allow read access for all authenticated users
CREATE POLICY "Allow read access for authenticated users" 
ON public.autonomous_test FOR SELECT 
USING (auth.role() = 'authenticated');

-- Create index
CREATE INDEX idx_autonomous_test_deployed_at ON public.autonomous_test(deployed_at);

-- Add comment
COMMENT ON TABLE public.autonomous_test IS 'Created to verify autonomous deployment works - Cursor AI test';

-- Rollback: DROP TABLE IF EXISTS public.autonomous_test CASCADE;

