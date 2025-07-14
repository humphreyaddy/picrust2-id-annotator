# PICRUSt2 ID Annotator

This tool annotates functional IDs (KO, EC, Pfam, COG, TIGRFAM, etc.) from PICRUSt2 outputs using official mapfiles.

## ✅ Features
- Supports any combination of PICRUSt2 mapfiles (`*.gz`, `*.txt`, `*.tsv`)
- Works with KEGG, MetaCyc, Pfam, GO, TIGRFAM, and more
- Easy to run in Bash

## 📦 Requirements
- Bash
- Standard tools: grep, cut, tail, head

## 🚀 Usage

```bash
bash annotate_ids.sh example/ID_FILE.csv mapfiles/ko_name.txt.gz mapfiles/ec_name.txt.gz
```

## 📥 Optional: Download Mapping Files

```bash
bash download_mapfiles.sh
```

## 🧪 Example

See the `example/` folder for a test file.
