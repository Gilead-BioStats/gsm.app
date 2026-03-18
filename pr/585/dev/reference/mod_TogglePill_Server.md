# Toggle Pill Module Server

Toggle Pill Module Server

## Usage

``` r
mod_TogglePill_Server(
  id,
  rctv_strLabel = reactive("0 Red KRIs"),
  rctv_lglState = reactive(FALSE)
)
```

## Arguments

- id:

  `character` The id for this element.

- rctv_strLabel:

  `reactive character` Label to set.

- rctv_lglState:

  `reactive logical` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)\]
  object that returns a Boolean value indicating whether something is
  "off" (`FALSE`) or "on" (`TRUE`).

## Value

A
[`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
indicating whether the pill is "on" (`TRUE`) or "off" (`FALSE`).
