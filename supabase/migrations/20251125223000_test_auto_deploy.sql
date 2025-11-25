-- Test auto-deployment via GitHub Actions
-- This migration verifies that pushing to main triggers automatic deployment

CREATE TABLE IF NOT EXISTS public.auto_deploy_test (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    test_message text DEFAULT 'Auto-deployment working!',
    deployed_at timestamptz DEFAULT now()
);

COMMENT ON TABLE public.auto_deploy_test IS 'Test table to verify GitHub Actions auto-deployment';

-- This should be deployed automatically when pushed to GitHub main branch

