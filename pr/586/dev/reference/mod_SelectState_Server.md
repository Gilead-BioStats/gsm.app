# Select State Server

A testable module that calculates the state of a cascading select input.

## Usage

``` r
mod_SelectState_Server(
  id,
  rctv_strDependent,
  l_chrChoices,
  lglUpdateLabel,
  rctv_strCurrentSelection
)
```

## Arguments

- id:

  `character` The id for this element.

- rctv_strDependent:

  `reactive` The reactive string value that this module's selection
  depends on.

- l_chrChoices:

  `list` A named list where names correspond to values from
  `rctv_strDependent` and values are the character vectors of choices.

- lglUpdateLabel:

  `logical` A flag indicating whether to update the select input's label
  with the value of `rctv_strDependent`.

- rctv_strCurrentSelection:

  `reactive` The currently selected value from the select input UI.

## Value

A `list` of `reactives`: `rctv_chrChoices`, `rctv_strLabel`, and
`rctv_strSelected`.
