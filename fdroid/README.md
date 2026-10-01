# F-Droid

[`it.vallaury.app.yml`](it.vallaury.app.yml) is the build recipe in the format of the
[fdroiddata](https://gitlab.com/fdroid/fdroiddata) repository. The texts, icon and screenshots of the listing are not in
it: F-Droid reads them from [`fastlane/metadata/android`](../fastlane/metadata/android) in this repository.

## Checklist (all done in this repository)

- [x] Free license (GPL-3.0-only) and public source.
- [x] No proprietary dependency, no Google Play Services, no tracker. Only Google Maven and Maven Central.
- [x] Gradle wrapper is the official one; dependencies are pinned by checksum.
- [x] Builds with JDK 17 from a clean checkout, no keys or private files needed.
- [x] No signing configuration in the build. Releases are signed afterwards with `scripts/sign-release.sh`.
- [x] Reproducible build: F-Droid builds from source, checks the result against the signed APK on the GitHub release and publishes that APK with the developer signature (`Binaries` and `AllowedAPKSigningKeys` in the recipe).
- [x] Dependency info block and VCS info are off, and a rebuild gives the same APK.
- [x] Store texts in `en-US` and `it-IT`, with changelog for the current `versionCode`.
- [x] Anti-feature declared: `NonFreeNet` (the app only opens a service that is not free software).
- [x] Release tag `v1.0.0`, and the recipe points at its full commit hash.

## Submitting

1. Fork <https://gitlab.com/fdroid/fdroiddata> and copy `it.vallaury.app.yml` to `metadata/it.vallaury.app.yml`.
2. Check it locally with `fdroid lint it.vallaury.app` and `fdroid build -v -l it.vallaury.app`
   (see the [F-Droid quick start](https://f-droid.org/docs/Submitting_to_F-Droid_Quick_Start_Guide/)).
3. Open a merge request, using their template.

## Signing key

F-Droid publishes the APK signed with this project's own key, so the same APK can come from F-Droid or from the GitHub
release, and updates work between the two. The certificate fingerprint (SHA-256) is:

```
C4:A8:91:E0:6C:1C:79:8F:BA:D8:F5:F2:D6:D9:EF:9B:47:A3:06:6D:EE:14:10:A7:9B:B0:17:80:9B:E9:6C:E7
```

The same fingerprint is listed in `assetlinks.json` on the website, which is what makes the app open full screen.

## New versions

Raise `versionCode` and `versionName` in `app/build.gradle`, add the changelog file, commit, tag `v<versionName>` and push
the tag. Build, sign with `scripts/sign-release.sh` and attach the APK to the GitHub release as
`vallaury-<versionName>.apk` (the recipe downloads it from there). `UpdateCheckMode: Tags` makes F-Droid notice the new tag.
