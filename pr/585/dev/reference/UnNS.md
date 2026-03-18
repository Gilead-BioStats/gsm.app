# Remove a namespace from an id.

Remove a namespace from an id.

## Usage

``` r
UnNS(id, ns)
```

## Arguments

- id:

  `character` The id for this element.

- ns:

  A function to apply a namespace to an object, such as the ones
  produced using [`shiny::NS()`](https://rdrr.io/pkg/shiny/man/NS.html)
  or the one available as `session$ns()` in a Shiny server function.

## Value

`id` minus the namespace.
