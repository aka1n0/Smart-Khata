# Smart Khata — phone-only APK build

This project is prepared for a phone-only GitHub Actions build.

## Important

- `.github/workflows/` is a hidden folder because its name starts with a dot. Android/Files apps may not display it.
- `android/` is included in this version.
- The GitHub Actions workflow also regenerates the Android platform before building, so the project can recover the Android build files automatically.

## Recommended phone workflow

1. Create a GitHub repository named `smart-khata`.
2. Upload the project files to the repository.
3. Make sure `.github/workflows/build-apk.yml` is present in the repository. If your phone's file picker hides `.github`, use GitHub's web interface to create the workflow file manually or use a Git client such as Termux to push the whole project folder.
4. Open **Actions** → **Build Smart Khata APK** → **Run workflow**.
5. Open the completed run → **Artifacts** → `smart-khata-release`.
6. Download and install the APK on Android.
