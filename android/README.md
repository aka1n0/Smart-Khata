# Android build directory

The production Android project is generated and refreshed by the GitHub Actions workflow before the APK build.

This folder is intentionally included so the Flutter project has an explicit Android platform directory. The CI workflow runs:

    flutter create --platforms=android --org com.smartkhata .

before building the release APK.
