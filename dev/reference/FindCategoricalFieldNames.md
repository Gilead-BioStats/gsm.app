# Find categorical fields in a data frame

Find categorical fields in a data frame

## Usage

``` r
FindCategoricalFieldNames(
  df,
  chrExcludes = c("SubjectID", "GroupID", "GroupLevel", "VizLevel")
)
```

## Arguments

- df:

  `data.frame` A data frame to wrangle.

- chrExcludes:

  `character` Terms to *not* include in the returned vector.

## Value

A character vector of categorical-like field names. Currently this
include all characters and factors for which at least 1 value is
repeated.
