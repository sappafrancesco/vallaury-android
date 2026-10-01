# Third party software

| Component | License | Notes |
|---|---|---|
| [androidbrowserhelper](https://github.com/GoogleChrome/android-browser-helper) 2.6.2 | Apache-2.0 | Runs the Trusted Web Activity. Linked into the app. |
| AndroidX libraries (browser, core, appcompat, activity, fragment, lifecycle and others) | Apache-2.0 | Pulled in by androidbrowserhelper. The exact list and checksums are in `gradle/verification-metadata.xml`. |
| Kotlin standard library | Apache-2.0 | Pulled in by AndroidX. |
| [Bubblewrap](https://github.com/GoogleChromeLabs/bubblewrap) project template, Copyright Google Inc. | Apache-2.0 | `app/src/main/java`, `AndroidManifest.xml` and some resource files started from this template. The original notices are kept in the files that still carry them. |
| Gradle wrapper 8.11.1 | Apache-2.0 | Unmodified, from the Gradle project. |

The Apache-2.0 text is in [LICENSES/Apache-2.0.txt](LICENSES/Apache-2.0.txt). Apache-2.0 code can be combined with
GPL-3.0 code, which is why this repository as a whole is GPL-3.0-only.
