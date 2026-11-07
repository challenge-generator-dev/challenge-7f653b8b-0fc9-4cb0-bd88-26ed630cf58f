# Stage 1: Build stage - compile the application artifact
FROM golang:1.21-alpine AS builder

# Install build dependencies
RUN apk add --no-cache git make

# Set working directory for the application source
WORKDIR /build

# Copy application source code
COPY . .

# Build the notification service binary
# This creates a minimal binary optimized for the final image
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o notifications-service .

# Stage 2: Production stage - minimal runtime image
FROM alpine:3.18

# Install runtime dependencies: ca-certificates for TLS, and curl for health checks
RUN apk add --no-cache ca-certificates curl

# Create non-root user for security best practices
RUN adduser -D -u 1000 appuser

# Set working directory
WORKDIR /app

# Copy the compiled binary from builder stage
COPY --from=builder /build/notifications-service /app/

# Copy configuration files that Terraform would provision
COPY configs/ /app/configs/

# Change ownership to non-root user
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Expose notification service port
EXPOSE 8080

# Health check endpoint for container orchestration
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# Set default command to run the notification service
CMD ["/app/notifications-service"]