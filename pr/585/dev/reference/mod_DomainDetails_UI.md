# Domain Details UI

Domain Details UI

## Usage

``` r
mod_DomainDetails_UI(
  id,
  chrDomains = c(AE = "Adverse Events", DATACHG = "Data Changes", DATAENT = "Data Entry",
    ENROLL = "Enrollment", LB = "Lab", PD = "Protocol Deviations", QUERY = "Queries",
    STUDCOMP = "Study Completion", SUBJ = "Subject Metadata", SDRGCOMP =
    "Treatment Completion")
)
```

## Arguments

- id:

  `character` The id for this element.

- chrDomains:

  `character` A (named) vector of domains to include in the app. The
  values of the vector will be used as labels, and the names will be
  used as IDs. The IDs will be passed to `fnFetchData()` to fetch data
  about that domain.

## Value

A
[`bslib::navset_underline()`](https://rstudio.github.io/bslib/reference/navset.html)
with a tab for each available domain.
