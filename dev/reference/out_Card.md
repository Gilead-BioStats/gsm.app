# Standardized card

A standardized
[`bslib::card()`](https://rstudio.github.io/bslib/reference/card.html)
for gsm.app modules and modules in plugins for gsm.app. The `tagTitle`
is applied as a
[`bslib::card_title()`](https://rstudio.github.io/bslib/reference/card_body.html),
and `full_screen` is set to `TRUE` by default.

## Usage

``` r
out_Card(
  tagTitle,
  ...,
  id = NULL,
  strFullScreenPosition = c("top", "bottom", "none")
)
```

## Arguments

- tagTitle:

  `html tag` A string or other html to use as the title of the card.
  Will be wrapped inside
  [`bslib::card_title()`](https://rstudio.github.io/bslib/reference/card_body.html).

- ...:

  `html tags` Objects to place in the card.

- id:

  `character` The id for this element.

- strFullScreenPosition:

  `length-1 character` Used to set the `full_screen` argument of
  [`bslib::card()`](https://rstudio.github.io/bslib/reference/card.html),
  and, if necessary, update styling to position the "expand" button. The
  default value `"top"` sets `full_screen` to `TRUE` and positions the
  button at the top-right corner of the card. The value `"bottom"`
  positions the button at the bottom-right of the card, and the value
  `"none"` sets `full_screen` to `FALSE`.

## Value

A
[`bslib::card()`](https://rstudio.github.io/bslib/reference/card.html).

## Examples

``` r
ns <- shiny::NS("MyModule")
out_Card(
  "Domain Summary",
  shiny::textOutput(ns("text")),
  id = ns("card")
)
#> <div>
#>   <style>#MyModule-card .bslib-full-screen-enter { bottom: unset !important; }</style>
#>   <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="MyModule-card">
#>     <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
#>       <h5>Domain Summary</h5>
#>       <div id="MyModule-text" class="shiny-text-output"></div>
#>     </div>
#>     <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
#>       <template>Expand</template>
#>       <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
#>     </bslib-tooltip>
#>     <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
#>   </div>
#> </div>
```
