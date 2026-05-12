docker run --rm -it \
  -p 127.0.0.1:6379:6379 \
  -p 127.0.0.1:3000:3000 \
  -v "$(pwd)/data":/data \
  -e FALKORDB_ARGS="CACHE_SIZE 1 VKEY_MAX_ENTITY_COUNT 1000000000 IMPORT_FOLDER /data" \
  falkordb/falkordb:latest
