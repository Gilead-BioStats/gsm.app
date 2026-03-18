# Prepare the final prevalence data for plotting

Prepare the final prevalence data for plotting

## Usage

``` r
PreparePrevalenceCounts(dfDomain_Combined, strCategory, chrTopValues)
```

## Arguments

- dfDomain_Combined:

  `data.frame` Values of `strCategory` for each `VizLevel`.

- chrTopValues:

  `character` The values to show (other values will be wrapped into
  "Other").

## Value

A ready-to-plot data.frame.
