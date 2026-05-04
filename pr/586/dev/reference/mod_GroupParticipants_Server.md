# Group Participants Server

Group Participants Server

## Usage

``` r
mod_GroupParticipants_Server(
  id,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID,
  rctv_dfAnalyticsInput,
  rctv_lColumnNames
)
```

## Arguments

- id:

  `character` The id for this element.

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

- rctv_lColumnNames:

  `reactive list` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns a named list of column names to substitute into
  tables for display.

## Value

A
[`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
with the id of the participant selected in the table.
