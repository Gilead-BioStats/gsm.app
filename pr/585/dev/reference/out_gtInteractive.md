# Interactive gt Table

Interactive gt Table

## Usage

``` r
out_gtInteractive(gt_object, selection_mode = "single")
```

## Arguments

- gt_object:

  A [`gt::gt()`](https://gt.rstudio.com/reference/gt.html) object to use
  interactively.

- selection_mode:

  *Allow row selection*

  `scalar<character>` // *default:* `NULL`

  The `selection_mode` options allows users to select rows by clicking
  them. When this option is `"single"`, clicking another value toggles
  selection of the previously selected row off. When this option is
  `"multiple"`, multiple rows can be selected at once. Selected values
  are available in Shiny apps when `selection_mode` is not `NULL` and
  the table is used in
  [`render_gt()`](https://gt.rstudio.com/reference/render_gt.html).

## Value

A [`gt::gt()`](https://gt.rstudio.com/reference/gt.html) with our
standard options.
