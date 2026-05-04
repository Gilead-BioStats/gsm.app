# Card subtitle

Card subtitle

## Usage

``` r
out_CardSubtitle(tagTitle, chrAdditionalClass = character())
```

## Arguments

- tagTitle:

  `html tag` A string or other html to use as the title of the card.
  Will be wrapped inside
  [`bslib::card_title()`](https://rstudio.github.io/bslib/reference/card_body.html).

- chrAdditionalClass:

  `character` One or more additional classes to apply to the subtitle.

## Value

A
[`bslib::card_title()`](https://rstudio.github.io/bslib/reference/card_body.html)
with appropriate classes.
