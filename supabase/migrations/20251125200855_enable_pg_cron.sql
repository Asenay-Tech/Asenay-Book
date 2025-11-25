-- Enable pg_cron Extension for Scheduled Jobs
-- This extension allows running scheduled tasks directly in PostgreSQL

-- =============================================================================
-- ENABLE PG_CRON EXTENSION
-- =============================================================================

-- Enable pg_cron extension (requires superuser privileges on Supabase)
CREATE EXTENSION IF NOT EXISTS pg_cron WITH SCHEMA extensions;

-- =============================================================================
-- GRANT PERMISSIONS
-- =============================================================================

-- Grant usage on cron schema to postgres role
GRANT USAGE ON SCHEMA cron TO postgres;

-- Grant all privileges on cron tables
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA cron TO postgres;

-- =============================================================================
-- EXAMPLE CRON JOBS (commented out - uncomment when needed)
-- =============================================================================

-- Daily cleanup at midnight UTC
-- SELECT cron.schedule('daily-cleanup', '0 0 * * *', $$
--   DELETE FROM public.sessions WHERE expires_at < NOW();
-- $$);

-- Hourly token usage calculation
-- SELECT cron.schedule('hourly-token-calc', '0 * * * *', $$
--   SELECT calculate_hourly_token_usage();
-- $$);

-- Weekly report generation (Sundays at 6 AM UTC)
-- SELECT cron.schedule('weekly-reports', '0 6 * * 0', $$
--   SELECT generate_weekly_reports();
-- $$);

-- Monthly subscription check (1st of each month)
-- SELECT cron.schedule('monthly-subscription-check', '0 0 1 * *', $$
--   SELECT check_subscription_status();
-- $$);

-- =============================================================================
-- HELPER FUNCTION: List all scheduled jobs
-- =============================================================================

CREATE OR REPLACE FUNCTION public.list_cron_jobs()
RETURNS TABLE (
    jobid bigint,
    schedule text,
    command text,
    nodename text,
    nodeport integer,
    database text,
    username text,
    active boolean
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM cron.job;
EXCEPTION
    WHEN undefined_table THEN
        RAISE NOTICE 'pg_cron not enabled or cron.job table does not exist';
        RETURN;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION public.list_cron_jobs IS 'Lists all scheduled cron jobs';

