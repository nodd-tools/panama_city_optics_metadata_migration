# panama-city-metadata-migration

## Purpose

This repository houses the code, queries, and mapping files required to migrate the Panama City lab's legacy relational database into a standardized, ISO 19115-2 compliant format. 

The data extracted and transformed by the processes in this repository are designed to conform to the 5-table relational CSV metadata schema (`schema.md`), which can then be processed by the [nmfs-optics-metadata-tool](https://github.com/csbrown-noaa/nmfs-optics-metadata-tool) to generate final ISO XML metadata records.

## Context and Workflow

Currently, the Panama City lab's metadata is stored in a legacy database that relies on auto-incrementing integer IDs, localized vocabularies (e.g., internal vessel or sensor names), malformed temporal strings, and lacks strictly required ISO fields (like event-specific abstracts).

Instead of immediately modifying the upstream legacy database schema, this repository implements an intermediate **ETL and Mapping Pipeline**. The workflow is as follows:

1. **Extraction**: Raw data is pulled from the legacy database using SQL queries into baseline CSV files (`events.csv`, `platforms.csv`, `sensors.csv`, `variables.csv`).
2. **Crosswalk Mapping**: Legacy values are mapped to global standards using static CSV crosswalk files. This includes:
   - Translating integer IDs to UUIDv4s.
   - Mapping localized platform names to ICES or IMO registries.
   - Mapping sensor names to GCMD keywords.
   - Translating human-readable variables and units to CF Standard Names and UDUNITS.
   - Resolving unstructured dataset payloads to their respective legacy event IDs.
3. **Transformation**: Scripts apply these mappings to the raw extracts to produce the final, compliant CSVs ready for XML generation.

## Repository Contents

*   **`sql/`**: Contains the raw SQL queries used to extract the initial `events.csv`, `platforms.csv`, `sensors.csv`, and `variables.csv` from the legacy database.
*   **`raw_extracts/`**: Contains samples or the `head` of the extracted CSVs to document the legacy data state.
*   **`mappings/`**: The definitive CSV crosswalk files maintained by domain experts (e.g., UUID maps, platform registry crosswalks, unstructured data join maps).
*   **`scripts/`**: Helper Python/Bash scripts used to generate UUIDs, clean timestamps, build crosswalk templates, or apply the mappings to the raw SQL extracts.

## Disclaimer

This repository is a scientific product and is not official communication of the National Oceanic and
Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project
code is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the
Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub
project will be governed by all applicable Federal law. Any reference to specific commercial products,
processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or
imply their endorsement, recommendation or favoring by the Department of Commerce. The Department
of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to
imply endorsement of any commercial product or activity by DOC or the United States Government.
