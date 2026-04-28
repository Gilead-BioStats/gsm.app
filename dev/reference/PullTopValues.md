# Find frequent values

Find frequent values

## Usage

``` r
PullTopValues(dfDomain, strCategory)
```

## Arguments

- dfDomain:

  `data.frame` Detailed data about a specific domain, such as "Adverse
  Events".

- strCategory:

  `character` A category to focus on.

## Value

An ordered character vector of the top 6 categories (or fewer if there
are fewer than 6 total categories in the data).
