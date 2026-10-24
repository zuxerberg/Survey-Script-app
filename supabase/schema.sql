create table public.owner_survey_cards (
 user_id uuid not null references auth.users(id) on delete cascade,
 id text not null,
 payload jsonb not null check (jsonb_typeof(payload) = 'object'),
 updated_at timestamptz not null default now(),
 primary key (user_id, id)
);
alter table public.owner_survey_cards enable row level security;
revoke all on public.owner_survey_cards from anon;
grant select, insert, update on public.owner_survey_cards to authenticated;
create policy "Read own survey cards" on public.owner_survey_cards for select to authenticated using ((select auth.uid()) = user_id);
create policy "Insert own survey cards" on public.owner_survey_cards for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Update own survey cards" on public.owner_survey_cards for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
