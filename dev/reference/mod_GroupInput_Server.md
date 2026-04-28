# Group and GroupLevel Dropdown Menu Server

Group and GroupLevel Dropdown Menu Server

## Usage

``` r
mod_GroupInput_Server(id, lGroups, rctv_strGroupID, rctv_strGroupLevel)
```

## Arguments

- id:

  `character` The id for this element.

- lGroups:

  `list` Named list of character vectors, in which the names are the
  group levels and the vectors are the group IDs within that group
  level.

- rctv_strGroupID:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the `GroupID` of the selected group (usually
  site), and can be used to update which group is selected.

- rctv_strGroupLevel:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the selected `GroupLevel`.

## Value

[`shiny::observe()`](https://rdrr.io/pkg/shiny/man/observe.html) objects
to keep `GroupLevel` and `Group` inputs and reactives up-to-date.
