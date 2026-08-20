# Clickable KRI Count Pills

Clickable KRI Count Pills

## Usage

``` r
mod_RAGPillSet_UI(id, intRed = NULL, intAmber = NULL, strLabel = "KRIs")
```

## Arguments

- id:

  `character` The id for this element.

- intRed:

  `integer` The number of groups with at least one red flag.

- intAmber:

  `integer` The number of groups with at least one amber flag.

- strLabel:

  `character` The label of a field.

## Value

A
[`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)
of
[`mod_TogglePill_UI()`](https://gilead-biostats.github.io/gsm.app/dev/reference/mod_TogglePill_UI.md)
items, one for red flags, and one for amber flags.
