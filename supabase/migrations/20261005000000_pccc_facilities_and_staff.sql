create table public.staff (
  email text primary key check (email = lower(email))
);
alter table public.staff enable row level security;

create table public.facilities (
  id text primary key,
  ma text not null unique,
  data jsonb not null,
  updated_at timestamptz not null default now(),
  updated_by text
);
alter table public.facilities enable row level security;

revoke all on public.staff, public.facilities from anon;

create policy staff_select_self on public.staff
  for select to authenticated
  using (email = lower(coalesce(auth.jwt() ->> 'email', '')));

create policy facilities_select on public.facilities
  for select to authenticated
  using (exists (select 1 from public.staff s where s.email = lower(coalesce(auth.jwt() ->> 'email', ''))));
create policy facilities_insert on public.facilities
  for insert to authenticated
  with check (exists (select 1 from public.staff s where s.email = lower(coalesce(auth.jwt() ->> 'email', ''))));
create policy facilities_update on public.facilities
  for update to authenticated
  using (exists (select 1 from public.staff s where s.email = lower(coalesce(auth.jwt() ->> 'email', ''))))
  with check (exists (select 1 from public.staff s where s.email = lower(coalesce(auth.jwt() ->> 'email', ''))));
create policy facilities_delete on public.facilities
  for delete to authenticated
  using (exists (select 1 from public.staff s where s.email = lower(coalesce(auth.jwt() ->> 'email', ''))));
