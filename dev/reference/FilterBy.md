# Filter by a detected field

Filter by a detected field

## Usage

``` r
FilterBy(df, Value, strField = ExtractFieldName(rlang::caller_arg(Value)))
```

## Arguments

- df:

  A data.frame to filter.

- Value:

  The value to filter on.

- strField:

  The name of the field. Auto-detected by default from the variable used
  to provide `Value`.

## Value

The filtered data.frame.
