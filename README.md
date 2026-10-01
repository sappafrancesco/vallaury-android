<div align="center">

<img src="fastlane/metadata/android/en-US/images/icon.png" alt="Vallaury icon" width="112" height="112">

# Vallaury for Android

**Timetable, homework, exams and notes of your class, as an app.**

[![License: GPL v3](https://img.shields.io/badge/license-GPL--3.0--only-blue.svg)](LICENSE)
![Min SDK](https://img.shields.io/badge/minSdk-23-informational)
![Permissions](https://img.shields.io/badge/permissions-1-success)
![Trackers](https://img.shields.io/badge/trackers-0-success)

[Website](https://app.vallaury.it) &nbsp;|&nbsp; [Demo](https://demo.vallaury.it) &nbsp;|&nbsp; [Privacy](PRIVACY.md) &nbsp;|&nbsp; [Italiano](README.it.md)

<img src="fastlane/metadata/android/en-US/images/phoneScreenshots/1.png" alt="Home" width="190">
<img src="fastlane/metadata/android/en-US/images/phoneScreenshots/2.png" alt="Timetable" width="190">
<img src="fastlane/metadata/android/en-US/images/phoneScreenshots/3.png" alt="Homework and exams" width="190">
<img src="fastlane/metadata/android/en-US/images/phoneScreenshots/4.png" alt="Notes" width="190">

</div>

## What this is

[Vallaury](https://app.vallaury.it) is a school platform made for the students and teachers of the Vallauri institute
in Fossano, Italy. It is an independent project, not the official platform of any school.

This repository is the Android app. It is deliberately small: a
[Trusted Web Activity](https://developer.chrome.com/docs/android/trusted-web-activity/) that opens
`https://app.vallaury.it` full screen, plus the launcher shortcuts, the share target and the notification hand-off.
There is no web view, no custom networking and no data layer in the app. All the features live on the website and reach
the app as soon as they are deployed.

| | |
|---|---|
| Package | `it.vallaury.app` |
| Min / target SDK | 23 (Android 6.0) / 36 |
| Language | Italian |
| Source of the app | this repository, [GPL-3.0-only](LICENSE) |
| Source of the service | not published |

## Privacy at a glance

| | |
|---|---|
| Permissions | one: `POST_NOTIFICATIONS`, to show notifications on Android 13 and later |
| Network access | none of its own: no `INTERNET` permission, pages are loaded by your browser |
| Trackers, analytics, crash reporting, ads | none |
| Google Play Services, Firebase, proprietary libraries | none |
| Data stored by the app | none about you; backups are switched off |
| Cleartext traffic | not allowed |
| Dependencies | one library ([androidbrowserhelper](https://github.com/GoogleChrome/android-browser-helper), Apache-2.0) and what it pulls in from AndroidX; every artifact is pinned by checksum |

What happens after the app opens the website is the website's business, and the honest summary is in
[PRIVACY.md](PRIVACY.md): who runs the server, which outside services sit in the path (your browser and its vendor, the
push service of your device, Cloudflare), and where the full policy is.

You do not have to trust this table. Check it:

```sh
./gradlew :app:assembleRelease
$ANDROID_HOME/build-tools/<version>/aapt2 dump permissions app/build/outputs/apk/release/app-release-unsigned.apk
```

## Install

- **F-Droid:** a submission is prepared in [`fdroid/`](fdroid/). It is not in the F-Droid index yet; this line will
  link to it when it is.
- **From source:** see [Build](#build). The APK you get is unsigned; sign it with your own key.

An APK installed from F-Droid is signed by F-Droid, one installed from Google Play by Google, and your own build by you.
Android will not install one over another: uninstall first. The app keeps no data, so nothing is lost.

## How it opens the website

1. If an installed browser supports Trusted Web Activities (Chromium based browsers do), the site opens full screen as
   an app, provided the site vouches for the app's signing key (Digital Asset Links, see below).
2. Otherwise the site opens in a Custom Tab of your default browser.
3. If no browser offers Custom Tabs, it opens as a normal link in your default browser.

The app works in all three cases. In 2 and 3 you see an address bar, and notifications depend on what your browser does
with web push.

### Digital Asset Links and the signing key

For the full screen mode, `https://app.vallaury.it/.well-known/assetlinks.json` must list the SHA-256 fingerprint of the
key that signed the installed APK. Each distribution channel has its own key, so each fingerprint is listed there. To read
the fingerprint of an APK:

```sh
$ANDROID_HOME/build-tools/<version>/apksigner verify --print-certs app-release.apk
```

## Build

You need JDK 17 and the Android SDK with platform 36 and a recent build-tools.

```sh
export ANDROID_HOME=/path/to/android-sdk
./gradlew :app:assembleRelease
# app/build/outputs/apk/release/app-release-unsigned.apk
```

Notes for people who care about what they run:

- The Gradle wrapper is the official one for Gradle 8.11.1 (its SHA-256 is `2db75c40...8046`, the value Gradle
  publishes), and CI validates it.
- Dependencies come from Google Maven and Maven Central only, and
  [`gradle/verification-metadata.xml`](gradle/verification-metadata.xml) pins the checksum of every artifact, build
  plugins included.
- The signed dependency metadata block that Android Gradle Plugin adds to APKs is switched off, as is the version control
  info. Two clean builds on the same toolchain give a byte-identical unsigned APK.
- To publish your own build, sign it with `apksigner`. No signing key or password is, or will ever be, in this repository.

To change the website the app opens, the shortcuts or the colours, edit
[`app/src/main/res/values/strings.xml`](app/src/main/res/values/strings.xml) and
[`colors.xml`](app/src/main/res/values/colors.xml), and [`xml/shortcuts.xml`](app/src/main/res/xml/shortcuts.xml).

## Repository layout

```
app/                         the Android module (manifest, resources, two tiny classes)
fastlane/metadata/android/   store texts, icon and screenshots read by F-Droid (en-US, it-IT)
fdroid/                      the F-Droid recipe and how it is submitted
gradle/                      wrapper and dependency checksums
LICENSES/                    texts of the other licenses used here
PRIVACY.md                   what the app and the service do with your data
SECURITY.md                  how to report a vulnerability
```

## Contributing

Bug reports and patches are welcome, for the app. Read [CONTRIBUTING.md](CONTRIBUTING.md) first. Problems with the
service itself (login, timetable data, notes) go through the feedback button in the web app, not here.

## License

The code and the artwork in this repository are released under the
[GNU General Public License, version 3 only](LICENSE). Parts derived from the Bubblewrap template and the libraries used
keep their own Apache-2.0 notices, see [THIRD_PARTY.md](THIRD_PARTY.md).

The license covers this app, not the service behind it and not the name: "Vallaury" and the web service at
`vallaury.it` belong to their maintainer. A fork must not present itself as the original app or point users at the
original service as if it were its own.
