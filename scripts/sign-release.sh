#!/usr/bin/env bash
# Signs the unsigned release APK with your own key, in the way F-Droid can reproduce.
#
#   ANDROID_HOME=... KEYSTORE=key.jks KEY_ALIAS=alias ./scripts/sign-release.sh [output.apk]
#
# The password is read from the terminal, or from the file named in KEYSTORE_PASS_FILE.
set -euo pipefail
cd "$(dirname "$0")/.."

: "${ANDROID_HOME:?set ANDROID_HOME}" "${KEYSTORE:?set KEYSTORE}" "${KEY_ALIAS:?set KEY_ALIAS}"
unsigned=app/build/outputs/apk/release/app-release-unsigned.apk
out="${1:-vallaury-$(sed -n "s/.*versionName '\(.*\)'.*/\1/p" app/build.gradle).apk}"
tools="$(ls -d "$ANDROID_HOME"/build-tools/* | sort -V | tail -n 1)"

[ -f "$unsigned" ] || ./gradlew :app:assembleRelease
cp "$unsigned" "$out"

pass_args=()
[ -n "${KEYSTORE_PASS_FILE:-}" ] && pass_args=(--ks-pass "file:$KEYSTORE_PASS_FILE")

# --alignment-preserved keeps the zip layout of the unsigned APK, which is what lets F-Droid
# copy this signature onto its own build and check that the two match.
"$tools/apksigner" sign --alignment-preserved true --ks "$KEYSTORE" --ks-key-alias "$KEY_ALIAS" "${pass_args[@]}" "$out"
"$tools/apksigner" verify --print-certs "$out" | grep -E "SHA-256|Signer"
echo "Signed: $out"
