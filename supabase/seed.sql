-- Seed file for test data
-- This file can be executed via: supabase db execute --file supabase/seed.sql

-- Insert test data into cursor_test_table
INSERT INTO public.cursor_test_table (name, email, amount, is_active, metadata)
VALUES 
    ('Test User 1', 'test1@example.com', 100.50, true, '{"role": "admin"}'),
    ('Test User 2', 'test2@example.com', 250.00, true, '{"role": "user"}'),
    ('Test User 3', 'test3@example.com', 0.00, false, '{"role": "guest"}')
ON CONFLICT (email) DO NOTHING;

-- Verify insertion
SELECT COUNT(*) as total_records FROM public.cursor_test_table;

