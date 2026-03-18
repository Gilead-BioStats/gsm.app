# List of ActionLinks UI

Display a vertical list of
[`shiny::actionLink()`](https://rdrr.io/pkg/shiny/man/actionButton.html)
items, along with a corresponding vertical list of values associated
with those links.

## Usage

``` r
mod_ActionList_UI(id, chrLinkIDs, chrLabels, chrValues)
```

## Arguments

- id:

  `character` The id for this element.

- chrLinkIDs:

  `character` Module ids for multiple modules.

- chrLabels:

  `character` A vector of labels for display to the user.

- chrValues:

  `character` A vector of values to associate with a vector of labels.

## Value

A
[`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)
of labels and values, where the labels are
[`shiny::actionLink()`](https://rdrr.io/pkg/shiny/man/actionButton.html)
items.

## Examples

``` r
mod_ActionList_UI(
  "demo",
  c("link1", "link2", "link3"),
  c("Label 1", "Label 2", "Label 3"),
  c("value 1", "value 2", "value 3")
)
#> <div class="metadata-list-item">
#>   <div class="metadata-list-item-label">
#>     <a id="demo-link1" href="#" class="action-button action-link"><span class="action-label">Label 1</span></a>
#>   </div>
#>   <div class="metadata-list-item-spacer"></div>
#>   <div class="metadata-list-item-value">value 1</div>
#> </div>
#> <div class="metadata-list-item">
#>   <div class="metadata-list-item-label">
#>     <a id="demo-link2" href="#" class="action-button action-link"><span class="action-label">Label 2</span></a>
#>   </div>
#>   <div class="metadata-list-item-spacer"></div>
#>   <div class="metadata-list-item-value">value 2</div>
#> </div>
#> <div class="metadata-list-item">
#>   <div class="metadata-list-item-label">
#>     <a id="demo-link3" href="#" class="action-button action-link"><span class="action-label">Label 3</span></a>
#>   </div>
#>   <div class="metadata-list-item-spacer"></div>
#>   <div class="metadata-list-item-value">value 3</div>
#> </div>
```
