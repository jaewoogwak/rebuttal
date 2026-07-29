#!/usr/bin/env python3
"""Render the seed-3495 segment/frame fusion SumR sweep."""

import argparse
from pathlib import Path

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt


WEIGHTS = [0.60, 0.65, 0.70, 0.75, 0.80, 0.85, 0.90]
RESULTS = {
    "ActivityNet": [181.8, 182.7, 183.3, 183.9, 184.7, 183.9, 184.5],
    "TVR": [228.6, 229.9, 231.2, 232.1, 232.6, 232.6, 232.8],
    "Qvhighlights": [238.3, 239.9, 241.4, 241.5, 243.5, 243.3, 243.2],
}
COLORS = {"ActivityNet": "#1f77b4", "TVR": "#d62728", "Qvhighlights": "#2ca02c"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    args.output.parent.mkdir(parents=True, exist_ok=True)
    fig, ax = plt.subplots(figsize=(7.4, 4.4), constrained_layout=True)
    for dataset, values in RESULTS.items():
        ax.plot(
            WEIGHTS,
            values,
            marker="o",
            markersize=5,
            linewidth=2.1,
            label=dataset,
            color=COLORS[dataset],
        )

    ax.set_xlabel("Segment branch weight")
    ax.set_ylabel("SumR")
    ax.set_xticks(WEIGHTS)
    ax.set_xlim(0.59, 0.91)
    ax.grid(axis="y", color="#d9d9d9", linewidth=0.8)
    ax.spines[["top", "right"]].set_visible(False)
    ax.legend(frameon=False, ncol=3, loc="lower right")
    fig.savefig(args.output, dpi=300, bbox_inches="tight")


if __name__ == "__main__":
    main()
