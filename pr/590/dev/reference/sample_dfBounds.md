# Metric Bounds Dataset

Information about the bounds used to flag metrics.

## Usage

``` r
sample_dfBounds
```

## Format

A tibble with 59688 rows and 8 columns:

- Threshold:

  number of standard deviations that the upper and lower bounds are
  based on

- Denominator:

  calculated denominator value

- LogDenominator:

  calculated log denominator value

- Numerator:

  calculated numerator value

- Metric:

  calculated rate/metric value

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
[`sample_dfGroups`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfGroups.md),
[`sample_dfMetrics`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfMetrics.md),
[`sample_dfResults`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfResults.md),
[`sample_fnCountData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnCountData.md),
[`sample_fnFetchData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnFetchData.md)
