# Construct Regex to Find Prefixes

Construct Regex to Find Prefixes

## Usage

``` r
MakePrefixRegex(
  chrPrefixes = c("chr", "df", "d", "fct", "int", "l", "num", "rctv", "str")
)
```

## Arguments

- chrPrefixes:

  `character` Argument "prefixes" (really can appear anywhere in the
  argument name, as long as they're preceded by either the beginning of
  the name or a non-alphanumeric character, and followed by a capital
  letter or a non-alphanumeric character).

## Value

A regex to find the prefixes (to remove them).
