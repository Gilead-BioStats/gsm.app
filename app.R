# Launch the ShinyApp (Do not remove this comment)
# To deploy, run: rsconnect::deployApp()
# Or use the blue button on top of this file
pkgload::load_all(".", helpers = FALSE, attach_testthat = FALSE)

run_sample_gsm_app(
  strFavicon = Sys.getenv("GSMAPP_FAVICON", "angles-up"),
  strFaviconColor = Sys.getenv("GSMAPP_FAVICONCOLOR", colorScheme("red"))
)
