# Build the gsm.viz bars spec for the prevalence plot

The predecessor overlaid the three `VizLevel` series at one y position
and told them apart by bar width. `bars` has no per-series width
control, so the series would fully occlude each other under
`position = "identity"`; dodge carries the same comparison with position
instead of width.

## Usage

``` r
BuildPrevalenceSpec(strCategory)
```

## Arguments

- strCategory:

  `character` A category to focus on.

## Value

A
[`gsm.vizr::bars_spec()`](https://gilead-public.github.io/gsm.vizr/reference/bars_spec.html)
list.
