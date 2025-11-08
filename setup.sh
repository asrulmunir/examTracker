#!/bin/bash

echo "🚀 Exam Tracker Setup"
echo "====================="
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
echo "📝 Next steps:"
echo "1. Visit your Workers URL (shown above)"
echo "2. Go to /admin"
echo "3. Login with password: $ADMIN_PASSWORD"
echo "4. Add your exams!"
echo ""
echo "🎉 Happy tracking!"
