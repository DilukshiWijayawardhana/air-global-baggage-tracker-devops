# ==========================================
# STAGE 1: Build Environment
# ==========================================
FROM golang:1.21 AS builder
WORKDIR /app
COPY main.go .
COPY index.html .
RUN CGO_ENABLED=0 go build -o airtrack main.go

# ==========================================
# STAGE 2: Minimal Runtime Environment
# ==========================================
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/airtrack .
COPY --from=builder /app/index.html .
EXPOSE 8080
CMD ["./airtrack"]
