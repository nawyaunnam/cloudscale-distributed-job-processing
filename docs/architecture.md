# Architecture

PostgreSQL is the authoritative state machine: `queued → running → succeeded`, `retrying`, or `dead_letter`. Kafka is the scalable delivery plane, not the source of truth. A worker must atomically acquire a live lease before execution; stale deliveries therefore cannot overwrite work owned by another worker.

The API persists before publishing. The remaining crash window between those operations should be closed with a transactional outbox in a production release. Workers commit Kafka offsets only after state transition and retry/DLQ publication. Job IDs and guarded lease ownership make redelivery safe for platform state, while job handlers must also use idempotency keys for external side effects.

Redis liveness keys expire automatically and are suitable for dashboards and schedulers. Correctness never depends on them. PostgreSQL lease expiry drives recovery if Redis or a worker disappears.

