# Domain Data Server

Display a specific (named) table, or a placeholder.

## Usage

``` r
mod_DomainData_Server(
  id,
  rctv_dfDomain,
  rctv_strDomainHash,
  rctv_dfDomain_Study,
  rctv_dfDomain_Group,
  rctv_strGroupLevel,
  rctv_strGroupID,
  rctv_strSubjectID,
  l_rctvDomainLoaded
)
```

## Arguments

- id:

  `character` The id for this element.

- rctv_dfDomain:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a domain dataframe.

- rctv_strDomainHash:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the the
  [`rlang::hash()`](https://rlang.r-lib.org/reference/hash.html) of a
  domain dataframe.

- rctv_dfDomain_Study:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a study-level domain dataframe.

- rctv_dfDomain_Group:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a group-level domain dataframe.

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

- l_rctvDomainLoaded:

  `list` A named list of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects. The list contains a "Study" element and an element per group
  level, each of which returns a `logical` (`FALSE` if the data has not
  been accessed, `TRUE` if it has).

## Value

A [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
with the SubjectID for each row that is selected. Currently not useful
but will be converted to row numbers when we need it for deeper dives.
