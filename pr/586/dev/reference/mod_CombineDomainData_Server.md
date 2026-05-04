# Pseudo-module to cleanly combine domain dfs

Pseudo-module to cleanly combine domain dfs

## Usage

``` r
mod_CombineDomainData_Server(
  id,
  l_rctvActive,
  rctv_dfDomain_Study,
  rctv_dfDomain_Group,
  rctv_dfDomain,
  rctv_strGroupLevel,
  rctv_strGroupID,
  rctv_strSubjectID
)
```

## Arguments

- id:

  `character` The id for this element.

- l_rctvActive:

  `list` A named list of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects, each of which returns a populated character vector or
  something that becomes `NULL` when passed through
  [`NullifyEmpty()`](https://gilead-biostats.github.io/gsm.app/dev/reference/NullifyEmpty.md).

- rctv_dfDomain_Study:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a study-level domain dataframe.

- rctv_dfDomain_Group:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a group-level domain dataframe.

- rctv_dfDomain:

  `reactive dataframe` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a domain dataframe.

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

## Value

A `reactive` that returns the combined domain data.
