import json
import re
import urllib.request
from pathlib import Path


SOURCE_URL = "https://pccs.ssltrus.cn/oss-code-sign-client/latest.json"
REQUIRED = [
    (1, "darwin/amd64"),
    (1, "darwin/arm64"),
    (2, "darwin/amd64"),
    (2, "darwin/arm64"),
]


def load_releases():
    with urllib.request.urlopen(SOURCE_URL, timeout=30) as response:
        releases = json.load(response)

    selected = {}
    for release in releases:
        key = (release.get("type"), release.get("platform"))
        if key in REQUIRED:
            selected[key] = release

    missing = [key for key in REQUIRED if key not in selected]
    if missing:
        raise SystemExit(f"Missing macOS release metadata: {missing}")

    versions = {selected[key]["version"] for key in REQUIRED}
    if len(versions) != 1:
        raise SystemExit(f"Mismatched release versions: {sorted(versions)}")

    for key in REQUIRED:
        release = selected[key]
        url = release.get("url", "")
        sha256 = release.get("sha256", "")
        if not url.startswith("https://pccs.ssltrus.cn/"):
            raise SystemExit(f"Unexpected release URL: {url}")
        if not url.endswith(".zip"):
            raise SystemExit(f"Release URL is not a ZIP archive: {url}")
        if not re.fullmatch(r"[0-9a-fA-F]{64}", sha256):
            raise SystemExit(f"Invalid SHA-256: {sha256}")

    return selected, next(iter(versions)).removeprefix("v")


def update_file(path, version, release_by_arch):
    file_path = Path(path)
    content = file_path.read_text()
    content, count = re.subn(
        r'(\bversion ")[^"]+(")',
        rf"\g<1>{version}\g<2>",
        content,
        count=1,
    )
    if count != 1:
        raise SystemExit(f"Could not update version in {path}")

    for arch, release in release_by_arch.items():
        pattern = (
            rf'(on_{arch} do\n\s+url ")[^"]+("\n'
            rf'\s+sha256 ")[^"]+("\n\s+end)'
        )
        replacement = (
            rf'\g<1>{release["url"]}\g<2>{release["sha256"]}\g<3>'
        )
        content, count = re.subn(pattern, replacement, content, count=1)
        if count != 1:
            raise SystemExit(f"Could not update {arch} metadata in {path}")

    file_path.write_text(content)


def main():
    selected, version = load_releases()
    update_file(
        "Formula/code-sign-cli.rb",
        version,
        {
            "arm": selected[(1, "darwin/arm64")],
            "intel": selected[(1, "darwin/amd64")],
        },
    )
    update_file(
        "Casks/code-sign-gui.rb",
        version,
        {
            "arm": selected[(2, "darwin/arm64")],
            "intel": selected[(2, "darwin/amd64")],
        },
    )
    print(f"Updated Homebrew packages to {version}")


if __name__ == "__main__":
    main()
