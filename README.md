# SPOT Rebuttal Results

This repository contains the rebuttal result tables and rendered images for
SPOT. The canonical refreshed experiments use seed `3495` and token-77 CLIP
query features.

## Contents

- `tables.tex`: standalone LaTeX source for all tables and statistics.
- `render.sh`: rebuilds the PDF and page PNGs.
- `rendered/`: tracked PDF and PNG table pages after rendering.

## Rebuild

```bash
bash render.sh
```

The rendering command requires `pdflatex` and `pdftoppm`.

## Notes

- The shared-boundary U1/U2 experiments use seed `3495` on ACT, TVR, QVH,
  and Charades.
- The GT-timestamp partition ablation is an earlier seed-9527 result and is
  labeled separately in the tables.
- The `SPOT + pseudo Soft MIL` run in the seed-3495 partition table is an
  anomalous result (`Rsum 75.4`) and should be rerun before submission.
