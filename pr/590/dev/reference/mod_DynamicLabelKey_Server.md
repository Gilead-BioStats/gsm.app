# Activate/inactivate buttons and return values

Activate/inactivate buttons and return values

## Usage

``` r
mod_DynamicLabelKey_Server(
  id,
  rctv_strGroupLevel,
  rctv_strGroupID,
  rctv_strSubjectID
)
```

## Arguments

- id:

  `character` The id for this element.

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

A list of
[`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
objects to determine whether the given button is selected.
