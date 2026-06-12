#!/bin/sh

echo "MinIO ka wait kar raha hun..."

# Jab tak MinIO ready na ho, wait karo
until mc alias set local http://minio:9000 "$S3_KEY" "$S3_SECRET" 2>/dev/null; do
  echo "MinIO abhi ready nahi — 2 second mein retry..."
  sleep 2
done

echo "MinIO ready hai — bucket bana raha hun..."

# Bucket banao — agar pehle se exist kare toh ignore karo
mc mb --ignore-existing local/"$S3_BUCKET"

# Public download access do — images publicly readable hon
mc anonymous set download local/"$S3_BUCKET"

echo "✓ Bucket '$S3_BUCKET' ready hai"