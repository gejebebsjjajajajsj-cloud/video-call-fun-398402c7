-- Restrict INSERT/UPDATE on call_config to a single admin user (your main login)
-- This uses the existing admin user id from auth logs: f0340c35-8dc1-41fd-9956-c16ebe6f3f6e

-- Remove old UPDATE policy if it exists
DROP POLICY IF EXISTS "Apenas autenticados podem atualizar call_config" ON public.call_config;

-- Allow only this admin user to INSERT
CREATE POLICY "Somente admin pode inserir call_config"
ON public.call_config
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = 'f0340c35-8dc1-41fd-9956-c16ebe6f3f6e');

-- Allow only this admin user to UPDATE
CREATE POLICY "Somente admin pode atualizar call_config"
ON public.call_config
FOR UPDATE
TO authenticated
USING (auth.uid() = 'f0340c35-8dc1-41fd-9956-c16ebe6f3f6e')
WITH CHECK (auth.uid() = 'f0340c35-8dc1-41fd-9956-c16ebe6f3f6e');