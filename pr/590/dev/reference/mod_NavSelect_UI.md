# Navigation Select Input UI

Navigation Select Input UI

## Usage

``` r
mod_NavSelect_UI(id, chrChoices, strLabel = NULL)
```

## Arguments

- id:

  `character` The id for this element.

- chrChoices:

  `character` A (named, optionally) vector of choices for this input.

- strLabel:

  `character` The initial label for the select input.

## Value

A
[`bslib::nav_item()`](https://rstudio.github.io/bslib/reference/nav-items.html)
with a formatted
[`shinyWidgets::virtualSelectInput()`](https://dreamrs.github.io/shinyWidgets/reference/virtualSelectInput.html).
