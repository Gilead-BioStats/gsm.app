# Group Metadata Dataset

Information about sites, countries, and the overall study in the sample
data.

## Usage

``` r
sample_dfGroups
```

## Format

A tibble with 574 rows and 4 columns:

- GroupID:

  grouping variable

- GroupLevel:

  level of grouping variable

- Param:

  Parameter of interest for the group

- Value:

  Value of specified Param

## Source

Generated from data in the `clindata` package, using the `gsm.mapping`
package.

## See also

Other sample data:
[`sample_dfAnalyticsInput`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfAnalyticsInput.md),
[`sample_dfBounds`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfBounds.md),
[`sample_dfMetrics`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfMetrics.md),
[`sample_dfResults`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfResults.md),
[`sample_fnCountData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnCountData.md),
[`sample_fnFetchData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnFetchData.md)
