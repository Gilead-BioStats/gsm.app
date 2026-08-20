# Shiny bindings for Widgets

**\[stable\]**

Output and render functions for using Widgets within Shiny applications
and interactive Rmd documents.

## Usage

``` r
Widget_PlotOutput(strWidgetName, outputId, width = "100%", height = "400px")

renderWidgetPlot(expr, fn_WidgetOutput, env = parent.frame(), quoted = FALSE)
```

## Arguments

- strWidgetName:

  `character` The name of a widget in the gsm package.

- outputId:

  output variable to read from

- width, height:

  Must be a valid CSS unit (like `'100%'`, `'400px'`, `'auto'`) or a
  number, which will be coerced to a string and have `'px'` appended.

- expr:

  An expression that generates a Widget_ScatterPlot

- env:

  The environment in which to evaluate `expr`.

- quoted:

  Is `expr` a quoted expression (with
  [`quote()`](https://rdrr.io/r/base/substitute.html))? This is useful
  if you want to save an expression in a variable.
