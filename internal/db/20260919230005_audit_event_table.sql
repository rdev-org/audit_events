CREATE TABLE
  IF NOT EXISTS audit_event (
    id BIGSERIAL PRIMARY KEY,
    status VARCHAR(1) NOT NULL DEFAULT 'A',
    uuid UUID NOT NULL DEFAULT gen_random_uuid (),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW (),
    updated_at TIMESTAMPTZ DEFAULT NOW (),
    deleted_at TIMESTAMPTZ DEFAULT NULL,
    application_id UUID NOT NULL,
    event_type VARCHAR(100) NOT NULL,
    action_type VARCHAR(32) NOT NULL,
    recorded_at TIMESTAMPTZ DEFAULT NOW ()
  );

CREATE INDEX idx_audit_event_uuid ON audit_event (uuid);