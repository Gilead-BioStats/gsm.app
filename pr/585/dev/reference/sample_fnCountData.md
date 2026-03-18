# Count Data for a Domain

This is a sample function demonstrating the type of function the user
will supply to count rows of additional data available for a given
domain.

## Usage

``` r
sample_fnCountData(
  strDomainID = c("AE", "ENROLL", "LB", "PD", "SDRGCOMP", "STUDCOMP", "SUBJ", "DATACHG",
    "DATAENT", "QUERY"),
  strGroupID = NULL,
  strGroupLevel = "Site",
  strSubjectID = NULL,
  dSnapshotDate = NULL
)
```

## Arguments

- strDomainID:

  `character` The domain data.frame to load.

- strGroupID:

  `character` A `GroupID` of an individual site or other group within a
  study.

- strGroupLevel:

  `character` Value for the group level. Default: `NULL` and taken from
  `dfMetrics$GroupLevel` if available.

- strSubjectID:

  `character` A `SubjectID` of an individual participant.

- dSnapshotDate:

  `Date` The date of a data snapshot.

## Value

An integer signifying the number of rows available for the specified
domain.

## See also

Other sample data:
[`sample_dfAnalyticsInput`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfAnalyticsInput.md),
[`sample_dfBounds`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfBounds.md),
[`sample_dfGroups`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfGroups.md),
[`sample_dfMetrics`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfMetrics.md),
[`sample_dfResults`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfResults.md),
[`sample_fnFetchData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnFetchData.md)

## Examples

``` r
sample_fnCountData("AE")
#> [1] 514
sample_fnCountData("AE", strGroupID = "0X103")
#> [1] 0
sample_fnCountData("AE", strSubjectID = "1350")
#> [1] 0
```
