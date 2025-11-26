-- Quick Notes Feature - Autonomous Test Implementation
-- Tests full Cursor AI autonomy: Database, API, Frontend, Git

-- =============================================================================
-- CREATE QUICK_NOTES TABLE
-- =============================================================================

CREATE TABLE IF NOT EXISTS public.quick_notes (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    title text NOT NULL,
    description text,
    content text,
    status text DEFAULT 'pending' CHECK (status IN ('pending', 'active', 'completed')),
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    tags text[] DEFAULT '{}',
    is_pinned boolean DEFAULT false,
    created_at timestamptz DEFAULT now(),
    updated_at timestamptz DEFAULT now()
);

-- =============================================================================
-- CREATE INDEXES
-- =============================================================================

CREATE INDEX idx_quick_notes_user_id ON public.quick_notes(user_id);
CREATE INDEX idx_quick_notes_status ON public.quick_notes(status);
CREATE INDEX idx_quick_notes_created_at ON public.quick_notes(created_at DESC);
CREATE INDEX idx_quick_notes_tags ON public.quick_notes USING GIN(tags);

-- =============================================================================
-- ENABLE ROW LEVEL SECURITY
-- =============================================================================

ALTER TABLE public.quick_notes ENABLE ROW LEVEL SECURITY;

-- =============================================================================
-- CREATE RLS POLICIES
-- =============================================================================

-- Users can only read their own notes
CREATE POLICY "Users can read their own notes"
ON public.quick_notes FOR SELECT
USING (auth.uid() = user_id);

-- Users can insert their own notes
CREATE POLICY "Users can insert their own notes"
ON public.quick_notes FOR INSERT
WITH CHECK (auth.uid() = user_id);

-- Users can update their own notes
CREATE POLICY "Users can update their own notes"
ON public.quick_notes FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

-- Users can delete their own notes
CREATE POLICY "Users can delete their own notes"
ON public.quick_notes FOR DELETE
USING (auth.uid() = user_id);

-- =============================================================================
-- CREATE DATABASE FUNCTION
-- =============================================================================

CREATE OR REPLACE FUNCTION public.get_user_notes_count()
RETURNS integer
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
    SELECT COUNT(*)::integer
    FROM public.quick_notes
    WHERE user_id = auth.uid();
$$;

CREATE OR REPLACE FUNCTION public.get_user_notes_by_status(note_status text)
RETURNS SETOF public.quick_notes
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
    SELECT *
    FROM public.quick_notes
    WHERE user_id = auth.uid() AND status = note_status
    ORDER BY created_at DESC;
$$;

-- =============================================================================
-- CREATE TRIGGER FOR UPDATED_AT
-- =============================================================================

CREATE OR REPLACE FUNCTION public.handle_quick_notes_updated_at()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;

CREATE TRIGGER set_quick_notes_updated_at
BEFORE UPDATE ON public.quick_notes
FOR EACH ROW
EXECUTE FUNCTION public.handle_quick_notes_updated_at();

-- =============================================================================
-- COMMENTS
-- =============================================================================

COMMENT ON TABLE public.quick_notes IS 'Quick notes feature - tests full Cursor AI autonomy';
COMMENT ON COLUMN public.quick_notes.status IS 'Note status: pending, active, or completed';
COMMENT ON FUNCTION public.get_user_notes_count IS 'Returns count of notes for current user';
COMMENT ON FUNCTION public.get_user_notes_by_status IS 'Returns notes filtered by status for current user';

-- =============================================================================
-- ROLLBACK
-- =============================================================================
-- DROP TRIGGER IF EXISTS set_quick_notes_updated_at ON public.quick_notes;
-- DROP FUNCTION IF EXISTS public.handle_quick_notes_updated_at();
-- DROP FUNCTION IF EXISTS public.get_user_notes_by_status(text);
-- DROP FUNCTION IF EXISTS public.get_user_notes_count();
-- DROP TABLE IF EXISTS public.quick_notes CASCADE;

