# List of ActionLinks Server

The server component for
[`mod_ActionList_UI()`](https://gilead-biostats.github.io/gsm.app/dev/reference/mod_ActionList_UI.md).
This server keeps track of which link was most recently clicked.

## Usage

``` r
mod_ActionList_Server(id, chrLinkIDs)
```

## Arguments

- id:

  `character` The id for this element.

- chrLinkIDs:

  `character` Module ids for multiple modules.

## Value

A
[`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
with the id of the most recently clicked link.
