# gsm Color Scheme

Choose a color from the "official" colors of the gsm family of packages.

## Usage

``` r
ColorScheme(
  strColorName = c("gray", "green", "amber", "red"),
  strColorFamily = c("dark", "light")
)
```

## Arguments

- strColorName:

  `character` The target color to report about.

- strColorFamily:

  `character` Whether to load the `"dark"` version of this color, or the
  `"light"` version. Default: `"dark"`.

## Value

The hex code of a color.

## Examples

``` r
ColorScheme("gray")
#> [1] "#828282"
ColorScheme("gray", "light")
#> [1] "#E5E5E5"
ColorScheme("green")
#> [1] "#3DAF06"
ColorScheme("amber")
#> [1] "#FEAA02"
ColorScheme("red")
#> [1] "#FF5859"
```
