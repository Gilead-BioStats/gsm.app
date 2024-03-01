if (!interactive()) {
    sink(stderr(), type = "output")
    tryCatch({
        library(gsmApp)
    }, error = function(e) {
        devtools::load_all()
    })
} else {
    devtools::load_all()
}

# Launch the app
gsmApp::run_app()
