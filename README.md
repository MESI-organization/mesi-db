# MESI database

*Manipulation Experiments Synthesis Initiative*

terrestrial global change experiment database:

effects of experimental eCO2, warming, nutrient addition and/or water addition/removal on carbon and nutrient cycle related variables

## files included
- mesi_main.csv: main table, with experimental global change effect on measured response variable specified per row, and ancillary site, study & experiment information
- mesi_soil.csv: ancillary soil data per study
- mesi_bibliography.csv: full citation of references in main and soil tables
- mesi_metadata.csv
- mesi_response_variable_abbreviations.csv: explanation of abbreviations used for response variables in mesi_main.csv
- mesi_template.csv: empty table for data contributions, with main table headers
- mesi_methods_comments.csv: table with methodological information on how response variables were measured per data point, and further comments for data interpretation

- wide_long_conversion.R: code for converting the default main table from wide to long data format
