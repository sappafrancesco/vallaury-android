# Privacy

This page has two parts: what the Android app does, and what happens once it has opened the Vallaury website. The second
part is a summary. The full, binding text is the
[privacy policy of the service](https://app.vallaury.it/privacy) (Italian).

## The app

- It requests one permission, `POST_NOTIFICATIONS`, so that notifications can be shown on Android 13 and later.
- It has no `INTERNET` permission. It never talks to a server itself. It hands the address `https://app.vallaury.it` to
  your browser and your browser does the rest.
- It contains no analytics, advertising, crash reporting or tracking code, and none of Google Play Services, Firebase or
  any other proprietary library. The only library is
  [androidbrowserhelper](https://github.com/GoogleChrome/android-browser-helper) (Apache-2.0).
- It keeps no account data. Android backups are disabled, and cleartext (non HTTPS) traffic is not allowed.
- It does not read contacts, files, location, microphone, camera or anything else on the device. When you share text to
  Vallaury from another app, that text is passed to the website as the address of a new note, and only then.

All of this is visible in [`AndroidManifest.xml`](app/src/main/AndroidManifest.xml) and can be re-checked on any APK with
`aapt2 dump permissions`.

## The service behind it

Summary of the service's own policy, as of the version of this repository:

- Vallaury is run by one person, on a server they own, in Italy. It does not use the large cloud providers.
- It asks for the minimum: name, e-mail, school data that the school already makes public (timetable, classes), and what
  you write. It does not ask for your age, phone number or location, and does not use analytics or fingerprinting.
- No advertising, no selling of data, no commercial profiling.
- You can sign in with a passkey, an e-mail code, or optionally with Google. If you choose Google, Vallaury only receives
  your identity, e-mail and name.
- You can download, correct or delete your data from your profile.
- The service is open to people aged 14 and over.

Outside parties that can see something when you use the app:

| Who | What they can see |
|---|---|
| Your browser and its vendor | Everything you open, as with any website. The app opens the site in the browser you have, so that browser's privacy rules apply. |
| The push service of your device or browser (Google, Apple, Mozilla) | Only that a notification is being delivered. The content is encrypted before it leaves the server. Only if you turn notifications on. |
| Cloudflare | Technical connection data (such as the IP address), because the site is protected by their network. |
| Mistral AI (EU), rarely OpenAI or Anthropic | What you type to the built-in assistant, if you use it. It can be switched off in the profile settings. |

If you want to see exactly what the service says, read its policy at <https://app.vallaury.it/privacy>. For questions or
requests about your data write to <privacy@vallaury.it>.

## This repository

The repository holds source code and store texts only. It contains no user data, no keys and no secrets. Issues and pull
requests are public: do not put personal data in them.
