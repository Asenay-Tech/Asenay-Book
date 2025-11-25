-- Test migration created by Cursor AI
-- This verifies autonomous schema control

CREATE TABLE IF NOT EXISTS public.cursor_control_test (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    test_name text NOT NULL,
    test_value text,
    created_at timestamptz DEFAULT now()
);

-- Add RLS
ALTER TABLE public.cursor_control_test ENABLE ROW LEVEL SECURITY;

-- Allow read access for all
CREATE POLICY "Allow read access" ON public.cursor_control_test
FOR SELECT USING (true);

-- Comment for documentation
COMMENT ON TABLE public.cursor_control_test IS 'Test table to verify Cursor AI autonomous control';

-- Rollback: DROP TABLE IF EXISTS public.cursor_control_test;

