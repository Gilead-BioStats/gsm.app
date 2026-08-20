# Error messaging for this package.

Error messaging for this package.

## Usage

``` r
gsmappAbort(
  chrMessage,
  strClass,
  ...,
  envCall = rlang::caller_env(),
  envEvaluate = rlang::caller_env()
)
```

## Arguments

- chrMessage:

  `character` A vector of message elements to be formatted via
  [`cli::cli_bullets()`](https://cli.r-lib.org/reference/cli_bullets.html).

- strClass:

  `character` A descriptive label for this type of error, in
  lower_snake_case.

- ...:

  Passed to
  [`rlang::abort()`](https://rlang.r-lib.org/reference/abort.html),
  [`rlang::warn()`](https://rlang.r-lib.org/reference/abort.html) or
  [`rlang::inform()`](https://rlang.r-lib.org/reference/abort.html).

- envCall:

  `environment` The environment from which this function was called, for
  use in better error messages. This value should usually be left as the
  default, or passed from the calling function if the calling function
  also has an `envCall` argument.

- envEvaluate:

  `environment` The environment in which any variables used in the
  message or widget are defined. You almost definitely want to leave
  this as the default value.

## Value

An error condition with classes `"gsm.app-condition"`,
`"gsm.app-error"`, and `"gsm.app-error-{strClass}"`.
