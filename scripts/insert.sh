#!/usr/bin/env bash
set -euo pipefail
if [[ $# -lt 2 || $# -gt 3 ]]; then
  echo "Usage: $0 <data_dir> <graph_name> [server_url]" >&2
  exit 1
fi
data_dir=$1
graph_name=$2
server_url=${3:-redis://127.0.0.1:6379}
vertex_csv="$data_dir/Vertex.csv"
if [[ ! -d "$data_dir" ]]; then
  echo "Data directory not found: $data_dir" >&2
  exit 1
fi
if [[ ! -f "$vertex_csv" ]]; then
  echo "Node CSV not found: $vertex_csv" >&2
  exit 1
fi
shopt -s nullglob
args=(-n "$vertex_csv")
for csv in "$data_dir"/*.csv; do
  [[ "$csv" == "$vertex_csv" ]] && continue
  args+=(-r "$csv")
done
exec falkordb-bulk-insert "$graph_name" \
  -u "$server_url" \
  "${args[@]}" \
  -i "Vertex:id" \
  -j INTEGER \
  --verbose
