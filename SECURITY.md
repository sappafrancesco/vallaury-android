# Security

## Reporting a vulnerability in the app

Please do not open a public issue. Use GitHub's private reporting: **Security > Report a vulnerability** on this
repository. If you cannot, write to <privacy@vallaury.it> and say that it is about the Android app.

Useful to include: the version (`versionName` and `versionCode`), the device and Android version, and how to reproduce it.

You will get an answer as soon as it can be looked at. Fixes are released as a new version and noted in the
[changelog](CHANGELOG.md).

## Vulnerabilities in the website or service

The same addresses work. The service is a separate project with a separate code base; reports are welcome here as well.

## What is in scope

The app is a small shell and so the realistic issues are: wrong intent handling (the share target, the shortcuts, the
deep links for `app.vallaury.it`), an exported component that should not be, a dependency with a known vulnerability, or a
mistake in the manifest that widens what the app can do.

## Supported versions

Only the latest release.
