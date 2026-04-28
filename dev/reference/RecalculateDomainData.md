# Update Date-based Fields

This function allows me to store domain data from a single snapshot and
then back calculate things that are cumulative within snapshots.

## Usage

``` r
RecalculateDomainData(df, strDomainID, dSnapshotDate = NULL)
```

## Arguments

- df:

  `data.frame` A data frame to wrangle.

- strDomainID:

  `character` The domain data.frame to load.

- dSnapshotDate:

  `Date` The date of a data snapshot.

## Value

The updated data.frame.
