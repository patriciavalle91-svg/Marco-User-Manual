# Relationship v1.0

This project builds a real macOS app with seven click-through screens. The manual opens in its own Mac app window, not in a browser. GitHub Actions compiles Intel and Apple silicon versions, combines them into one universal app, and publishes a ZIP in Releases.

## Add your video

For a video under 25 MB, put it in `video` and name it `marco-message.mp4` before uploading the project. For a larger video, do not add it to the normal file upload. GitHub's normal browser uploader has a 25 MB limit, while each release asset can be under 2 GiB ([GitHub documentation](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases)).

For a large video, first upload the project files without the MP4. Then open **Releases → Draft a new release**, create a tag named `video-source`, attach the MP4 using the exact filename `marco-message.mp4`, and publish the release. The workflow will download that release asset and include it in the app.

The repository and its release assets are public. Anyone can download the video, so only publish it there if you are comfortable with that. If no video is included, the app shows a reminder at the end instead.

## Put the project on GitHub

1. Create a public repository on GitHub, for example `Marco-User-Manual`.
2. Use **Add file → Upload files** to upload `index.html`, `README.md`, and the folders `assets` and `video`. The `assets` folder contains the large, visible monitor photo on screen 2. Do not include a video larger than 25 MB in this upload. Commit the changes.
3. Add the native Mac app source: choose **Add file → Create new file**, name it `macos/MarcoLauncher.swift`, copy the complete contents of `macos/MarcoLauncher.swift` from this project into the editor, then commit.
4. Add the GitHub workflow: choose **Add file → Create new file**, name it `.github/workflows/build-macos.yml`, copy the complete contents of `.github/workflows/build-macos.yml` from this project into the editor, then commit.

If you already added an earlier version of `build-macos.yml`, open it, choose Edit, replace its contents with the current file from this project, and commit. This updated workflow builds a native app window.

## Generate the app ZIP

If your video is larger than 25 MB, create and publish the `video-source` release first (steps above).

1. Open the repository’s **Actions** tab.
2. Choose **Build and publish Mac app** on the left, then **Run workflow → Run workflow**.
3. Wait for the run to finish successfully. The workflow will publish a Release containing `Marco-User-Manual-macOS.zip`.
4. Open **Releases** and download that ZIP. Send it to Marco.

If GitHub says the workflow cannot publish a Release, open **Settings → Actions → General → Workflow permissions**, enable read and write permissions, and run the workflow again.

## The seven screens

1. Anniversary greeting.
2. Operating conditions with a large, visible monitor photo above the text.
3. Undocumented features: the good things about Marco.
4. Known bugs.
5. Retro terminal: Marco types `help` to reveal the troubleshooting commands.
6. Final diagnostic.
7. Your video.

## What Marco does

1. Unzip `Marco-User-Manual-macOS.zip`.
2. Drag `Marco User Manual.app` to **Applications**.
3. Open it. The manual appears in its own resizable app window. The video plays at the end when he clicks the final button.

The app is unsigned because it was built without a paid Apple Developer account. macOS may block the first launch. If so, Marco can try opening it once, then choose **System Settings → Privacy & Security → Open Anyway**. Button names vary by macOS version.

## Update the message later

Edit `index.html` on GitHub and commit the change. Then open **Actions** and run **Build and publish Mac app** again. The new ZIP will appear in **Releases**.
