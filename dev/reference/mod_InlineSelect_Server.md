# Inline virtual select input server

Inline virtual select input server

## Usage

``` r
mod_InlineSelect_Server(
  id,
  rctv_chrChoices = NULL,
  rctv_strLabel = NULL,
  rctv_strSelected = NULL,
  rctv_lglDisable = NULL,
  rctv_chrDisabledChoices = NULL,
  rctv_lglOpen = NULL
)
```

## Arguments

- id:

  `character` The id for this element.

- rctv_chrChoices:

  `reactive character` Choices to set.

- rctv_strLabel:

  `reactive character` Label to set.

- rctv_strSelected:

  `reactive character` Selected value to set.

- rctv_lglDisable:

  `reactive logical` Whether to disable the menu.

- rctv_chrDisabledChoices:

  `reactive character` Choices to disable.

- rctv_lglOpen:

  `reactive logical` Whether to open (`TRUE`) or close (`FALSE`) the
  menu.
