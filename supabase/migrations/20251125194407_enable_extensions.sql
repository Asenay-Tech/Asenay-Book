-- Enable PostgreSQL Extensions for Asenay-Book SaaS
-- These extensions provide essential functionality for production SaaS

-- =============================================================================
-- CORE EXTENSIONS (Already enabled by Supabase, but ensure they exist)
-- =============================================================================

-- UUID generation (usually enabled by default)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;

-- Cryptographic functions for hashing, encryption
CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA extensions;

-- =============================================================================
-- SUPABASE-SPECIFIC EXTENSIONS
-- =============================================================================

-- GraphQL API support (Supabase pg_graphql)
CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA graphql;

-- HTTP requests from database (for webhooks, external API calls)
CREATE EXTENSION IF NOT EXISTS "pg_net" WITH SCHEMA extensions;

-- Encryption at rest (Supabase pgsodium)
-- Note: pgsodium is managed by Supabase, may already be enabled
-- CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA pgsodium;

-- =============================================================================
-- ANALYTICS & MONITORING
-- =============================================================================

-- Query performance analytics
CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA extensions;

-- =============================================================================
-- SCHEDULING (pg_cron)
-- =============================================================================

-- Scheduled jobs - Note: pg_cron must be enabled via Supabase Dashboard
-- It requires superuser privileges and is managed by Supabase
-- CREATE EXTENSION IF NOT EXISTS "pg_cron" WITH SCHEMA extensions;

-- =============================================================================
-- UTILITY EXTENSIONS
-- =============================================================================

-- Full-text search improvements
CREATE EXTENSION IF NOT EXISTS "pg_trgm" WITH SCHEMA extensions;

-- Case-insensitive text type
CREATE EXTENSION IF NOT EXISTS "citext" WITH SCHEMA extensions;

-- =============================================================================
-- COMMENTS FOR DOCUMENTATION
-- =============================================================================

COMMENT ON EXTENSION "uuid-ossp" IS 'UUID generation functions';
COMMENT ON EXTENSION "pgcrypto" IS 'Cryptographic functions for hashing and encryption';
COMMENT ON EXTENSION "pg_graphql" IS 'GraphQL API support';
COMMENT ON EXTENSION "pg_net" IS 'HTTP requests from database';
COMMENT ON EXTENSION "pg_stat_statements" IS 'Query performance statistics';
COMMENT ON EXTENSION "pg_trgm" IS 'Trigram matching for fuzzy search';
COMMENT ON EXTENSION "citext" IS 'Case-insensitive text type';

-- =============================================================================
-- NOTE: Some extensions require Supabase Dashboard configuration:
-- - pg_cron: Enable via Dashboard > Database > Extensions
-- - pgsodium: Managed by Supabase, enabled by default
-- - pgjwt: May need manual enabling
-- =============================================================================

