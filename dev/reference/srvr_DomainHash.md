# Reactive domain df

Reactive domain df

## Usage

``` r
srvr_DomainHash(
  rctv_dfDomain,
  strDomainID,
  rctv_dSnapshotDate,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID,
  strCache = NULL
)
```

## Arguments

- rctv_dfDomain:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a domain dataframe.

- strDomainID:

  `character` The domain data.frame to load.

- rctv_dSnapshotDate:

  `reactive Date` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the date of a data snapshot.

- rctv_strGroupID:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the `GroupID` of the selected group (usually
  site), and can be used to update which group is selected.

- rctv_strGroupLevel:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the selected `GroupLevel`.

- rctv_strSubjectID:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the `SubjectID` of the selected participant.

- strCache:

  `character` An additional string to ensure that a cache key is unique.

## Value

A [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
that generates a hash of a domain df.
