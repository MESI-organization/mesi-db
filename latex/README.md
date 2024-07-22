---
editor_options: 
  markdown: 
    wrap: 72
---

## Citing original publications

### How to create a references table

The Rmarkdown file `vignettes/cite_mesi.Rmd` provides an example for how
to create a latex-formatted table with bibtex citation keys that point
to original publications for each experiment. This is created based on
meta information provided by mesi-db. For an example of how this looks,
you can render `vignettes/example.tex` or have a look at
`vignettes/example.pdf`.

## How to add references

All citation information is contained in `latex/mesi.bib`. This file was
created originally using Zotero. If additional experiments' original
citations are to be added (some are still missing), follow the following
steps:

-   Create a new *Library* in Zotero by importing the file
    `latex/mesi.bib`.

-   Add a new entry to this Zotero *Library*, using information from
    `data/mesi_bibliography.csv` of the respective experiment (column
    `full_reference`).

-   Generate custom citation keys of this Zotero *Library* that match
    the citation column in `data/mesi_bibliography.csv`:

    1.  Download *better-bibtex* plugin for Zotero
        [here](https://retorque.re/zotero-better-bibtex/).
    2.  Generate bibtex citation key string (following
        [documentation](https://retorque.re/zotero-better-bibtex/citing/index.html))
        by entering in the terminal:\
        `authEtAl("*",false,"*").lower.replace("etal","et_al") + "_*" + year`
    3.  Resolve edge cases manually. For edge cases use the following
        expression in the Zotero field ‘extra’
        `Citation Key: <your citekey>` <your citekey>. This should match
        the `mesi_bibliography.csv` column `citation`:
        1.  author name includes ä , ö , ü \| ä = ae , ö =oe , ü = ue
        2.  exactly two authors \| add ‘*and’ between the two authors*
        3.  author name consists of multiple words eg. Van Kulen, De
            Jong ec. \| add ‘\*’ between the words

-   Export Zotero *Library* to bibtex (.bib) and make sure that the
    bibtex key is identical to the column `citation` in
    `mesi_bibliography.csv`
