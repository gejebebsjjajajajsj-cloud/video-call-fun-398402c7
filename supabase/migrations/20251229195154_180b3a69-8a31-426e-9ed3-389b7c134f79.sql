-- Add duration_seconds column to store call length in seconds
ALTER TABLE public.call_config
ADD COLUMN IF NOT EXISTS duration_seconds integer;