# Check whether an input is set

Check whether an input is set

## Usage

``` r
CheckInputUnset(strInputName, chrRequiredInputs, strValue)
```

## Arguments

- strInputName:

  `character` The name of an input. One of `"group"`, `"level"`,
  `"participant"`, or `"domain"`.

- chrRequiredInputs:

  `character` An optional vector of any inputs ("metric", "group",
  "group level", "participant", or "domain") that must have a non-empty
  value before the plugin can load. "None" and "All" count as "empty"
  for this check. If the user has not set a value for that input, the
  app will display a placeholder instructing the user to make a
  selection.

- strValue:

  `character` The value of a field.

## Value

`strInputName` if the input is required and is not set, or
[`character()`](https://rdrr.io/r/base/character.html) if it isn't
required or is set.
