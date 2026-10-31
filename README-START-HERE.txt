BATTLEFIELD SANDBOX - ANDROID PROJECT
=====================================
Open the file GUIDE.html (delivered next to this ZIP) and follow it step by step.

Short version:
  1. Make a PRIVATE repository on github.com and upload everything in this folder.
  2. Settings > Secrets and variables > Actions: add the 4 secrets from SIGNING-SECRETS.txt.
  3. Actions > "Build Android APK" > Run workflow. After ~10 minutes download the
     "BattlefieldSandbox-release-signed" artifact: that .apk is the file for Myket.

Change version / package name:  edit app.properties  (VERSION_CODE must go up by 1 every release).
The signing key is NOT in this folder on purpose.
