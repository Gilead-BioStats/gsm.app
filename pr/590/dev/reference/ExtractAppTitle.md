# Extract an App Title from dfGroups

Extract the "nickname", "protocol_title", or "studyid" of the study from
`dfGroup` to use as a title for the app.

## Usage

``` r
ExtractAppTitle(dfGroups)
```

## Arguments

- dfGroups:

  `data.frame` Group-level metadata dictionary. See
  [`vignette("DataReporting", package = "gsm.reporting")`](https://gilead-public.github.io/gsm.reporting/articles/DataReporting.html)
  for an example.

## Value

A length-1 character vector with the first available of "nickname",
"protocol_title", or "studyid", if any are available as a `Param` in
`dfGroups` with `GroupLevel == "Study"`, truncated to at most 30
characters. If none of those are available, `"GSM Deep Dive"`.

## Examples

``` r
ExtractAppTitle(sample_dfGroups)
#> [1] "TREE-71"
ExtractAppTitle(
  data.frame(
    GroupLevel = "Study",
    Param = "nickname",
    Value = "This is a very long nickname which will be truncated"
  )
)
#> [1] "This is a very long nicknam..."
```
