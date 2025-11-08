# 🚀 One-Click Deploy

Deploy your own Exam Tracker in **2 minutes** with GitHub Actions!

## Step 1: Fork This Repository

Click the "Fork" button at the top right of this page.

## Step 2: Get Cloudflare API Token

1. Go to https://dash.cloudflare.com/profile/api-tokens
2. Click "Create Token"
3. Use the "Edit Cloudflare Workers" template
4. Click "Continue to summary" → "Create Token"
5. **Copy the token** (you won't see it again!)

## Step 3: Add Token to GitHub

1. Go to your forked repo
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Name: `CLOUDFLARE_API_TOKEN`
5. Value: Paste your token
6. Click **Add secret**

## Step 4: Deploy!

1. Go to **Actions** tab in your repo
2. Click **Deploy to Cloudflare Workers**
3. Click **Run workflow**
4. Enter your desired admin password
5. Click **Run workflow**

Wait ~1 minute and you're done! 🎉

## Step 5: Find Your URL

1. Go to https://dash.cloudflare.com/
2. Click **Workers & Pages**
3. Find **exam-tracker**
4. Your URL will be: `https://exam-tracker.YOUR-USERNAME.workers.dev`

## That's It!

Visit your URL and go to `/admin` to start adding exams!

---

## Alternative: Deploy Button (Coming Soon)

We're working on a true one-click deploy button that will:
- ✅ Auto-fork the repo
- ✅ Auto-create KV namespace
- ✅ Auto-deploy to your Cloudflare account
- ✅ Prompt for password only

Stay tuned! ⭐ Star this repo to get notified.

---

## Troubleshooting

**"KV namespace not found"**
- Make sure your API token has Workers KV permissions

**"Unauthorized"**
- Check that your API token is correctly added to GitHub Secrets

**"Deployment failed"**
- Check the Actions logs for detailed error messages
- Make sure you have a Cloudflare account (free tier works!)

## Need Help?

Open an issue on GitHub with the error message from Actions logs.
