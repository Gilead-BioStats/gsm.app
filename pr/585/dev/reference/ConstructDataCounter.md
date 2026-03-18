# Construct a Data Count Function

It is often faster to fetch *counts* of data, rather than the entire
dataset. If your `fnFetchData()` function is already fast, however, this
function allows you to construct a simple data counter from your data
fetcher.

## Usage

``` r
ConstructDataCounter(fnFetchData)
```

## Arguments

- fnFetchData:

  `function` A function that takes a `strDomainID` argument and optional
  `strGroupID`, `strGroupLevel`, `strSubjectID`, and/or `dSnapshotDate`,
  and returns a data.frame. See
  [`sample_fnFetchData()`](https://gilead-biostats.github.io/gsm.app/dev/reference/sample_fnFetchData.md)
  for an example. The returned data.frame contains information about the
  named domain. If the function throws an error, the error is elevated
  to the user, so you can use errors to pass requirements through to the
  user.

## Value

A function that returns counts of rows in the specified domain data.

## Examples

``` r
fnDataCounter <- ConstructDataCounter(sample_fnFetchData)
fnDataCounter("AE") == nrow(sample_fnFetchData("AE"))
#> [1] TRUE
```
