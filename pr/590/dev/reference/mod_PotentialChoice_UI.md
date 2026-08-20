# Potential Choice Select Input UI

Renders a select input only if there is more than one choice.

## Usage

``` r
mod_PotentialChoice_UI(id, chrChoices, strLabel)
```

## Arguments

- id:

  `character` The id for this element.

- chrChoices:

  `character` A (named, optionally) vector of choices for this input.

- strLabel:

  `character` The label of a field.

## Value

A
[`mod_NavSelect_UI()`](https://gilead-biostats.github.io/gsm.app/dev/reference/mod_NavSelect_UI.md)
element or `NULL`.
