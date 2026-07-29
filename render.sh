#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="${ROOT_DIR}/build"
RENDER_DIR="${ROOT_DIR}/rendered"

rm -rf "${BUILD_DIR}" "${RENDER_DIR}"
mkdir -p "${BUILD_DIR}" "${RENDER_DIR}"

pdflatex -interaction=nonstopmode -halt-on-error \
  -output-directory "${BUILD_DIR}" "${ROOT_DIR}/tables.tex" >/dev/null
cp "${BUILD_DIR}/tables.pdf" "${RENDER_DIR}/rebuttal_results.pdf"
pdftoppm -png -r 180 "${BUILD_DIR}/tables.pdf" "${RENDER_DIR}/tables"
