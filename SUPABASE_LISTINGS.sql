-- Выполни в Supabase → SQL Editor

create table if not exists listings (
  id bigint primary key,
  owner_telegram_id bigint,
  title text,
  year int,
  price numeric,
  city text,
  gen text,
  color text,
  eng text,
  fuel text,
  trans text,
  drive text,
  mile numeric,
  comp text,
  description text,
  photos jsonb default '[]'::jsonb,
  views int default 0,
  likes int default 0,
  cat text default 'cars',
  created_at timestamptz default now()
);

alter table listings enable row level security;

-- Для демо: все могут читать и писать (потом ужесточи)
drop policy if exists "public read listings" on listings;
drop policy if exists "public insert listings" on listings;
drop policy if exists "public update listings" on listings;
drop policy if exists "public delete listings" on listings;

create policy "public read listings" on listings for select using (true);
create policy "public insert listings" on listings for insert with check (true);
create policy "public update listings" on listings for update using (true);
create policy "public delete listings" on listings for delete using (true);
