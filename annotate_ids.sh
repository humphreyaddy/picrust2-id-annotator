#!/bin/bash

ID_FILE="$1"
shift
MAPFILES=("$@")

OUTPUT_FILE="${ID_FILE%.*}_with_annotations.csv"
TEMP_FILE="temp_ids.csv"

cp "$ID_FILE" "$TEMP_FILE"

HEADER=$(head -n1 "$TEMP_FILE")
echo -n "$HEADER" > "$OUTPUT_FILE"

for mapfile in "${MAPFILES[@]}"; do
    COL_NAME=$(basename "$mapfile" | sed 's/.gz//' | sed 's/.txt//' | sed 's/.tsv//' | sed 's/_name//' | sed 's/_info//' )
    echo -n ",${COL_NAME}_desc" >> "$OUTPUT_FILE"
done
echo "" >> "$OUTPUT_FILE"

tail -n +2 "$TEMP_FILE" | while IFS=',' read -r line; do
    ID=$(echo "$line" | cut -d',' -f1)
    OUTPUT="$line"

    for mapfile in "${MAPFILES[@]}"; do
        DESC=""
        if [[ "$mapfile" == *.gz ]]; then
            DESC=$(zgrep -P "^$ID	" "$mapfile" | head -n1 | cut -f2-)
        else
            DESC=$(grep -P "^$ID	" "$mapfile" | head -n1 | cut -f2-)
        fi
        [[ -z "$DESC" ]] && DESC=""
        OUTPUT="$OUTPUT,"$DESC""
    done
    echo "$OUTPUT" >> "$OUTPUT_FILE"
done

rm "$TEMP_FILE"
echo "✅ Annotation complete: $OUTPUT_FILE"
