# Card click detection JavaScript

Card click detection JavaScript

## Usage

``` r
out_DetectCardClicks(strContainerID, strInputID)
```

## Arguments

- strContainerID:

  `character` The (namespaced) ID of the target container (usually a
  div).

- strInputID:

  `character` An ID to use for the Shiny input created by this module or
  used by this JavaScript.

## Value

A
[`shiny::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)
with the JavaScript required to enable card click detection within the
specified container. Clicks will be reported to the Shiny input named
`strInputID`.
