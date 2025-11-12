# Changelog

All notable changes to Exam Tracker will be documented in this file.

## [1.0.1] - 2025-11-12

### ✨ Major Enhancements

#### 🌍 Dual-Language Support
- Added complete English/Malay (Bahasa Melayu) language switching
- Real-time language toggle on both public and admin interfaces
- Comprehensive translations for all UI elements, forms, and messages
- Language preference saved in admin configuration

#### 🎨 Enhanced Admin Interface
- **Modal-based exam editor** with improved UX and validation
- **Quick add buttons** for rapid exam creation (Today, Tomorrow, This Week)
- **Bulk import/export** functionality with JSON support
- **Form validation** with helpful error messages and field validation
- **Help tooltips** for complex form fields
- **Free-text category input** instead of predefined dropdown
- **Improved visual design** with better card layouts and status indicators

#### 🔧 Technical Improvements
- Added comprehensive translations system (`src/translations.js`)
- Enhanced error handling throughout the application
- Improved form validation with client-side checks
- Better user feedback and loading states
- Added AGENTS.md for AI coding assistant guidelines

#### 📱 User Experience
- **Better form organization** with logical field grouping
- **Contextual help** with tooltips and help text
- **Improved error messages** in both languages
- **Enhanced keyboard navigation** and accessibility
- **Responsive modal design** that works on all screen sizes

### 🐛 Bug Fixes
- Fixed admin interface status display issues
- Resolved JavaScript errors in exam management
- Improved error handling for edge cases

### 📚 Documentation
- Updated README.md with new features
- Added AGENTS.md for AI assistant integration
- Enhanced inline code comments
- Updated deployment instructions

---

## [1.0.0] - 2025-11-08

### 🎉 Initial Release

#### Features
- ✨ Beautiful iOS liquid glass design
- 🔐 Admin panel with password authentication
- 📊 Real-time progress tracking (Completed, In Progress, Upcoming)
- 🔍 Search functionality for subjects
- 📚 Category filtering for subjects
- 📍 Exam location support
- ⏰ Time range display (start - end time)
- 💾 Data persistence with Cloudflare KV
- 🎨 Responsive design (mobile, tablet, desktop)
- 🔄 Auto-refresh every 30 minutes
- 📱 Collapsible subject selection
- 🎯 Timeline filtering by subject

#### Deployment
- 🚀 Three deployment methods (GitHub Actions, Setup Script, Manual)
- 📦 One-click deploy support
- 🔧 Customizable worker names for multiple deployments
- 💰 Free tier compatible (100k requests/day)

#### Admin Features
- ➕ Add/edit/delete exams
- ⚙️ Configure title and description
- 📝 Manage exam details (code, name, date, time, location, category)
- 💾 Save to Cloudflare KV

#### Technical
- Built with Cloudflare Workers
- Cloudflare KV for data storage
- Tailwind CSS for styling
- No build process required
- Static HTML + Worker API

### Documentation
- 📖 Complete README with features
- 🚀 DEPLOY.md with step-by-step instructions
- 🎯 ONE_CLICK_DEPLOY.md for GitHub Actions
- 🤖 Interactive setup.sh script
- 📝 Comprehensive inline comments

---

## Future Releases

### Planned Features
- 📧 Email notifications
- 📅 iCal export
- 🌐 Multi-language support
- 📊 Analytics dashboard
- 🎨 Theme customization
- 📱 PWA support
- 🔔 Browser notifications

---

**Note:** This project follows [Semantic Versioning](https://semver.org/).
