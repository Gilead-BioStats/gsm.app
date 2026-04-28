# Check that an object has all required fields

Check that an object has all required fields

## Usage

``` r
CheckHasAllFields(
  x,
  chrRequiredFields,
  strWhat = rlang::caller_arg(x),
  envCall = rlang::caller_env()
)
```

## Arguments

- x:

  An object to validate.

- chrRequiredFields:

  `character` A vector of names of required fields in an object.

- strWhat:

  `character` A sentence-case description of the object being inspected.

- envCall:

  `environment` The environment from which this function was called, for
  use in better error messages. This value should usually be left as the
  default, or passed from the calling function if the calling function
  also has an `envCall` argument.

## Value

The validated object.
