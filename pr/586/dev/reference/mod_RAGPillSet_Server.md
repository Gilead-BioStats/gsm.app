# Set of RAG Toggle Pills Server

Set of RAG Toggle Pills Server

## Usage

``` r
mod_RAGPillSet_Server(
  id,
  dfResults,
  rctv_strGroupLevel,
  rctv_strGroupSubset = reactive("red"),
  strLabel = "KRIs"
)
```

## Arguments

- id:

  `character` The id for this element.

- dfResults:

  `data.frame` A stacked summary of analysis pipeline output. Created
  with
  [`gsm.reporting::BindResults()`](https://gilead-biostats.github.io/gsm.reporting/reference/BindResults.html).

- rctv_strGroupLevel:

  `reactive character` A
  [`shiny::reactiveVal()`](https://rdrr.io/pkg/shiny/man/reactiveVal.html)
  object that returns the selected `GroupLevel`.

- rctv_strGroupSubset:

  `reactive character` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns the selected subset of groups to include in the
  table.

- strLabel:

  `character` The label of a field.

## Value

A [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
with the state of the selection as a string.
