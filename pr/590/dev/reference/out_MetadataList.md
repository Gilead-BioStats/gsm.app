# Metadata list card

Display label-value pairs as a vertical list, with a consistent spacer
between the label and value.

## Usage

``` r
out_MetadataList(chrValues, chrLabels = names(chrValues))
```

## Arguments

- chrValues:

  `character` A vector of values to associate with a vector of labels.

- chrLabels:

  `character` A vector of labels for display to the user.

## Value

A
[`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)
of label-value pairs, including the CSS needed to lay them out properly.

## Examples

``` r
out_MetadataList(
  c("value 1", "value 2", "value 3"),
  c("Thing 1", "Thing 2", "Thing 3")
)
#> <div class="metadata-list-item">
#>   <div class="metadata-list-item-label">Thing 1</div>
#>   <div class="metadata-list-item-spacer"></div>
#>   <div class="metadata-list-item-value">value 1</div>
#> </div>
#> <div class="metadata-list-item">
#>   <div class="metadata-list-item-label">Thing 2</div>
#>   <div class="metadata-list-item-spacer"></div>
#>   <div class="metadata-list-item-value">value 2</div>
#> </div>
#> <div class="metadata-list-item">
#>   <div class="metadata-list-item-label">Thing 3</div>
#>   <div class="metadata-list-item-spacer"></div>
#>   <div class="metadata-list-item-value">value 3</div>
#> </div>
```
