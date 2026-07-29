#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="${ROOT_DIR}/build"
RENDER_DIR="${ROOT_DIR}/rendered"
PYTHON_BIN="${PYTHON_BIN:-/venv/prvr/bin/python}"

rm -rf "${BUILD_DIR}" "${RENDER_DIR}"
mkdir -p "${BUILD_DIR}" "${RENDER_DIR}"

"${PYTHON_BIN}" "${ROOT_DIR}/plot_fusion_sweep.py" --output "${RENDER_DIR}/fusion_sweep_sumr.png"
cd "${ROOT_DIR}"
pdflatex -interaction=nonstopmode -halt-on-error \
  -output-directory "${BUILD_DIR}" "${ROOT_DIR}/tables.tex" >/dev/null
cp "${BUILD_DIR}/tables.pdf" "${RENDER_DIR}/rebuttal_results.pdf"
pdftoppm -png -r 180 "${BUILD_DIR}/tables.pdf" "${RENDER_DIR}/tables"
