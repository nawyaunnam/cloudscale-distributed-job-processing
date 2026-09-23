# Operations

Track submission rate, queue lag, oldest queued age, lease acquisition conflicts, running jobs, retry rate, dead-letter growth, execution duration, heartbeat age, API latency, and database pool saturation. Page on sustained consumer lag, expired-lease spikes, DLQ growth, and unavailable state stores.

Scale API pods on CPU and request latency. Scale workers from Kafka lag with KEDA; keep maximum replicas aligned with Kafka partitions and downstream quotas. During deployment, drain consumers, stop accepting new leases, let active jobs finish within the termination grace period, and rely on lease recovery for interrupted work.

Recovery drills should kill workers mid-job, isolate Redis, restart Kafka, restore PostgreSQL into a staging account, replay a DLQ sample, and verify that duplicated delivery cannot create duplicate external effects.

