# Inline virtual select input

Inline virtual select input

## Usage

``` r
mod_InlineSelect_UI(
  id,
  strLabel = NULL,
  chrChoices = "",
  chrSelected = NULL,
  ...
)
```

## Arguments

- id:

  `character` The id for this element.

- strLabel:

  `character` The initial label for the select input.

- chrChoices:

  `character` A (named, optionally) vector of choices for this input.

- chrSelected:

  `character` The initially selected value (or multiple values if
  multiple = TRUE). If not specified then defaults to the first value
  for single-select lists and no values for multiple select lists.

- ...:

  Additional parameters passed on to
  [`shinyWidgets::virtualSelectInput()`](https://dreamrs.github.io/shinyWidgets/reference/virtualSelectInput.html).

## Value

A
[`htmltools::span()`](https://rstudio.github.io/htmltools/reference/builder.html)
element containing necessary elements for an inline
[`shinyWidgets::virtualSelectInput()`](https://dreamrs.github.io/shinyWidgets/reference/virtualSelectInput.html).
