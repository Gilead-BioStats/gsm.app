# Metric Metadata Dataset

Information about the metrics included in the sample data.

## Usage

``` r
sample_dfMetrics
```

## Format

A tibble with 23 rows and 17 columns:

- MetricID:

  unique metric identifier

- File:

  yaml file for workflow

- GroupLevel:

  level of grouping variable

- Abbreviation:

  abbreviation for the metric

- Metric:

  name of the metric

- Numerator:

  data source for the numerator

- Denominator:

  data source for the denominator

- Model:

  model used to calculate metric

- Score:

  type of score reported

- Type:

  statistical outcome type

- Threshold:

  thresholds to be used for bounds and flags

- nMinDenominator:

  minimum denominator required to return a score and calculate a flag

## Source

Generated from data in the `clindata` package, using the `gsm.mapping`
package.

## See also

Other sample data:
[`sample_dfAnalyticsInput`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfAnalyticsInput.md),
[`sample_dfBounds`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfBounds.md),
[`sample_dfGroups`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfGroups.md),
[`sample_dfResults`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfResults.md),
[`sample_fnCountData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnCountData.md),
[`sample_fnFetchData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnFetchData.md)
