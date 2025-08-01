# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "requests",
# ]
# ///
import argparse
import pathlib

import requests


def main(name: str) -> None:
    """Downloads a game file from classicreload.com.

    Args:
        name: Name part of the CDROM.zip URL to download.
    """
    url = f"https://vfat.classicreload.com/{name}/CDROM.zip"
    headers = {
        "Referer": "https://classicreload.com/",
        "Origin": "https://classicreload.com",
        "User-Agent": (
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36"
            " (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36"
        ),
        "Accept-Encoding": "gzip, deflate, br, zstd",
        "Accept": "*/*",
    }

    response = requests.get(url, headers=headers, stream=True, timeout=30)
    response.raise_for_status()

    with pathlib.Path("CDROM.zip").open("wb") as f:
        f.writelines(response.iter_content(chunk_size=8192))

    print("Download complete.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Downloads a game file from classicreload.com.")
    parser.add_argument("name", help="Name part of the CDROM.zip URL to download")
    args = parser.parse_args()
    main(args.name)
