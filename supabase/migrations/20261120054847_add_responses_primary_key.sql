ALTER TABLE public.responses
ADD CONSTRAINT responses_pkey
PRIMARY KEY ("participantId", "trialNum");