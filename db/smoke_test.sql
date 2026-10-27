SELECT version();
SELECT current_database(), current_user, current_timestamp;

CREATE SCHEMA IF NOT EXISTS lr8_probe;

CREATE TABLE IF NOT EXISTS lr8_probe.connection_check (
    id integer PRIMARY KEY,
    checked_at timestamptz NOT NULL DEFAULT now(),
    message text NOT NULL
);

INSERT INTO lr8_probe.connection_check (id, message)
VALUES (1, 'LR8 connection OK')
ON CONFLICT (id) DO UPDATE
SET checked_at = now(), message = EXCLUDED.message;

SELECT id, checked_at, message
FROM lr8_probe.connection_check
WHERE id = 1;
