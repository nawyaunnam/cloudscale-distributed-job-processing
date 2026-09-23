# Threat model

The API accepts data, not executable commands. Keep arbitrary code out of the shared worker process. If user code is required, execute each job in a fresh sandbox with a read-only root filesystem, seccomp/AppArmor, no host mounts, strict CPU/memory/time quotas, scoped workload identity, and deny-by-default egress.

Use TLS/mTLS between services, OIDC with short-lived tokens, per-tenant authorization and quotas, encrypted Kafka/PostgreSQL/S3, a managed secrets store, payload size limits, audit retention, and log redaction. Results and payloads may be sensitive; isolate them by tenant and expire them deliberately.

