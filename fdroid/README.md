# F-Droid

[`it.vallaury.app.yml`](it.vallaury.app.yml) is the build recipe in the format of the
[fdroiddata](https://gitlab.com/fdroid/fdroiddata) repository. The texts, icon and screenshots of the listing are not in
it: F-Droid reads them from [`fastlane/metadata/android`](../fastlane/metadata/android) in this repository.

## Checklist (all done in this repository)

- [x] Free license (GPL-3.0-only) and public source.
- [x] No proprietary dependency, no Google Play Services, no tracker. Only Google Maven and Maven Central.
- [x] Gradle wrapper is the official one; dependencies are pinned by checksum.
- [x] Builds with JDK 17 from a clean checkout, no keys or private files needed.
- [x] No signing configuration in the build; F-Droid signs the app itself.
- [x] Dependency info block and VCS info are off, and a rebuild gives the same APK.
- [x] Store texts in `en-US` and `it-IT`, with changelog for the current `versionCode`.
- [x] Anti-feature declared: `NonFreeNet` (the app only opens a service that is not free software).
- [x] Release tag `v1.0.0`.

## Submitting

1. Fork <https://gitlab.com/fdroid/fdroiddata> and copy `it.vallaury.app.yml` to `metadata/it.vallaury.app.yml`.
2. Check it locally with `fdroid lint it.vallaury.app` and `fdroid build -v -l it.vallaury.app`
   (see the [F-Droid quick start](https://f-droid.org/docs/Submitting_to_F-Droid_Quick_Start_Guide/)).
3. Open a merge request, using their template.

## After the first F-Droid build

F-Droid signs with its own key. For the app to open full screen (not with an address bar), add the SHA-256 fingerprint
of that key to `assetlinks.json` on the website, next to the others:

```sh
apksigner verify --print-certs it.vallaury.app_1.apk
```

## New versions

Raise `versionCode` and `versionName` in `app/build.gradle`, add the changelog file, commit, tag `v<versionName>` and push
the tag. `UpdateCheckMode: Tags` makes F-Droid notice it.
