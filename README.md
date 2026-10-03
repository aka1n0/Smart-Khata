# Smart Khata

A modern, mobile-first digital ledger for small businesses, shopkeepers, freelancers and individuals.

## Current foundation
- Flutter + Dart
- Riverpod state management
- Local-first persistence using SharedPreferences for the initial foundation
- Dashboard
- Customers and suppliers
- Ledger transactions
- Expenses
- Inventory
- Search and filtering
- Dark/light theme
- PKR formatting
- English/Urdu-ready localization structure
- Modular feature architecture

## Next production modules
1. Firebase Phone OTP/email authentication
2. Firestore sync + conflict resolution
3. Encrypted local database (Drift/SQLite)
4. PDF invoices/statements
5. WhatsApp share workflows
6. Notifications/reminders
7. Barcode/QR workflows
8. Team roles and audit log
9. AI assistant grounded only in business data
10. Backup/restore and production security hardening

## Run
```bash
flutter pub get
flutter run
```

This project intentionally avoids copying DigiKhata branding, proprietary UI, or proprietary assets.

## Phone-only APK build

This project includes GitHub Actions workflows for building an Android APK without a computer. See `PHONE_BUILD.md` for the exact steps.
