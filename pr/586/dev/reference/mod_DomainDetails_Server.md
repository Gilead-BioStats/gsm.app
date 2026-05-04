# Domain Details server

Update Domain Details when the selected participant changes.

## Usage

``` r
mod_DomainDetails_Server(
  id,
  l_rctvDomains,
  l_rctvDomainHashes_Selection,
  rctv_strDomainID,
  rctv_intDomainCounts,
  rctv_strGroupLevel,
  rctv_strGroupID,
  rctv_strSubjectID,
  chrDomains,
  rctv_strPrimaryNavBar,
  l_rctvDomainsLoaded
)
```

## Arguments

- id:

  `character` The id for this element.

- l_rctvDomains:

  `list` A named list of lists of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects. Each list contains a "Study" element, a "Group" element, and
  a "Selection" element, each of which returns a domain dataframe.

- l_rctvDomainHashes_Selection:

  `list` A named list of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects, each of which returns the
  [`rlang::hash()`](https://rlang.r-lib.org/reference/hash.html) of a
  domain dataframe for the current filter.

- rctv_strDomainID:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the selected `DomainID` (such as "AE" or "SUBJ").

- rctv_intDomainCounts:

  `reactive integer` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the count of rows for the current selection for
  all domains.

- rctv_strGroupLevel:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the selected `GroupLevel`.

- rctv_strGroupID:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the `GroupID` of the selected group (usually
  site), and can be used to update which group is selected.

- rctv_strSubjectID:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the `SubjectID` of the selected participant.

- chrDomains:

  `character` A (named) vector of domains to include in the app. The
  values of the vector will be used as labels, and the names will be
  used as IDs. The IDs will be passed to `fnFetchData()` to fetch data
  about that domain.

- l_rctvDomainsLoaded:

  `list` A named list of lists of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects. Each list contains a "Study" element and an element per group
  level, each of which returns a `logical` (`FALSE` if the data has not
  been accessed, `TRUE` if it has).
