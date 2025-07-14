#!/bin/bash

mkdir -p mapfiles
cd mapfiles

BASE_URL="https://github.com/picrust/picrust2/tree/master/picrust2/default_files/description_mapfiles"

wget "$BASE_URL/ko_name.txt.gz"
wget "$BASE_URL/ec_name.txt.gz"
wget "$BASE_URL/metacyc-pwy_name.txt.gz"
wget "$BASE_URL/pfam_name.txt.gz"
wget "$BASE_URL/cog_info.tsv.gz"
wget "$BASE_URL/tigrfam_info.tsv.gz"
wget "$BASE_URL/ko_info.tsv.gz"
wget "$BASE_URL/pfam_info.tsv.gz"
wget "$BASE_URL/KEGG_modules_info.tsv.gz"
wget "$BASE_URL/KEGG_pathways_info.tsv.gz"
wget "$BASE_URL/map_go_name.txt.gz"
wget "$BASE_URL/ec_level4_info.tsv.gz"
wget "$BASE_URL/metacyc_pathways_info.txt.gz"

echo "Mapfiles were downloaded to $(pwd)"
