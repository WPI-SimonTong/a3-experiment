-- SQL script to create the initial schema for the Supabase database created with AI help

-- Create responses table
CREATE TABLE public.responses (
    "participantId" TEXT NOT NULL,
    "trialNum" INTEGER NOT NULL,
    vis TEXT NOT NULL,
    "truePercent" DOUBLE PRECISION NOT NULL,
    "reportedPercent" DOUBLE PRECISION NOT NULL
);

-- Enable Row Level Security
ALTER TABLE public.responses
ENABLE ROW LEVEL SECURITY;

-- Grant public read and insert permissions
GRANT SELECT, INSERT
ON public.responses
TO anon;

-- Grant full permissions to authenticated users
GRANT SELECT, INSERT, UPDATE, DELETE
ON public.responses
TO authenticated;

-- Public read access
CREATE POLICY "Public read access"
ON public.responses
FOR SELECT
TO anon, authenticated
USING (true);

-- Public insert access
CREATE POLICY "Public insert access"
ON public.responses
FOR INSERT
TO anon, authenticated
WITH CHECK (true);

-- Authenticated update access
CREATE POLICY "Authenticated update access"
ON public.responses
FOR UPDATE
TO authenticated
USING (true)
WITH CHECK (true);

-- Authenticated delete access
CREATE POLICY "Authenticated delete access"
ON public.responses
FOR DELETE
TO authenticated
USING (true);
