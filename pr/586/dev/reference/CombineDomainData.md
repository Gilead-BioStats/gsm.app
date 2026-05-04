# Combine domain data

Combine domain data

## Usage

``` r
CombineDomainData(dfDomain_Study, dfDomain_Group, dfDomain_Participant)
```

## Arguments

- dfDomain_Study:

  `data.frame` Detailed data about a specific domain, such as "Adverse
  Events", at the study level.

- dfDomain_Group:

  `data.frame` Detailed data about a specific domain, such as "Adverse
  Events", at the group level.

- dfDomain_Participant:

  `data.frame` Detailed data about a specific domain, such as "Adverse
  Events", at the participant level.

## Value

The combined data, with the `VizLevel` column as a factor.
