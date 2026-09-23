package model

import "time"

type Job struct { ID string `json:"id"`; TenantID string `json:"tenant_id"`; Type string `json:"type"`; Payload map[string]any `json:"payload"`; Status string `json:"status"`; Attempt int `json:"attempt"`; MaxAttempts int `json:"max_attempts"`; CreatedAt time.Time `json:"created_at"`; UpdatedAt time.Time `json:"updated_at"`; Error string `json:"error,omitempty"`; Result map[string]any `json:"result,omitempty"` }
type SubmitRequest struct { Type string `json:"type"`; Payload map[string]any `json:"payload"`; MaxAttempts int `json:"max_attempts"` }

