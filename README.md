# Exam Tracker

A beautiful, customizable exam progress tracker built with Cloudflare Workers + KV. Features an iOS-inspired liquid glass design and admin panel for easy management.

## Features

- ✨ Beautiful iOS liquid glass design
- 🔐 Admin panel to manage exams
- 📊 Real-time progress tracking
- 🔍 Search and filter functionality
- 💾 Data stored in Cloudflare KV
- 🚀 Easy to deploy
- 🌍 Open source - anyone can install their own

## Quick Start

### 1. Clone and Install

```bash
cd /Users/abumuaaz/vscode/examTracker
npm install
```

### 2. Create KV Namespace

```bash
wrangler kv:namespace create "EXAM_DATA"
```

Copy the ID and update `wrangler.toml`:

```toml
[[kv_namespaces]]
binding = "EXAM_DATA"
id = "your-kv-id-here"
```

### 3. Set Admin Password

Update `wrangler.toml`:

```toml
[vars]
ADMIN_PASSWORD = "your-secure-password"
```

### 4. Deploy

```bash
wrangler deploy
```

## Usage

### Public View
Visit your deployed URL to see the exam tracker.

### Admin Panel
1. Go to `/admin`
2. Login with your admin password
3. Configure title and description
4. Add/edit/delete exams
5. Save changes

## Exam Data Format

```json
{
  "code": "EXAM001",
  "name": "Mathematics Paper 1",
  "date": "2025-12-01",
  "time": "08:15",
  "endTime": "10:15",
  "category": "Core"
}
```

## Customization

- Change colors in the CSS gradient
- Modify the liquid glass effect
- Add custom categories
- Adjust auto-refresh interval

## License

MIT - Feel free to use for your own exam tracking needs!

## Support

For issues or questions, please open an issue on GitHub.
