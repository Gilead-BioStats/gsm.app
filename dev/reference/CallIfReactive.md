# Resolve a potential reactive object

Resolve a potential reactive object

## Usage

``` r
CallIfReactive(x)
```

## Arguments

- x:

  An object that might be reactive.

## Value

Either `x` (if `x` isn't reactive) or `x()`.
