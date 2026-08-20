# List of reactive domain dfs

List of reactive domain dfs

## Usage

``` r
mod_dfDomains_Server(
  id,
  fnFetchData,
  chrDomains,
  dfSubjectGroups,
  l_rctvDomainsLoaded,
  rctv_dSnapshotDate,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID
)
```

## Arguments

- id:

  `character` The id for this element.

- fnFetchData:

  `function` A function that takes a `strDomainID` argument and optional
  `strGroupID`, `strGroupLevel`, `strSubjectID`, and/or `dSnapshotDate`,
  and returns a data.frame. See
  [`sample_fnFetchData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnFetchData.md)
  for an example. The returned data.frame contains information about the
  named domain. If the function throws an error, the error is elevated
  to the user, so you can use errors to pass requirements through to the
  user.

- chrDomains:

  `character` A (named) vector of domains to include in the app. The
  values of the vector will be used as labels, and the names will be
  used as IDs. The IDs will be passed to `fnFetchData()` to fetch data
  about that domain.

- dfSubjectGroups:

  `data.frame` A subset of `dfGroups` with `GroupLevel`, `GroupID`, and
  `SubjectID`.

- l_rctvDomainsLoaded:

  `list` A named list of lists of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects. Each list contains a "Study" element and an element per group
  level, each of which returns a `logical` (`FALSE` if the data has not
  been accessed, `TRUE` if it has).

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

A list of
[`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)s with
domain dfs.
