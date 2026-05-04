# KRI Results Dataset

Information about the status of each group in the sample data.

## Usage

``` r
sample_dfResults
```

## Format

A tibble with 1073 rows and 10 columns:

- GroupID:

  grouping variable

- GroupLevel:

  level of grouping variable

- Numerator:

  number of flags in group

- Denominator:

  total subjects in group

- Metric:

  calculated rate/metric value

- Score:

  statistical score

- Flag:

  ordinal flag to be applied

- MetricID:

  unique metric identifier

- StudyID:

  unique study identifier

- SnapshotDate:

  date of the snapshot

## Source

Generated from data in the `clindata` package, using the `gsm.mapping`
package.

## See also

Other sample data:
[`sample_dfAnalyticsInput`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfAnalyticsInput.md),
[`sample_dfBounds`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfBounds.md),
[`sample_dfGroups`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfGroups.md),
[`sample_dfMetrics`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfMetrics.md),
[`sample_fnCountData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnCountData.md),
[`sample_fnFetchData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnFetchData.md)
