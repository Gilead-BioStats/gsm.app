# Prepare data for prevalence plots

Prepare data for prevalence plots

## Usage

``` r
PreparePrevalenceData(df, strGroupLevel, strLevel)
```

## Arguments

- df:

  `data.frame` A data frame to wrangle.

- strGroupLevel:

  `character` Value for the group level. Default: `NULL` and taken from
  `dfMetrics$GroupLevel` if available.

- strLevel:

  `character` The grouping level for this data (one of `"Study"`,
  `"Group"` or `"Participant"`, generally).

## Value

The prepared `data.frame`, or `NULL`.
