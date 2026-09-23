package dev.cloudscale.audit;
import org.springframework.jdbc.core.JdbcTemplate;import org.springframework.kafka.annotation.KafkaListener;import org.springframework.stereotype.Component;
@Component public class AuditConsumer { private final JdbcTemplate db; public AuditConsumer(JdbcTemplate db){this.db=db;} @KafkaListener(topics={"job-events","jobs.dlq"},groupId="cloudscale-audit") public void record(String event){db.update("insert into audit_events(payload,created_at) values (?::jsonb,now()) on conflict do nothing",event);} }

