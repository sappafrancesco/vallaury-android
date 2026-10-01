# Contributing

Thanks for looking. This app is small on purpose, so contributions are mostly fixes and keeping up with Android.

## Before you start

- The app is a Trusted Web Activity around `https://app.vallaury.it`. Features belong on the website, not here. A change
  that adds a permission, a library or a network call will be declined unless it is clearly needed.
- Open an issue first for anything bigger than a small fix.
- By sending a patch you agree that it is released under [GPL-3.0-only](LICENSE), like the rest of the project.

## Build and check

```sh
./gradlew :app:assembleRelease
```

If you change dependencies, refresh the checksums and look at the diff:

```sh
./gradlew --write-verification-metadata sha256 :app:assembleRelease :app:assembleDebug
git diff gradle/verification-metadata.xml
```

## Style

- Plain, short commit messages in the imperative: `Raise targetSdk to 36`.
- Keep the manifest minimal. Every line in it is something a privacy minded user will read.
- Android Studio or the command line are both fine. Do not commit `local.properties`, keystores or build output.

## Releasing (maintainer)

1. Raise `versionCode` and `versionName` in `app/build.gradle`.
2. Add a file `fastlane/metadata/android/<locale>/changelogs/<versionCode>.txt` (500 bytes at most) and a section in
   `CHANGELOG.md`.
3. Commit, then tag `v<versionName>` and push the tag. F-Droid picks the new tag up by itself.
