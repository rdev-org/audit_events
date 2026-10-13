CREATE TABLE
  IF NOT EXISTS audit_event_detail (
    id BIGSERIAL PRIMARY KEY,
    status VARCHAR(1) NOT NULL DEFAULT 'A',
    uuid UUID NOT NULL DEFAULT gen_random_uuid (),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW (),
    updated_at TIMESTAMPTZ DEFAULT NOW (),
    deleted_at TIMESTAMPTZ DEFAULT NULL,
    audit_event_id UUID NOT NULL,
    request_payload JSONB,
    response_payload JSONB,
    error_message TEXT,
    stack_tract TEXT
  );

CREATE INDEX idx_audit_event_detail_uuid ON audit_event_detail (uuid);

CREATE INDEX idx_audit_event_detail_audit_event_id ON audit_event (audit_event_id);