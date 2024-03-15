# `inst/sampledata`

### Contents:

- `snapshot.qs`

- This is a [qs file](https://cran.r-project.org/web/packages/qs/index.html), which is a data file similar to `.rda`. The `.qs` format loads much faster and makes development and deployment of the app using sample data much easier.


### Updating data:

- See `utils-data.R` / `update_sample_data()`. 

- TLDR; run `update_sample_data()` to overwrite the `snapshot.qs` file in this directory, using your local version of `{gsm}`.
