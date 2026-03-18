# Adapt a gsm widget for use here

This should go away eventually by making sure everything from gsm is
compatible here.

## Usage

``` r
Widget_Plot(id, strWidgetName, ...)
```

## Arguments

- id:

  `character` The id for this element.

- strWidgetName:

  `character` The name of a widget in the gsm package.

- ...:

  Additional parameters passed on to the widget as JSON.

## Value

An htmlwidget object as created by
[`htmlwidgets::createWidget()`](https://rdrr.io/pkg/htmlwidgets/man/createWidget.html).
