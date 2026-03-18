# Toggle Pill Module UI

Toggle Pill Module UI

## Usage

``` r
mod_TogglePill_UI(id, strLabel, strColorCode)
```

## Arguments

- id:

  `character` The id for this element.

- strLabel:

  `character` The label of a field.

- strColorCode:

  `character` The hex code (such as `"#FFFFFF"`) for a color.

## Value

A
[`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)
with a specialized
[`shiny::actionLink()`](https://rdrr.io/pkg/shiny/man/actionButton.html)
and the necessary CSS and JavaScript to manage the link.
