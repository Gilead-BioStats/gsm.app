# Find interesting digits for rounding

Find interesting digits for rounding

## Usage

``` r
FindNonZeroDecimals(dblX, intMaxDecimals = 5L)
```

## Arguments

- dblX:

  A vector of numbers (usually with decimal places).

- intMaxDecimals:

  The maximum number of decimal places to keep.

## Value

An integer between `0` and `intMaxDecimals`, representing the number of
decimal places to keep.
