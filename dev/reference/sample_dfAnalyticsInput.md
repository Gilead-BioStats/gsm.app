# Analytics Input Dataset

Summary metric data for the "Group Subjects" module on the "Metric
Details" tab.

## Usage

``` r
sample_dfAnalyticsInput
```

## Format

A tibble with 6490 rows and 8 columns:

- MetricID:

  metric identifier

- SubjectID:

  unique subject identifier

- GroupID:

  grouping variable

- GroupLevel:

  level of grouping variable

- Numerator:

  numerator for this individual

- Denominator:

  denominator for this individual

- Metric:

  calculated rate/metric value

- SnapshotDate:

  The snapshot with which this data is associated. We currently only use
  the most recent SnapshotDate

## Source

Generated from data in the `clindata` package, using the `gsm.mapping`
package.

## See also

Other sample data:
[`sample_dfBounds`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfBounds.md),
[`sample_dfGroups`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfGroups.md),
[`sample_dfMetrics`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfMetrics.md),
[`sample_dfResults`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfResults.md),
[`sample_fnCountData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnCountData.md),
[`sample_fnFetchData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnFetchData.md)
