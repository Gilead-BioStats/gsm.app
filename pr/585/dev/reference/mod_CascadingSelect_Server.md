# Cascading Select Input Server

Cascading Select Input Server

## Usage

``` r
mod_CascadingSelect_Server(
  id,
  rctv_strDependent,
  l_chrChoices,
  rctv_strSelection,
  lglUpdateLabel = FALSE
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

- rctv_strSelection:

  `reactiveVal` A `reactiveVal` from the parent scope that this module
  will update with its selection.

- lglUpdateLabel:

  `logical` A flag indicating whether to update the select input's label
  with the value of `rctv_strDependent`.

## Value

The server function does not return a value.
