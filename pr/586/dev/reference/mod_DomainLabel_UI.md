# Domain Tab Label UI

Domain Tab Label UI

## Usage

``` r
mod_DomainLabel_UI(id, strDomainLabel, strDomainID)
```

## Arguments

- id:

  `character` The id for this element.

- strDomainLabel:

  `character` The domain name to display. For example, for ID `"AE"`,
  the label is `"Adverse Events"`. Can also be a
  [`shiny::uiOutput()`](https://rdrr.io/pkg/shiny/man/htmlOutput.html)
  which renders to an inline string.

- strDomainID:

  `character` The domain data.frame to load.

## Value

A [`shiny::HTML()`](https://rdrr.io/pkg/shiny/man/reexports.html) that
includes a dynamic
[`shiny::uiOutput()`](https://rdrr.io/pkg/shiny/man/htmlOutput.html)
with the count of rows in this domain.
