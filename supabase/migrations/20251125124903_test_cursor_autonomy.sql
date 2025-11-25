-- Test Migration: Cursor AI Autonomy Verification
-- This migration tests all DDL capabilities

-- 1. Create test table with various column types
CREATE TABLE IF NOT EXISTS public.cursor_test_table (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    amount DECIMAL(10,2) DEFAULT 0.00,
    is_active BOOLEAN DEFAULT true,
    metadata JSONB DEFAULT '{}',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Add comment for documentation
COMMENT ON TABLE public.cursor_test_table IS 'Test table created by Cursor AI to verify autonomous capabilities';

-- 3. Create index
CREATE INDEX IF NOT EXISTS idx_cursor_test_name ON public.cursor_test_table(name);
CREATE INDEX IF NOT EXISTS idx_cursor_test_email ON public.cursor_test_table(email);

-- 4. Create a trigger function for updated_at
CREATE OR REPLACE FUNCTION public.handle_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 5. Create trigger
DROP TRIGGER IF EXISTS set_updated_at ON public.cursor_test_table;
CREATE TRIGGER set_updated_at
    BEFORE UPDATE ON public.cursor_test_table
    FOR EACH ROW
    EXECUTE FUNCTION public.handle_updated_at();

-- 6. Enable RLS
ALTER TABLE public.cursor_test_table ENABLE ROW LEVEL SECURITY;

-- 7. Create RLS policies
CREATE POLICY "Enable read access for all users" ON public.cursor_test_table
    FOR SELECT USING (true);

CREATE POLICY "Enable insert for authenticated users" ON public.cursor_test_table
    FOR INSERT WITH CHECK (true);

CREATE POLICY "Enable update for authenticated users" ON public.cursor_test_table
    FOR UPDATE USING (true);

