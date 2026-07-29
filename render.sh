#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="${ROOT_DIR}/build"
RENDER_DIR="${ROOT_DIR}/rendered"
PYTHON_BIN="${PYTHON_BIN:-/venv/prvr/bin/python}"

rm -rf "${BUILD_DIR}" "${RENDER_DIR}"
mkdir -p "${BUILD_DIR}" "${RENDER_DIR}"

"${PYTHON_BIN}" "${ROOT_DIR}/plot_fusion_sweep.py" --output "${RENDER_DIR}/figure-1-sumr.png"
cd "${ROOT_DIR}"
for index in 0 1 2 3 4 5 6 7 8; do
  table=$((index + 1))
  pdflatex -interaction=nonstopmode -halt-on-error \
    -jobname "table-${table}" -output-directory "${BUILD_DIR}" \
    "\\def\\TABLE{${index}}\\input{${ROOT_DIR}/individual_tables.tex}" >/dev/null
  pdftocairo -png -singlefile -r 200 \
    "${BUILD_DIR}/table-${table}.pdf" "${RENDER_DIR}/table-${table}"
  "${PYTHON_BIN}" "${ROOT_DIR}/crop_whitespace.py" "${RENDER_DIR}/table-${table}.png"
done
