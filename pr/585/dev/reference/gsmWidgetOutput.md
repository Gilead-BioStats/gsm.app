# Pick Up Dependencies for Rendered Output

Pick Up Dependencies for Rendered Output

## Usage

``` r
gsmWidgetOutput(
  strWidgetName,
  outputId,
  width = "100%",
  height = "400px",
  excludes = character(),
  ...
)
```

## Arguments

- strWidgetName:

  `character` The name of a widget in the gsm package.

- outputId:

  output variable to read from

- width, height:

  Must be a valid CSS unit (like `"100%"`, `"400px"`, `"auto"`) or a
  number, which will be coerced to a string and have `"px"` appended.

- excludes:

  An optional vector of named dependencies to *not* include.

- ...:

  Arguments passed on to
  [`htmlwidgets::shinyWidgetOutput`](https://rdrr.io/pkg/htmlwidgets/man/htmlwidgets-shiny.html)

  `inline`

  :   use an inline (`span()`) or block container (`div()`) for the
      output

  `reportSize`

  :   Should the widget's container size be reported in the shiny
      session's client data?

  `fill`

  :   whether or not the returned tag should be treated as a fill item,
      meaning that its `height` is allowed to grow/shrink to fit a fill
      container with an opinionated height (see
      [`htmltools::bindFillRole()`](https://rstudio.github.io/htmltools/reference/bindFillRole.html)
      for more). Examples of fill containers include
      [`bslib::card()`](https://rstudio.github.io/bslib/reference/card.html)
      and
      [`bslib::card_body_fill()`](https://rstudio.github.io/bslib/reference/deprecated.html).

## Value

A
[`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)
with the
[`htmlwidgets::shinyWidgetOutput()`](https://rdrr.io/pkg/htmlwidgets/man/htmlwidgets-shiny.html)
and its dependencies.
