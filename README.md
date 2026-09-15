# WinX Studio

WinX Studio is a browser-based visual builder for Home Assistant-powered Rainmeter desktop widgets on Windows.

## Live demo

Open the deployed app here: https://azuluno.github.io/winxstudio/

The app entry point in this repository is `index.html`. You can open it directly from the GitHub file list by clicking `index.html`, or use the Live demo link for the full GitHub Pages site.

## Features

- Visual canvas with drag, resize, multi-select, alignment, and layer ordering
- Home Assistant Light, Switch, Button, Sensor, Slider, Arc, Container, Shape, and Text assets
- Live Home Assistant state polling and service controls
- Material Symbols icon picker
- Per-widget colors, typography, opacity, radius, and sizing
- Import/export editable `.winx.json` projects
- Validation and Rainmeter `.ini` source export
- Rainmeter skin-folder ZIP packaging helper
- Light and dark themes
- GitHub Pages deployment

## Run locally

No build tools are required. Open `index.html` in a browser, or serve the folder with a local server:

```powershell
py -m http.server 8080
```

Then open `http://localhost:8080`.

A local server is recommended for Home Assistant API access because browser requests from `file://` pages can be blocked by CORS policy.

## Package a Rainmeter skin

Use **Package helper** in the editor to download a ZIP containing the generated skin folder, `Variables.inc`, `Measures.inc`, `Actions.inc`, and a setup README. This is intentionally a ZIP bundle rather than a renamed `.rmskin`: Rainmeter validates `.rmskin` metadata and requires packages to be created with its official Skin Packager.

To finish the package:

1. Open Rainmeter Manage.
2. Choose **Create .rmskin package...**.
3. Add the extracted `Living room climate` folder as the root config folder.
4. Create and install the `.rmskin` package.

Keep `HAToken` set only on the target computer. Do not distribute tokens in a skin package.

## Home Assistant setup

1. In Home Assistant, create a long-lived access token from your user profile.
2. Open **Connection** in WinX Studio.
3. Enter the Home Assistant host/IP, port, and token.
4. Press **Test connection**, then save the connection.
5. Add an asset, select its Home Assistant domain, and enter its complete entity ID, for example `light.living_room`.

The token is stored in browser local storage for this prototype. Do not publish exported connection data or screenshots containing the token. Generated Rainmeter source intentionally uses `HAToken=SET_IN_RAINMETER_ENVIRONMENT` instead of embedding the secret.

For a deployed site, configure Home Assistant CORS to allow the site origin. HTTPS pages generally cannot call an HTTP Home Assistant URL because of browser mixed-content rules.

## GitHub Pages

This repository is a static site and uses the workflow in `.github/workflows/pages.yml`.

1. Create a GitHub repository named `winxstudio`.
2. Set it to public or private according to your preference.
3. Push the contents of this folder to the `main` branch.
4. In GitHub, open **Settings > Pages** and choose **GitHub Actions** as the source.
5. The workflow will publish the site at `https://YOUR-USERNAME.github.io/winxstudio/`.

Private repositories may require a GitHub plan that supports Pages for private repositories. A public repository is simplest for a public demo, but never commit Home Assistant tokens or private configuration.

## Repository structure

```text
winxstudio/
├── .github/
│   └── workflows/
│       └── pages.yml
├── .gitignore
├── Rainmeter/
│   └── WinXStudio/
│       ├── HomeAssistantToggle.ini
│       ├── HomeAssistantService.ps1
│       └── README.txt
├── index.html
└── README.md
```

## License

Add the license you want to use before publishing. MIT is a common choice for open-source projects, but the repository owner should choose the terms.
