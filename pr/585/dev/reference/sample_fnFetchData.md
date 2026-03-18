# Fetch Data for a Domain

This is a sample function demonstrating the type of function the user
will supply to find additional data about a given domain.

## Usage

``` r
sample_fnFetchData(
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

A data.frame with information about the specified domain.

## See also

Other sample data:
[`sample_dfAnalyticsInput`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfAnalyticsInput.md),
[`sample_dfBounds`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfBounds.md),
[`sample_dfGroups`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfGroups.md),
[`sample_dfMetrics`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfMetrics.md),
[`sample_dfResults`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_dfResults.md),
[`sample_fnCountData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnCountData.md)

## Examples

``` r
head(sample_fnFetchData("AE"))
#> # A tibble: 6 × 12
#>   SubjectID GroupID aeser aest_dt    aeen_dt    mdrpt_nsv mdrsoc_nsv aetoxgr
#>   <chr>     <chr>   <chr> <date>     <date>     <chr>     <chr>      <chr>  
#> 1 S62489    0X2275  Y     2012-01-15 2012-01-18 term1     soc2       5      
#> 2 S29180    0X2275  N     2012-01-10 2012-01-12 term2     soc2       2      
#> 3 S91137    0X9558  Y     2012-01-19 2012-01-21 term2     soc2       2      
#> 4 S66326    0X6641  Y     2012-01-22 2012-01-24 term1     soc2       1      
#> 5 S37493    0X6161  N     2012-01-28 2012-01-31 term2     soc2       2      
#> 6 S65380    0X2352  N     2012-01-29 2012-01-30 term2     soc2       4      
#> # ℹ 4 more variables: aeongo <chr>, aerel <chr>, mincreated_dts <dttm>,
#> #   GroupLevel <chr>
head(sample_fnFetchData("AE", strGroupID = "0X6161"))
#> # A tibble: 6 × 12
#>   SubjectID GroupID aeser aest_dt    aeen_dt    mdrpt_nsv mdrsoc_nsv aetoxgr
#>   <chr>     <chr>   <chr> <date>     <date>     <chr>     <chr>      <chr>  
#> 1 S37493    0X6161  N     2012-01-28 2012-01-31 term2     soc2       2      
#> 2 S60729    0X6161  Y     2012-01-24 2012-01-25 term2     soc1       5      
#> 3 S37493    0X6161  Y     2012-01-17 2012-01-18 term2     soc2       2      
#> 4 S25765    0X6161  N     2012-01-14 2012-01-16 term1     soc2       5      
#> 5 S37493    0X6161  Y     2012-01-23 2012-01-25 term2     soc2       3      
#> 6 S20555    0X6161  N     2012-01-17 2012-01-19 term1     soc1       2      
#> # ℹ 4 more variables: aeongo <chr>, aerel <chr>, mincreated_dts <dttm>,
#> #   GroupLevel <chr>
head(sample_fnFetchData("AE", strSubjectID = "S60729"))
#> # A tibble: 4 × 12
#>   SubjectID GroupID aeser aest_dt    aeen_dt    mdrpt_nsv mdrsoc_nsv aetoxgr
#>   <chr>     <chr>   <chr> <date>     <date>     <chr>     <chr>      <chr>  
#> 1 S60729    0X6161  Y     2012-01-24 2012-01-25 term2     soc1       5      
#> 2 S60729    0X6161  N     2012-01-19 2012-01-20 term1     soc2       4      
#> 3 S60729    0X6161  N     2012-03-31 2012-04-03 term2     soc1       2      
#> 4 S60729    0X6161  Y     2012-03-21 2012-03-24 term1     soc2       4      
#> # ℹ 4 more variables: aeongo <chr>, aerel <chr>, mincreated_dts <dttm>,
#> #   GroupLevel <chr>
```
