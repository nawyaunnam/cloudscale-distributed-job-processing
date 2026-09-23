package config

import "os"

type Config struct { DatabaseURL, RedisAddr, KafkaBrokers, JWTSecret string }
func Load() Config { return Config{env("DATABASE_URL","postgres://cloudscale:cloudscale@localhost:5432/cloudscale?sslmode=disable"),env("REDIS_ADDR","localhost:6379"),env("KAFKA_BROKERS","localhost:9092"),env("JWT_SECRET","development-only-secret-change-me")} }
func env(k,d string) string { if v:=os.Getenv(k); v!="" { return v }; return d }

