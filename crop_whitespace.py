#!/usr/bin/env python3
"""Crop white page margins from a rendered PNG."""

import argparse
from pathlib import Path

from PIL import Image, ImageChops


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("path", type=Path)
    parser.add_argument("--padding", type=int, default=18)
    args = parser.parse_args()

    image = Image.open(args.path).convert("RGB")
    background = Image.new("RGB", image.size, "white")
    bbox = ImageChops.difference(image, background).getbbox()
    if bbox is None:
        raise RuntimeError(f"No visible content found in {args.path}")

    left, top, right, bottom = bbox
    padding = args.padding
    cropped = image.crop(
        (
            max(0, left - padding),
            max(0, top - padding),
            min(image.width, right + padding),
            min(image.height, bottom + padding),
        )
    )
    cropped.save(args.path)


if __name__ == "__main__":
    main()
