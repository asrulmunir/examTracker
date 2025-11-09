# 🚀 Easy Deployment Guide

Deploy your own Exam Tracker in **5 minutes**!

## Prerequisites

- A Cloudflare account (free tier works!)
- Node.js installed on your computer

## Step 1: Download the Code

```bash
# Clone or download this repository
git clone https://github.com/asrulmunir/examTracker.git
cd examTracker
```

## Step 2: Customize Worker Name (Optional)

Want to deploy multiple trackers? Edit `wrangler.toml`:

```toml
name = "exam-tracker"  # Change this to anything you want!
```

**Examples:**
- `spm-2025` → `https://spm-2025.YOUR-USERNAME.workers.dev`
- `finals-tracker` → `https://finals-tracker.YOUR-USERNAME.workers.dev`
- `midterms` → `https://midterms.YOUR-USERNAME.workers.dev`

## Step 3: Install Dependencies

```bash
npm install
```

## Step 4: Login to Cloudflare

```bash
npx wrangler login
```

This will open your browser to authenticate.

## Step 5: Create KV Namespace

```bash
npx wrangler kv namespace create "EXAM_DATA"
```

Copy the ID from the output and paste it in `wrangler.toml`:

```toml
[[kv_namespaces]]
binding = "EXAM_DATA"
id = "paste-your-id-here"  # Replace this!
```

## Step 6: Set Your Admin Password

Edit `wrangler.toml`:

```toml
[vars]
ADMIN_PASSWORD = "your-secure-password"  # Change this!
```

## Step 7: Deploy!

```bash
npx wrangler deploy
```

That's it! 🎉

Your tracker will be live at: `https://YOUR-WORKER-NAME.YOUR-USERNAME.workers.dev`

## First Time Setup

1. Visit `/admin` on your deployed URL
2. Login with your password
3. Configure your title and description
4. Add your first exam
5. Click "Save All"

## Updating

Made changes? Just run:

```bash
npx wrangler deploy
```

## Cost

**FREE!** Cloudflare Workers free tier includes:
- 100,000 requests/day
- Unlimited KV reads
- 1,000 KV writes/day

Perfect for exam tracking! 📚

## Need Help?

Open an issue on GitHub or check Cloudflare Workers documentation.
