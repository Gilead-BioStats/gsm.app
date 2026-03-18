# Count Domain Data

Count Domain Data

## Usage

``` r
srvr_DomainCounts(
  id,
  fnCountData,
  chrDomains,
  rctv_dSnapshotDate,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID
)
```

## Arguments

- id:

  `character` The id for this element.

- fnCountData:

  `function` A function that takes a `strDomainID` argument and optional
  `strGroupID`, `strGroupLevel`, `strSubjectID`, and/or `dSnapshotDate`,
  and returns an integer count of the number of rows in that filtered
  domain. By default, this function is constructed using `fnFetchData()`
  and
  [`ConstructDataCounter()`](https://gilead-biostats.github.io/gsm.app/dev/reference/ConstructDataCounter.md).

- chrDomains:

  `character` A (named) vector of domains to include in the app. The
  values of the vector will be used as labels, and the names will be
  used as IDs. The IDs will be passed to `fnFetchData()` to fetch data
  about that domain.

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

## Value

A [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html),
which returns a named integer with counts for the current selection.
