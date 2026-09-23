CREATE TABLE IF NOT EXISTS audit_events(id bigserial primary key,payload jsonb not null,created_at timestamptz not null,UNIQUE(payload));

