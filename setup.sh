#!/bin/bash

echo "🚀 Exam Tracker Setup"
echo "====================="
echo ""

# Ask for worker name
echo "📝 Customize your deployment"
read -p "Enter worker name (press Enter for 'exam-tracker'): " WORKER_NAME
echo ""

if [ -z "$WORKER_NAME" ]; then
    WORKER_NAME="exam-tracker"
fi

# Update wrangler.toml with worker name
sed -i.bak "s/name = \".*\"/name = \"$WORKER_NAME\"/" wrangler.toml
rm wrangler.toml.bak 2>/dev/null || true

echo "✅ Worker name set to: $WORKER_NAME"
echo ""

# Check if wrangler is installed
if ! command -v wrangler &> /dev/null; then
    echo "📦 Installing Wrangler..."
    npm install
fi

# Login to Cloudflare
echo "🔐 Logging in to Cloudflare..."
npx wrangler login

# Create KV namespace
echo ""
echo "📦 Creating KV namespace..."
KV_OUTPUT=$(npx wrangler kv namespace create "EXAM_DATA")
echo "$KV_OUTPUT"

# Extract KV ID
KV_ID=$(echo "$KV_OUTPUT" | grep -oP 'id = "\K[^"]+')

if [ -z "$KV_ID" ]; then
    echo "❌ Failed to create KV namespace"
    exit 1
fi

echo ""
echo "✅ KV Namespace created: $KV_ID"

# Update wrangler.toml with KV ID
sed -i.bak "s/id = \".*\"/id = \"$KV_ID\"/" wrangler.toml
rm wrangler.toml.bak 2>/dev/null || true

# Ask for admin password
echo ""
read -sp "🔑 Enter admin password (press Enter for 'changeme123'): " ADMIN_PASSWORD
echo ""

if [ -z "$ADMIN_PASSWORD" ]; then
    ADMIN_PASSWORD="changeme123"
fi

# Update wrangler.toml with password
sed -i.bak "s/ADMIN_PASSWORD = \".*\"/ADMIN_PASSWORD = \"$ADMIN_PASSWORD\"/" wrangler.toml
rm wrangler.toml.bak 2>/dev/null || true

# Deploy
echo ""
echo "🚀 Deploying to Cloudflare Workers..."
npx wrangler deploy

echo ""
echo "✅ Setup complete!"
echo ""
echo "📝 Your deployment:"
echo "   URL: https://$WORKER_NAME.YOUR-USERNAME.workers.dev"
echo "   Admin: /admin"
echo "   Password: $ADMIN_PASSWORD"
echo ""
echo "🎉 Happy tracking!"
