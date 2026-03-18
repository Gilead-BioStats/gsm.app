# Load a Function for a Plugin

Use this function to translate a function definition that might be given
as text (such as
[`dplyr::filter`](https://dplyr.tidyverse.org/reference/filter.html) in
a yaml file) to a usable R function.

## Usage

``` r
AsFunction(strFunction)

# Default S3 method
AsFunction(strFunction)

# S3 method for class 'character'
AsFunction(strFunction)
```

## Arguments

- strFunction:

  `character` The name of a function, with or without namespace
  ("reactive" or "shiny::reactive"). If a namespace is supplied, we
  check that the package is installed, and attach it. The function can
  also be supplied as a function or a purrr-style formula. See
  [`rlang::as_function()`](https://rlang.r-lib.org/reference/as_function.html)
  (the `x` argument) for more details.

## Value

The function, if it can be found.
