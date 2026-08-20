# Filter Domain Data by Relevant Fields

Filter Domain Data by Relevant Fields

## Usage

``` r
FilterDomainData(
  df,
  strDomainID,
  dSnapshotDate = NULL,
  dfGroups = NULL,
  strGroupLevel = NULL,
  strGroupID = NULL,
  strSubjectID = NULL
)
```

## Arguments

- df:

  `data.frame` A data frame to wrangle.

- strDomainID:

  `character` The domain data.frame to load.

- dSnapshotDate:

  `Date` The date of a data snapshot.

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-public.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

- strGroupLevel:

  `character` Value for the group level. Default: `NULL` and taken from
  `dfMetrics$GroupLevel` if available.

- strGroupID:

  `character` A `GroupID` of an individual site or other group within a
  study.

- strSubjectID:

  `character` A `SubjectID` of an individual participant.

## Value

The data.frame, with filters applied.
