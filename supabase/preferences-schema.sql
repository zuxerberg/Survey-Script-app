create table public.owner_survey_preferences (
 user_id uuid primary key references auth.users(id) on delete cascade,
 script text not null default '',
 questions jsonb not null check (jsonb_typeof(questions) = 'array'),
 updated_at timestamptz not null default now()
);
alter table public.owner_survey_preferences enable row level security;
revoke all on public.owner_survey_preferences from anon;
grant select,insert,update on public.owner_survey_preferences to authenticated;
create policy "Read own survey preferences" on public.owner_survey_preferences for select to authenticated using ((select auth.uid()) = user_id);
create policy "Insert own survey preferences" on public.owner_survey_preferences for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Update own survey preferences" on public.owner_survey_preferences for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
